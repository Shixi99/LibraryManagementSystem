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
    public partial class userLogin : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        string username = "";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // user login
        protected void login_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("select * from member_master_tbl where member_id='" + member_id.Text.Trim() + "' AND password='" + password.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Response.Write("<script>alert('Login Successful');</script>");
                        Session["username"] = dr.GetValue(8).ToString();
                        Session["fullname"] = dr.GetValue(0).ToString();
                        Session["role"] = "user";
                        Session["status"] = dr.GetValue(10).ToString();
                    }
                    Response.Redirect("HomePage.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid username or password');</script>");
                }

            }
            catch (Exception ex)
            {

            }
        }

        
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            // lazımsız button : bura heçnə yazma
        }

        protected void LinkButton1_Click1(object sender, EventArgs e)
        {
            Response.Redirect("passwordRecoveryPage.aspx");
        }


        // TESTING!!!!!!!!!!!!!!!TESTING!!!!!!!!!!!!!!!!!!!!!!!!TESTING!!!!
        // forgot password buttonlink
        //protected void LinkButton1_Click1(object sender, EventArgs e)
        //{
        //    // bunun kodunu sonda yazacam
        //    Random random = new Random();
        //    var num = random.Next(10000, 99999);
        //    TextBox1.Text = num.ToString();
        //}

        //protected void Button1_Click(object sender, EventArgs e)
        //{
        //    if (TextBox2.Text == TextBox1.Text)
        //    {
        //        try
        //        {
        //            SqlConnection con = new SqlConnection(strcon);
        //            if (con.State == ConnectionState.Closed)
        //            {
        //                con.Open();
        //            }

        //            SqlCommand cmd = new SqlCommand("UPDATE member_master_tbl SET password=@password WHERE email='" + TextBox4.Text.Trim() + "'", con);

        //            cmd.Parameters.AddWithValue("@password", TextBox3.Text.Trim());

        //            cmd.ExecuteNonQuery();
        //            con.Close();
        //            Response.Write("<script>alert('Password Updated Successfully');</script>");
        //            //clearForm();
        //            //GridView1.DataBind();
        //        }
        //        catch (Exception ex)
        //        {
        //            Response.Write("<script>alert('" + ex.Message + "');</script>");
        //        }
        //    }
        //}
    }// TESTING!!!!!!!!!!!!!!!TESTING!!!!!!!!!!!!!!!!!!!!!!!!TESTING!!!!!!!!!!TESTING!!!!!!!!!!TESTING!!!!
}