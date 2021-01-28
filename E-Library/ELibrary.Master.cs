using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Library
{
    public partial class ELibrary : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"].Equals(""))
                {
                    lnkBtnUserLogin.Visible = true; //user login link button
                    lnkBtnSignUp.Visible = true; //sign up link button

                    lnkBtnLogout.Visible = false; // logout link button
                    lnkBtnUserProfile.Visible = false; // hello user link button

                    lnkBtnAdminLogin.Visible = true; // admin login link button
                    lnkBtnAuthorMgmt.Visible = false; // author management link button
                    lnkBtnPublisherMgmt.Visible = false; // publisher management link button
                    lnkBtnBookIssuing.Visible = false; // book issuing link button
                    lnkBtnBookInventory.Visible = false; // book inventory link button
                    lnkBtnMemberMgmt.Visible = false; //  member management link button
                }
                else if (Session["role"].Equals("user"))
                {
                    lnkBtnUserLogin.Visible = false; // user login link button
                    lnkBtnSignUp.Visible = false; // sign up link button

                    lnkBtnLogout.Visible = true; // logout link button
                    lnkBtnUserProfile.Visible = true; // hello user link button
                    lnkBtnUserProfile.Text = "Hello " + Session["username"].ToString();


                    lnkBtnAdminLogin.Visible = true; // admin login link button
                    lnkBtnAuthorMgmt.Visible = false; // author management link button
                    lnkBtnPublisherMgmt.Visible = false; // publisher management link button
                    lnkBtnBookInventory.Visible = false; // book inventory link button
                    lnkBtnBookIssuing.Visible = false; // book issuing link button
                }
                else if (Session["role"].Equals("admin"))
                {
                    lnkBtnUserLogin.Visible = false; // user login link button
                    lnkBtnSignUp.Visible = false; // sign up link button

                    lnkBtnLogout.Visible = true; // logout link button
                    lnkBtnUserProfile.Visible = true; // hello user link button
                    lnkBtnUserProfile.Text = "Hello " + Session["username"].ToString();


                    lnkBtnAdminLogin.Visible = false; // admin login link button
                    lnkBtnAuthorMgmt.Visible = true; // author management link button
                    lnkBtnPublisherMgmt.Visible = true; // publisher management link button
                    lnkBtnBookInventory.Visible = true; // book inventory link button
                    lnkBtnBookIssuing.Visible = true; // book issuing link button
                    lnkBtnMemberMgmt.Visible = true; //  member management link button
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void lnkBtnSignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("usersignup.aspx");
        }

        protected void lnkBtnUserLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("loginpage.aspx");
        }

        protected void lnkBtnAdminLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminlogin.aspx");
        }

        protected void lnkBtnAuthorMgmt_Click(object sender, EventArgs e)
        {
            Response.Redirect("authormanagement.aspx");
        }

        protected void lnkBtnPublisherMgmt_Click(object sender, EventArgs e)
        {
            Response.Redirect("publishermanagement.aspx");
        }

        protected void lnkBtnBookInventory_Click(object sender, EventArgs e)
        {
            Response.Redirect("bookinventorypage.aspx");
        }

        protected void lnkBtnBookIssuing_Click(object sender, EventArgs e)
        {
            Response.Redirect("bookissuingpage.aspx");
        }

        protected void lnkBtnMemberMgmt_Click(object sender, EventArgs e)
        {
            Response.Redirect("membermanagementpage.aspx");
        }

        protected void lnkBtnUserProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("userprofile.aspx");
        }

        protected void lnkBtnViewBooks_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewbookmodule.aspx");
        }

        protected void lnkBtnLogout_Click(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["fullname"] = "";
            Session["role"] = "";
            Session["status"] = "";

            lnkBtnUserLogin.Visible = true; // user login link button
            lnkBtnSignUp.Visible = true; // sign up link button

            lnkBtnLogout.Visible = false; // logout link button
            lnkBtnUserProfile.Visible = false; // hello user link button


            lnkBtnAdminLogin.Visible = true; // admin login link button
            lnkBtnAuthorMgmt.Visible = false; // author management link button
            lnkBtnPublisherMgmt.Visible = false; // publisher management link button
            lnkBtnBookInventory.Visible = false; // book inventory link button
            lnkBtnBookIssuing.Visible = false; // book issuing link button
            lnkBtnMemberMgmt.Visible = false; // member management link button
        }
    }
}