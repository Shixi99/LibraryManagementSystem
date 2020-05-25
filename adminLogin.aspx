<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminLogin.aspx.cs" Inherits="WebApplication1.adminLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
      <div class="row">
         <div class="col-md-4 mx-auto">
            <div class="card" style="background-color:transparent; border:none">
               <div class="card-body">
                  <div class="row center">
                     <div class="col">
                        
                           <img width="150" src="imgs/admin-user.png"/>
                        
                     </div>
                  </div>
                  <div class="row center">
                     <div class="col">
                        
                           <h3>Admin Login</h3>
                        
                     </div>
                  </div>
                  <div class="row center">
                     <div class="col">
                       
                     </div>
                  </div>
                  <div class="row center">
                     <div class="col">
                       <!-- <label>Admin ID</label> -->
                        <div class="form-group under-line">  <!--textbox1 -> admin_id-->
                           <asp:TextBox CssClass="form-control center" ID="admin_id" runat="server" placeholder="Admin ID" BackColor="Transparent" ForeColor="#333" BorderStyle="None"></asp:TextBox>
                        </div>
                       <!-- <label>Password</label> -->
                        <div class="form-group under-line"> <!--textbox2  -> password-->
                           <asp:TextBox CssClass="form-control center" ID="password" runat="server" placeholder="Password" TextMode="Password" BackColor="Transparent" ForeColor="#333" BorderStyle="None"></asp:TextBox>
                        </div>
                        <div class="form-group"> <!--button1 login-->
                           <asp:Button class="btn btn-success btn-block btn-lg" ID="login" runat="server" Text="Login" OnClick="login_Click" />
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <a href="homepage.aspx"><< Back to Home</a><br><br>
         </div>
      </div>
   </div>

</asp:Content>
