﻿using System;
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
    public partial class bookIssuePage : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }
        protected void Button1_Click(object sender, EventArgs e){}

        // Go button
        protected void Button1_Click1(object sender, EventArgs e)
        {
            getNames();
        }

        // Issue book button
        protected void Button2_Click(object sender, EventArgs e)
        {
            if(checkIfBookExist() && checkIfMemberExist())
            {
                if (checkIfIssueEntryExist())
                {
                    Response.Write("<script>alert('This member already have this book');</script>");
                }
                else
                {
                    issueBook();
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Member ID or Book ID');</script>");
            }
        }

        // Retrun book button
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (checkIfBookExist() && checkIfMemberExist())
            {
                if (checkIfIssueEntryExist())
                {
                    returnBook();
                }
                else
                {
                    Response.Write("<script>alert('This entry does not exist');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Member ID or Book ID');</script>");
            }
        }

        void getNames()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT book_name FROM book_master_tbl WHERE book_id = '" + TextBox1.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    TextBox4.Text = dt.Rows[0]["book_name"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalid book ID');</script>");
                }

                cmd = new SqlCommand("SELECT full_name FROM member_master_tbl WHERE member_id = '" + TextBox2.Text.Trim() + "'", con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {

                    TextBox3.Text = dt.Rows[0]["full_name"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalid member ID');</script>");
                }
            }
            catch (Exception ex)
            {

            }
        }

        bool checkIfBookExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM book_master_tbl WHERE book_id = '" + TextBox1.Text.Trim() + "' AND current_stock > 0", con);
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
                return false;
            }
        }  
        
        bool checkIfMemberExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if(con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT full_name FROM member_master_tbl WHERE member_id = '"+TextBox2.Text.Trim()+"'",con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if(dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch
            {
                return false;
            }
        }

        void issueBook()
        {
            SqlConnection con = new SqlConnection(strcon);
            if(con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("INSERT INTO book_issue_tbl (member_id, member_name, book_id, book_name, issue_date, due_date) " +
                "values (@member_id, @member_name, @book_id, @book_name, @issue_date, @due_date)", con);
            cmd.Parameters.AddWithValue("@member_id", TextBox2.Text.Trim());
            cmd.Parameters.AddWithValue("@member_name", TextBox3.Text.Trim());
            cmd.Parameters.AddWithValue("@book_id", TextBox1.Text.Trim());
            cmd.Parameters.AddWithValue("@book_name", TextBox4.Text.Trim());
            cmd.Parameters.AddWithValue("@issue_date", TextBox5.Text.Trim());
            cmd.Parameters.AddWithValue("@due_date", TextBox6.Text.Trim());

            cmd.ExecuteNonQuery();

            cmd = new SqlCommand("UPDATE book_master_tbl SET current_stock = current_stock-1" +
                "WHERE book_id = '"+TextBox1.Text.Trim()+"'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("<script>alert('Book issued successfully');</script>");


            GridView1.DataBind();
        }

        bool checkIfIssueEntryExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from book_issue_tbl WHERE member_id='" + TextBox2.Text.Trim() + "' AND book_id='" + TextBox1.Text.Trim() + "'", con);
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
                return false;
            }
        }

        void returnBook()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }


                SqlCommand cmd = new SqlCommand("Delete from book_issue_tbl WHERE book_id='" + TextBox1.Text.Trim() + "' AND member_id='" + TextBox2.Text.Trim() + "'", con);
                int result = cmd.ExecuteNonQuery();
                if (result > 0)
                {
                    cmd = new SqlCommand("update book_master_tbl set current_stock = current_stock+1 WHERE book_id='" + TextBox1.Text.Trim() + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();

                    Response.Write("<script>alert('Book Returned Successfully');</script>");
                    GridView1.DataBind();

                    con.Close();
                }
                else
                {
                    Response.Write("<script>alert('Error - Invalid details');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    //Check your condition here
                    DateTime dt = Convert.ToDateTime(e.Row.Cells[5].Text);
                    DateTime today = DateTime.Today;
                    if (today > dt)
                    {
                        e.Row.BackColor = System.Drawing.Color.DarkRed;
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}