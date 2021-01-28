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
    public partial class MemberManagementPage : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            grdViewMemberList.DataBind();
        }

        protected void lnkButtonSearch_Click(object sender, EventArgs e)
        {
            getMemberByID();
        }


        protected void lnkBtnActive_Click(object sender, EventArgs e)
        {
            updateMemberStatusByID("active");
        }

        protected void lnkBtnPending_Click(object sender, EventArgs e)
        {
            updateMemberStatusByID("pending");
        }

        protected void lnkBtnInActive_Click(object sender, EventArgs e)
        {
            updateMemberStatusByID("inactive");
        }

        protected void btnDeleteUser_Click(object sender, EventArgs e)
        {
            deleteMemberByID();
        }

        // user defined function
        bool checkIfMemberExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(connectionString);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from tblMember_Master where member_Id='" + txtMemberId.Text.Trim() + "';", con);
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

        void deleteMemberByID()
        {
            if (checkIfMemberExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(connectionString);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE from tblMember_Master WHERE member_Id='" + txtMemberId.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Member Deleted Successfully');</script>");
                    clearForm();
                    grdViewMemberList.DataBind();

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

        void getMemberByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(connectionString);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                SqlCommand cmd = new SqlCommand("select * from tblMember_Master where member_id='" + txtMemberId.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        txtFullName.Text = dr.GetValue(0).ToString();
                        txtAcctStatus.Text = dr.GetValue(10).ToString();
                        txtDOB.Text = dr.GetValue(1).ToString();
                        txtContactNo.Text = dr.GetValue(2).ToString();
                        txtEmailId.Text = dr.GetValue(3).ToString();
                        txtState.Text = dr.GetValue(4).ToString();
                        txtCity.Text = dr.GetValue(5).ToString();
                        txtPincode.Text = dr.GetValue(6).ToString();
                        txtFullAddress.Text = dr.GetValue(7).ToString();
                    }
                }
                else
                {
                    Response.Write("<script>alert('Invalid credentials');</script>");
                }
                clearForm();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void updateMemberStatusByID(string status)
        {
            if (checkIfMemberExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(connectionString);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();

                    }
                    SqlCommand cmd = new SqlCommand("UPDATE tblMember_Master SET account_status='" + status + "' WHERE member_Id='" + txtMemberId.Text.Trim() + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    grdViewMemberList.DataBind();
                    Response.Write("<script>alert('Member Status Updated');</script>");
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
            clearForm();
        }

        void clearForm()
        {
            txtMemberId.Text = "";
            txtFullName.Text = "";
            txtDOB.Text = "";
            txtContactNo.Text = "";
            txtState.Text = "";
            txtCity.Text = "";
            txtPincode.Text = "";
            txtFullAddress.Text = "";
            txtAcctStatus.Text = "";
        }
    }
}