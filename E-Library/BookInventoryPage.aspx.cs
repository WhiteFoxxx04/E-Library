using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Library
{
    public partial class BookInventoryPage : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static string global_filepath;
        static int global_actual_Stock, global_current_Stock, global_issued_books;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillAuthorPublisherValues();
            }

            grdViewBookInventory.DataBind();
        }

        protected void lnkBtnSearch_Click(object sender, EventArgs e)
        {
            getBookByID();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (checkIfBookExists())
            {
                Response.Write("<script>alert('Book Already Exists, try some other Book ID');</script>");
            }
            else
            {
                addNewBook();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            updateBookByID();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            deleteBookByID();
        }

        // user defined functions

        void deleteBookByID()
        {
            if (checkIfBookExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(connectionString);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE from tblBook_Master WHERE book_Id='" + txtBookId.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Book Deleted Successfully');</script>");
                    clearForm();
                    grdViewBookInventory.DataBind();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Invalid Member ID');</script>");
            }
        }

        void updateBookByID()
        {

            if (checkIfBookExists())
            {
                try
                {

                    int actual_Stock = Convert.ToInt32(txtActualStock.Text.Trim());
                    int current_Stock = Convert.ToInt32(txtCurrStock.Text.Trim());

                    if (global_actual_Stock == actual_Stock)
                    {

                    }
                    else
                    {
                        if (actual_Stock < global_issued_books)
                        {
                            Response.Write("<script>alert('Actual Stock value cannot be less than the Issued books');</script>");
                            return;
                        }
                        else
                        {
                            current_Stock = actual_Stock - global_issued_books;
                            txtBookCost.Text = "" + current_Stock;
                        }
                    }

                    string genres = "";
                    foreach (int i in lstGenre.GetSelectedIndices())
                    {
                        genres = genres + lstGenre.Items[i] + ",";
                    }
                    genres = genres.Remove(genres.Length - 1);

                    string filepath = "~/Images/Book_Inventory/books1";
                    string filename = Path.GetFileName(flUpload.PostedFile.FileName);
                    if (filename == "" || filename == null)
                    {
                        filepath = global_filepath;

                    }
                    else
                    {
                        flUpload.SaveAs(Server.MapPath("Images/Book_Inventory/" + filename));
                        filepath = "~/Images/Book_Inventory/" + filename;
                    }

                    SqlConnection con = new SqlConnection(connectionString);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("UPDATE book_master_tbl set book_Name=@book_Name, genre=@genre, author_Name=@author_Name, publisher_Name=@publisher_Name, publish_Date=@publish_Date, language=@language, edition=@edition, book_Cost=@book_Cost, no_of_Pages=@no_of_Pages, book_Description=@book_Description, actual_Stock=@actual_Stock, current_Stock=@current_Stock, book_img_Link=@book_img_Link where book_Id='" + txtBookId.Text.Trim() + "'", con);

                    cmd.Parameters.AddWithValue("@book_Name", txtBookName.Text.Trim());
                    cmd.Parameters.AddWithValue("@genre", genres);
                    cmd.Parameters.AddWithValue("@author_Name", ddlAuthorName.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@publisher_Name", ddlPublisherName.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@publish_Date", txtPublishedDate.Text.Trim());
                    cmd.Parameters.AddWithValue("@language", ddlLanguage.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@edition", txtEdition.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_Cost", txtBookCost.Text.Trim());
                    cmd.Parameters.AddWithValue("@no_of_Pages", txtPages.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_Description", txtBookDesc.Text.Trim());
                    cmd.Parameters.AddWithValue("@actual_Stock", actual_Stock.ToString());
                    cmd.Parameters.AddWithValue("@current_Stock", current_Stock.ToString());
                    cmd.Parameters.AddWithValue("@book_img_Link", filepath);


                    cmd.ExecuteNonQuery();
                    con.Close();
                    grdViewBookInventory.DataBind();
                    Response.Write("<script>alert('Book Updated Successfully');</script>");


                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Book ID');</script>");
            }
        }


        void getBookByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(connectionString);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from tblBook_Master WHERE book_Id='" + txtBookId.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    txtBookName.Text = dt.Rows[0]["book_Name"].ToString();
                    txtPublishedDate.Text = dt.Rows[0]["publish_Date"].ToString();
                    txtEdition.Text = dt.Rows[0]["edition"].ToString();
                    txtBookCost.Text = dt.Rows[0]["book_Cost"].ToString().Trim();
                    txtPages.Text = dt.Rows[0]["no_of_Pages"].ToString().Trim();
                    txtActualStock.Text = dt.Rows[0]["actual_Stock"].ToString().Trim();
                    txtCurrStock.Text = dt.Rows[0]["current_Stock"].ToString().Trim();
                    txtBookDesc.Text = dt.Rows[0]["book_Description"].ToString();
                    txtIssuedBooks.Text = "" + (Convert.ToInt32(dt.Rows[0]["actual_Stock"].ToString()) - Convert.ToInt32(dt.Rows[0]["current_Stock"].ToString()));

                    ddlLanguage.SelectedValue = dt.Rows[0]["language"].ToString().Trim();
                    ddlPublisherName.SelectedValue = dt.Rows[0]["publisher_Name"].ToString().Trim();
                    ddlAuthorName.SelectedValue = dt.Rows[0]["author_Name"].ToString().Trim();

                    lstGenre.ClearSelection();
                    string[] genre = dt.Rows[0]["genre"].ToString().Trim().Split(',');
                    for (int i = 0; i < genre.Length; i++)
                    {
                        for (int j = 0; j < lstGenre.Items.Count; j++)
                        {
                            if (lstGenre.Items[j].ToString() == genre[i])
                            {
                                lstGenre.Items[j].Selected = true;
                            }
                        }
                    }

                    global_actual_Stock = Convert.ToInt32(dt.Rows[0]["actual_Stock"].ToString().Trim());
                    global_current_Stock = Convert.ToInt32(dt.Rows[0]["current_Stock"].ToString().Trim());
                    global_issued_books = global_actual_Stock - global_current_Stock;
                    global_filepath = dt.Rows[0]["book_img_Link"].ToString();

                }
                else
                {
                    Response.Write("<script>alert('Invalid Book ID');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void fillAuthorPublisherValues()
        {
            try
            {
                SqlConnection con = new SqlConnection(connectionString);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT author_Name from tblAuthor_Master;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                ddlAuthorName.DataSource = dt;
                ddlAuthorName.DataValueField = "author_Name";
                ddlAuthorName.DataBind();

                cmd = new SqlCommand("SELECT publisher_Name from tblPublisher_Master;", con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                ddlPublisherName.DataSource = dt;
                ddlPublisherName.DataValueField = "publisher_Name";
                ddlPublisherName.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        bool checkIfBookExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(connectionString);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from tblBook_Master where book_Id='" + txtBookId.Text.Trim() + "' OR book_Name='" + txtBookName.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        void addNewBook()
        {
            try
            {
                string genres = "";
                foreach (int i in lstGenre.GetSelectedIndices())
                {
                    genres = genres + lstGenre.Items[i] + ",";
                }
                // genres = Adventure,Self Help,
                genres = genres.Remove(genres.Length - 1);

                string filepath = "~/Images/Book_Inventory/books1.png";
                string filename = Path.GetFileName(flUpload.PostedFile.FileName);
                flUpload.SaveAs(Server.MapPath("Images/Book_Inventory/" + filename));
                filepath = "~/Images/Book_Inventory/" + filename;


                SqlConnection con = new SqlConnection(connectionString);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO tblBook_Master(book_Id,book_Name,genre,author_Name,publisher_Name,publish_Date,language,edition,book_Cost,no_of_Pages,book_Description,actual_Stock,current_Stock,book_img_Link) values(@book_Id,@book_Name,@genre,@author_Name,@publisher_Name,@publish_Date,@language,@edition,@book_Cost,@no_of_Pages,@book_Description,@actual_Stock,@current_Stock,@book_img_Link)", con);

                cmd.Parameters.AddWithValue("@book_Id", txtBookId.Text.Trim());
                cmd.Parameters.AddWithValue("@book_Name", txtBookName.Text.Trim());
                cmd.Parameters.AddWithValue("@genre", genres);
                cmd.Parameters.AddWithValue("@author_Name", ddlAuthorName.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publisher_Name", ddlPublisherName.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publish_Date", txtPublishedDate.Text.Trim());
                cmd.Parameters.AddWithValue("@language", ddlLanguage.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@edition", txtEdition.Text.Trim());
                cmd.Parameters.AddWithValue("@book_Cost", txtBookCost.Text.Trim());
                cmd.Parameters.AddWithValue("@no_of_Pages", txtPages.Text.Trim());
                cmd.Parameters.AddWithValue("@book_Description", txtBookDesc.Text.Trim());
                cmd.Parameters.AddWithValue("@actual_Stock", txtActualStock.Text.Trim());
                cmd.Parameters.AddWithValue("@current_Stock", txtActualStock.Text.Trim());
                cmd.Parameters.AddWithValue("@book_img_Link", filepath);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Book added successfully.');</script>");
                grdViewBookInventory.DataBind();
                clearForm();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void clearForm()
        {
            txtBookId.Text = "";
            txtBookName.Text = "";
            txtPublishedDate.Text = "";
            txtActualStock.Text = "";
            txtBookCost.Text = "";
            txtCurrStock.Text = "";
            txtBookDesc.Text = "";
            txtEdition.Text = "";
            txtIssuedBooks.Text = "";
            txtPages.Text = "";
            ddlAuthorName.Text = "";
            ddlLanguage.Text = "";
            ddlPublisherName.Text = "";


        }
    }
}
