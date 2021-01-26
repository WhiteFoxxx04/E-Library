using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace E_Library
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(connectionString);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from tblAdmin_Login where username='" + txtMemberID.Text.Trim() + "' AND password='" + txtPassword.Text.Trim() + "'", con);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    while (rdr.Read())
                    {
                        Response.Write("<script>alert('Successful login');</script>");
                        Session["username"] = rdr.GetValue(0).ToString();
                        Session["fullname"] = rdr.GetValue(2).ToString();
                        Session["role"] = "admin";
                    }
                    Response.Redirect("homepage.aspx");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}