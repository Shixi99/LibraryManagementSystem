<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminNotifications.aspx.cs" Inherits="WebApplication1.adminNotifications" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
      <div class="row">
          <div class="col-md-7">
            <div class="card" style="border:none;">
                <div class="card-header">
                     <div class="row center">
                     <div class="col">  
                         <h4>Ordered Book List</h4>  
                     </div>
                  </div>
                </div>
               <div class="card-body">                 
                  <div class="row">
                     <div class="col">
                        <br>
                     </div>
                  </div>
                  <div class="row">
                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [notifications_tbl]"></asp:SqlDataSource>
                      <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:elibraryDBConnectionString %>' SelectCommand="SELECT * FROM [book_issue_tbl]"></asp:SqlDataSource>--%>
                     <div class="col">
                         <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                             <Columns>
                                 <asp:BoundField DataField="memberID" HeaderText="memberID" SortExpression="memberID" />
                                 <asp:BoundField DataField="bookID" HeaderText="bookID" SortExpression="bookID" />
                             </Columns>
                         </asp:GridView>
                         <%--<asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound">
                             <Columns>
                                 <asp:BoundField DataField="member_id" HeaderText="Member ID" SortExpression="member_id"></asp:BoundField>
                                 <asp:BoundField DataField="member_name" HeaderText="Member name" SortExpression="member_name"></asp:BoundField>
                                 <asp:BoundField DataField="book_id" HeaderText="Book ID" SortExpression="book_id"></asp:BoundField>
                                 <asp:BoundField DataField="book_name" HeaderText="Book Name" SortExpression="book_name"></asp:BoundField>
                                 <asp:BoundField DataField="issue_date" HeaderText="Issue date" SortExpression="issue_date"></asp:BoundField>
                                 <asp:BoundField DataField="due_date" HeaderText="Due date" SortExpression="due_date"></asp:BoundField>
                             </Columns>
                         </asp:GridView>--%>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</asp:Content>
