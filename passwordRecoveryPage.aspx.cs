using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class passwordRecoveryPage : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            Button1.Enabled = false;
            //Button2.Enabled = false;
        }

        // sent to email which is in textBox1
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                if (checkIfEmailExists())
                {
                    string emailSender = ConfigurationManager.AppSettings["emailsender"].ToString();
                    string emailSenderPassword = ConfigurationManager.AppSettings["password"].ToString();
                    string emailSenderHost = ConfigurationManager.AppSettings["smtp"].ToString();
                    int emailSenderPort = Convert.ToInt16(ConfigurationManager.AppSettings["portnumber"]);
                    Boolean emailIsSSL = Convert.ToBoolean(ConfigurationManager.AppSettings["IsSSL"]);


                    //Fetching Email Body Text from EmailTemplate File.  
                    //string FilePath = "hello world";
                    //StreamReader str = new StreamReader(FilePath);
                    //string MailText = str.ReadToEnd();
                    //str.Close();

                    //Repalce [newusername] = signup user name   
                    string MailText = TextBox7.Text.Trim();

                    string subject = "Password Recovery";

                    //Base class for sending email  
                    MailMessage _mailmsg = new MailMessage();

                    //Make TRUE because our body text is html  
                    _mailmsg.IsBodyHtml = true;

                    //Set From Email ID  
                    _mailmsg.From = new MailAddress(emailSender);

                    // check if email is exists or not
                    //Set To Email ID  
                    _mailmsg.To.Add(TextBox1.Text.ToString());

                    //Set Subject  
                    _mailmsg.Subject = subject;

                    //Set Body Text of Email   
                    _mailmsg.Body = MailText;


                    //Now set your SMTP   
                    SmtpClient _smtp = new SmtpClient();

                    //Set HOST server SMTP detail  
                    _smtp.Host = emailSenderHost;

                    //Set PORT number of SMTP  
                    _smtp.Port = emailSenderPort;

                    //Set SSL --> True / False  
                    _smtp.EnableSsl = emailIsSSL;

                    //Set Sender UserEmailID, Password  
                    NetworkCredential _network = new NetworkCredential(emailSender, emailSenderPassword);
                    _smtp.Credentials = _network;

                    //Send Method will send your MailMessage create above.  
                    _smtp.Send(_mailmsg);
                }
                else
                {
                    Response.Write("<script>alert('There is no account with this email');</script>");
                }
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        // check if email exists or not
        bool checkIfEmailExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from member_master_tbl where email='" + TextBox1.Text.Trim() + "';", con);
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

        // Change password
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (TextBox5.Text == TextBox7.Text)
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("UPDATE member_master_tbl SET password=@password WHERE email='" + TextBox1.Text.Trim() + "'", con);

                    cmd.Parameters.AddWithValue("@password", TextBox6.Text.Trim());

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Password Updated Successfully');</script>");
                    
                    Response.Redirect("userLogin.aspx");
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Random number does not match!');</script>");
            }
        }

        // generate random number
        protected void Button3_Click(object sender, EventArgs e)
        {
            Random random = new Random();
            var num = random.Next(10000, 99999);
            TextBox7.Text = num.ToString();
            Button1.Enabled = true;
        }

        protected void TextBox5_TextChanged(object sender, EventArgs e){}
        protected void TextBox5_TextChanged1(object sender, EventArgs e){}

        protected void TextBox6_TextChanged(object sender, EventArgs e)
        {
            if (TextBox6.Text.Length != 0)
            {
                Button2.Enabled = true;
            }
        }
    }
}