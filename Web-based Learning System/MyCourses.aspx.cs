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
    public partial class MyCourses : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["username"].ToString() == "user" || Session["username"] == null)
                {
                    Response.Write("<script>alert('Session Expired Login Again');</script>");
                    Response.Redirect("loginuser.aspx");
                }
                else
                {
                    GetDataIngridView();
                }

            }
            catch (Exception)
            {

            }
        }
        void GetDataIngridView()
        {
            MySqlConnection con = new MySqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            MySqlCommand cmd = new MySqlCommand("SELECT * FROM enrol_master_table WHERE user_id='" + Session["username"].ToString() + "'", con);
            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            con.Close();
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
           
        }


        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
     
        }

    }
}