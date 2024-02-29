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
    public partial class LoginUser : System.Web.UI.Page
    {
        HashCode hc = new HashCode();
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //user login
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                MySqlConnection con = new MySqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                MySqlCommand cmd_admin = new MySqlCommand("SELECT * FROM admin_master_table where username='" + txtEmail.Text.Trim() + "' AND password='" + txtPassword.Text.Trim() + "'", con);
                MySqlDataReader dr_admin = cmd_admin.ExecuteReader();
                if (dr_admin.HasRows)
                {
                    while (dr_admin.Read())
                    {
                        Response.Write("<script>alert('" + dr_admin.GetValue(1).ToString() + "');</script>");
                        Session["username"] = dr_admin.GetValue(1).ToString();
                        Session["full_name"] = dr_admin.GetValue(0).ToString();
                        Session["role"] = "admin";

                    }
                    Response.Redirect("AdminDashboard.aspx");
                }
                dr_admin.Close();
                MySqlCommand cmd = new MySqlCommand("SELECT * FROM user_master_table where email_id='" + txtEmail.Text.Trim() + "' AND password='" + hc.PassHash(txtPassword.Text.Trim()) + "'", con);
                MySqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                  
                {
                    while (dr.Read())
                    {
                        Response.Write("<script>alert('" + dr.GetValue(1).ToString() + "');</script>");
                        Session["username"] = dr.GetValue(1).ToString();
                        Session["full_name"] = dr.GetValue(0).ToString();
                        Session["role"] = "user";
          
                    }
                    Response.Redirect("home.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid Credentials');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}