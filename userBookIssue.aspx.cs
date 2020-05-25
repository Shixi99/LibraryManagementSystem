using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class userBookIssue : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
            //TextBox2.Text = Session["username"].ToString();
        }

        // order book
        protected void Button2_Click(object sender, EventArgs e)
        {
            orderBook();
        }

        void orderBook()
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("INSERT INTO notifications_tbl (memberID, bookID) " +
                "values (@memberID, @bookID)", con);
            cmd.Parameters.AddWithValue("@memberID", TextBox2.Text.Trim());
            cmd.Parameters.AddWithValue("@bookID", TextBox1.Text.Trim());
           
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("<script>alert('Book ordered successfully');</script>");

            GridView1.DataBind();
        }
    }
}