<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userLogin.aspx.cs" Inherits="WebApplication1.userLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <div class="container" style="background-image:linear-gradient(rgba(180, 180, 180, 0.1), rgb(170, 146, 140,0.5)),url('imgs/background.jpg'); background-size:cover"; >
      <div class="row align-content-xl-center">
         <div class="col-md-4 mx-auto">

            <div class="card" style="background-color:transparent; border:none; ">
               <div class="card-body">
                  <div class="row center">
                     <div class="col">
                         
                           <img class="align-content-center" width="100" src="imgs/general-user.png"/>
                        
                     </div>
                  </div>
                  <div class="row center">
                     <div class="col ">
                        
                           <h3 style="color: #f5f6fa">Member Login</h3>
                        
                     </div>
                  </div>
                  <div class="row center">
                     <div class="col">
                       
                     </div>
                  </div>
                  <div class="row center">
                     <div class="col">
                       <%-- <label  style="float:left">Member ID</label>--%>
                        <div class="form-group under-line"> <%--textbox1 -> member_id--%>
                           <asp:TextBox CssClass="form-control center" ID="member_id" runat="server" placeholder="Member ID" BackColor="Transparent" ForeColor="#333" BorderStyle="None"></asp:TextBox>
                        </div>
                       <%-- <label style="float:left">password</label>--%>
                        <div class="form-group under-line"> <%--textbox2 -> password--%>
                           <asp:TextBox CssClass="form-control center" ID="password" runat="server" placeholder="Password" TextMode="Password" BackColor="Transparent" ForeColor="#333" BorderStyle="None"></asp:TextBox>
                        </div>
                        <div class="form-group">  <%--button1 --> login-- id'ni deyishdim burda--%>
                           <asp:Button class="btn btn-success btn-block btn-lg" ID="login" runat="server" Text="Login" OnClick="login_Click" />
                        </div>
                        
                         <div class="form-group"> <%--signup --> button2 id'ni deyishdim burda--%>
                           <a href="UserSignUp.aspx" style="text-decoration: none;"> <input class="btn btn-info btn-block btn-lg" id="signup" type="button" value="Sign Up" /></a>
                        </div>

                         <div>
                             <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click1">Forgot Password?</asp:LinkButton>
                             <%--Forgot Password--%>
                             <%--bunun kodunu sonda yazacam--%>
                        </div>

                     </div>
                  </div>
               </div>
            </div>
             <a href="HomePage.aspx" style="color:aliceblue; text-decoration:wavy"><< Back to Home</a><br>
             
             <%--JUST  TESTING--%>
             <%--<asp:Label ID="Label1" runat="server" Text="Label">Random number: </asp:Label>
             <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>  

             <asp:Label ID="Label4" runat="server" Text="Label">Email</asp:Label>
             <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>

             <asp:Label ID="Label2" runat="server" Text="Label">write number sent to your email</asp:Label>
             <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>

             <asp:Label ID="Label3" runat="server" Text="Label">new password</asp:Label>
             <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>

             <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />--%>
             <br><br>

         </div>
      </div>
   </div>

</asp:Content>
