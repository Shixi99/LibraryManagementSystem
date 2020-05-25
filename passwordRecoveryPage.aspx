<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="passwordRecoveryPage.aspx.cs" Inherits="WebApplication1.passwordRecoveryPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="container">
        <div class="row">
            <div class="col-md-6">
 
                <div class="card">
                    <div class="card-body">
 
                        <div class="row center">
                            <div class="col">
                                 <h4>Password Recovery</h4>
                            </div>
                        </div>
 
                        
 
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
 
                        <div class="row">
                            <div class="col-md-12">
                                <label>Email</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <%--<asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Email"></asp:TextBox>--%>
                                        <%--<asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="Go" OnClick="Button1_Click" />--%>
                                        <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Email"></asp:TextBox>
                                    </div>
                                </div>
                            </div>   
                        </div>
 
                        

                        <div class="row">
                            <asp:Button class="btn btn-secondary" ID="Button3" runat="server" Text="Generate random number" OnClick="Button3_Click" />
                            <asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="Send Random number to your email" OnClick="Button1_Click" />
                        </div>
 
 
 
                    </div>
                </div>
 
                <a href="homepage.aspx"><< Back to Home</a><br>
                <br>
            </div>

             <div class="col-md-6">
 
                <div class="card">
                    <div class="card-body">
 
                        <div class="row center">
                            <div class="col">
                                 <h4>Password Recovery</h4>
                            </div>
                        </div>
 
                        
 
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
 
                        <div class="row">
                                                     
                            
                        </div>
 
                        <div class="row">
                             <div class="col-md-12">
                                <label>Enter the number which is sent to your email</label>
                                <div class="form-group">
                                    <%--<asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Author Name"></asp:TextBox>--%>
                                    <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="random number" OnTextChanged="TextBox5_TextChanged1"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <label>Enter new password</label>
                                <div class="form-group">
                                    <%--<asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Author Name"></asp:TextBox>--%>
                                    <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="new password" OnTextChanged="TextBox6_TextChanged"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <asp:Button class="btn btn-primary" ID="Button2" runat="server" Text="Change Password" OnClick="Button2_Click" />
                        </div>
 
 
 
                    </div>
                </div>
 
                <%--<a href="homepage.aspx"><< Back to Home</a><br>--%>
                 <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                <br>
            </div>
 
           
 
        </div>
    </div>

</asp:Content>
