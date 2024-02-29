using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using MySql.Data.MySqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_based_Learning_System
{
    public partial class UserManagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"] != null && Session["role"].ToString() == "admin" && Session["username"] != null)
            {
                if (!Page.IsPostBack)
                {

                }
            }
            else
            {

                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("loginuser.aspx");

            }

        }
        // Go button
        protected void btnGo_Click(object sender, EventArgs e)
        {
            getUserByID();
        }

        // delete button
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            deleteUserByID();
        }


        // user defined function

        bool checkIfMemberExists()
        {
            try
            {
                MySqlConnection con = new MySqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                MySqlCommand cmd = new MySqlCommand("SELECT * from user_master_table where email_id='" + txtUserId.Text.Trim() + "';", con);
                MySqlDataAdapter da = new MySqlDataAdapter(cmd);
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


        void deleteUserByID()
        {
            if (checkIfMemberExists())
            {
                try
                {
                    MySqlConnection con = new MySqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    MySqlCommand cmd = new MySqlCommand("DELETE from user_master_table WHERE email_id='" + txtUserId.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('User Deleted Successfully');</script>");
                    clearForm();
                    GridViewUser.DataBind();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Invalid User ID');</script>");
            }
        }

        void getUserByID()
        {
            try
            {
                MySqlConnection con = new MySqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                MySqlCommand cmd = new MySqlCommand("select * from user_master_table where email_id='" + txtUserId.Text.Trim() + "'", con);
                MySqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        txtUserId.Text = dr.GetValue(2).ToString();
                        txtFullName.Text = dr.GetValue(1).ToString();
                        txtEmail.Text = dr.GetValue(2).ToString();
                    


                    }

                }
                else
                {
                    Response.Write("<script>alert('Invalid credentials');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        void clearForm()
        {
            txtUserId.Text = "";
            txtFullName.Text = "";
            txtEmail.Text = "";
        }
    }
}