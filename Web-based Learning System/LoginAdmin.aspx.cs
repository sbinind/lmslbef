﻿using System;
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
    public partial class LoginAdmin : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        HashCode hc = new HashCode();
        //admin login
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                MySqlConnection con = new MySqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                MySqlCommand cmd = new MySqlCommand("SELECT * FROM admin_master_table where username='" + txtUsername.Text.Trim() + "' AND password='" + txtPassword.Text.Trim() + "'", con);
                MySqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Response.Write("<script>alert('" + dr.GetValue(1).ToString() + "');</script>");
                        Session["username"] = dr.GetValue(1).ToString();
                        Session["full_name"] = dr.GetValue(0).ToString();
                        Session["role"] = "admin";
                    
                    }
                    Response.Redirect("AdminDashboard.aspx");
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