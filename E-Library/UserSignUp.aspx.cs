using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Library
{
    public partial class UserSignUp : System.Web.UI.Page
    {
        //globally declaring connection string
        string connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //Button click event
        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            if (checkMemberExist())
            {
                Response.Write("<script>alert('Member Already Exist with this Member ID, try other ID');</script>");
            }
            else
            {
                SignUpNewMember();
            }
        }
            //user define method to check if the same member id exits or not
            bool checkMemberExist()
            {
                try
                {
                    SqlConnection con = new SqlConnection(connectionString);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("Select * from tblMember_Master where member_Id = '" + txtUserID.Text.Trim() + "';", con);
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

            void SignUpNewMember()
            {
                try
                {
                    SqlConnection con = new SqlConnection(connectionString);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("Insert into tblMember_Master(member_Id, full_name, dob, contact_no, email, state, city, pincode, full_address, password, account_status) values (@member_Id, @full_name, @dob, @contact_no, @email, @state, @city, @pincode, @full_address, @password, @account_status)", con);
                    cmd.Parameters.AddWithValue("@member_id", txtUserID.Text.Trim());
                    cmd.Parameters.AddWithValue("@full_name", txtFullName.Text.Trim());
                    cmd.Parameters.AddWithValue("@dob", txtDOB.Text.Trim());
                    cmd.Parameters.AddWithValue("@contact_no", txtContactNumber.Text.Trim());
                    cmd.Parameters.AddWithValue("@email", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@state", ddlState.Text.Trim());
                    cmd.Parameters.AddWithValue("@city", txtCity.Text.Trim());
                    cmd.Parameters.AddWithValue("@pincode", txtZipcode.Text.Trim());
                    cmd.Parameters.AddWithValue("@full_address", txtAddress.Text.Trim());
                    cmd.Parameters.AddWithValue("@password", txtPassword.Text.Trim());
                    cmd.Parameters.AddWithValue("@account_status", "pending");
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Sign Up Successful. Go to User Login to Login');</script>");
                    Response.Redirect("loginpage.aspx");
                }
                catch (Exception ex)
                {
                    Response.Write("<script> alert('" + ex.Message + "');</script>");
                }
                
            }
    }
}