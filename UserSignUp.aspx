<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserSignUp.aspx.cs" Inherits="WebApplication1.UserSignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
      <div class="row">
         <div class="col-md-5 mx-auto">
            <div class="card" style="background-color:transparent; border:none; background-image:linear-gradient(rgba(233, 226, 226, 0), rgb(200, 200, 200)),url('imgs/background2.jpg'); background-size:contain">
               <div class="card-body">
                  <div class="row center">
                     <div class="col">
                       
                           <img width="110" src="imgs/general-user.png"/>
                       
                     </div>
                  </div>
                  <div class="row center">
                     <div class="col">
                        
                           <h4 style="color:aliceblue;">User Registration</h4>
                          <!-- <span>Account Status - </span>
                           <asp:Label class="badge badge-pill badge-info" ID="Label1" runat="server" Text="Your status"></asp:Label>
                         -->
                     </div>
                  </div>
                  <div class="row center">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-6">
                        <label style="color:aliceblue;" >Full Name</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Full Name"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label style="color:aliceblue;">Date of Birth</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="" TextMode="Date"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-6">
                        <label style="color:aliceblue;">Contact No</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Contact No" TextMode="Number"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label style="color:aliceblue;">Email ID</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Email" TextMode="Email"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-4">
                        <label style="color:aliceblue;">State</label>
                        <div class="form-group">
                           <asp:DropDownList class="form-control" ID="DropDownList1" runat="server">
                              <asp:ListItem Text="Select" Value="select" Selected="True"/>
                              <asp:ListItem Text="California" Value="Andhra Pradesh" />
                              <asp:ListItem Text="Texas" Value="Arunachal Pradesh" />
                              <asp:ListItem Text="Florida" Value="Assam" />
                              
                           </asp:DropDownList>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label style="color:aliceblue;">City</label>
                        <div class="form-group">
                           <asp:TextBox class="form-control" ID="TextBox6" runat="server" placeholder="City"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label style="color:aliceblue;">Pincode</label>
                        <div class="form-group">
                           <asp:TextBox class="form-control" ID="TextBox7" runat="server" placeholder="Pincode" TextMode="Number"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <label style="color:aliceblue;">Full Address</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Full Address" TextMode="MultiLine" Rows="2"></asp:TextBox>
                        </div>
                     </div>
                  </div>

                   <hr />

                  <div class="row center">
                     <div class="col">
                         <span class="badge badge-pill badge-info">Login Credentials</span>
                         <div>
                             <br />
                         </div>   
                     </div>
                  </div>

                 <div class="row">
                     <div class="col-md-6">
                        <%--<label style="color:honeydew;">User ID</label>--%>
                        <div class="form-group">
                           <asp:TextBox class="form-control" ID="TextBox8" runat="server" placeholder="User ID"></asp:TextBox>
                        </div>
                     </div>
                    
                     <div class="col-md-6">
                        <%--<label style="color:honeydew;">Password</label>--%>
                        <div class="form-group">
                           <asp:TextBox class="form-control" ID="TextBox10" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                        </div>
                     </div>
                  </div> 
                  <div class="row center">
                     <div class="col-8 mx-auto">
                        
                           <div class="form-group">
                              <asp:Button class="btn btn-primary btn-block btn-lg" ID="Button1" runat="server" Text="Sign Up" OnClick="Button1_Click" />
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
