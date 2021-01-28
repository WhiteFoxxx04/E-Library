<%@ Page Title="" Language="C#" MasterPageFile="~/ELibrary.Master" AutoEventWireup="true" CodeBehind="BookIssuingPage.aspx.cs" Inherits="E_Library.BookIssuingPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="background-book-issuing">
    <div class="container-fluid">
      <div class="row">
         <div class="col-md-5">
            <div class="card card-bookissuing">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Book Issuing</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <img class="book-issuing-image" src="Images/books.png" />
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-6">
                        <label class="badge badge-secondary badge-info">Member ID</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtMemberId" runat="server" placeholder="Member ID"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label class="badge badge-secondary badge-info">Book ID</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="txtBookId" runat="server" placeholder="Book ID"></asp:TextBox>
                              <asp:Button class="btn btn-primary" ID="btnGo" runat="server" Text="Go" OnClick="btnGo_Click" />
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-6">
                        <label class="badge badge-secondary badge-info">Member Name</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtMemberName" runat="server" placeholder="Member Name" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label class="badge badge-secondary badge-info">Book Name</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtBookName" runat="server" placeholder="Book Name" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-6">
                        <label class="badge badge-secondary badge-info">Start Date</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtStartDate" runat="server" placeholder="Start Date" TextMode="Date"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label class="badge badge-secondary badge-info">End Date</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtEndDate" runat="server" placeholder="End Date" TextMode="Date"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-6">
                        <asp:Button ID="btnIssue" class="btn btn-lg btn-block btn-primary" runat="server" Text="Issue" OnClick="btnIssue_Click" />
                     </div>
                     <div class="col-6">
                        <asp:Button ID="btnReturn" class="btn btn-lg btn-block btn-success" runat="server" Text="Return" OnClick="btnReturn_Click" />
                     </div>
                  </div>
               </div>
            </div>
            <br>
         </div>
         <div class="col-md-7">
            <div class="card card-bookissuing">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Issued Book List</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <asp:GridView class="table table-striped table-bordered" ID="grdViewIssuedBookList" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="member_Id" DataSourceID="IssueBookDataSrc">
                            <Columns>
                                <asp:BoundField DataField="member_Id" HeaderText="member_Id" ReadOnly="True" SortExpression="member_Id" />
                                <asp:BoundField DataField="member_Name" HeaderText="member_Name" SortExpression="member_Name" />
                                <asp:BoundField DataField="book_Id" HeaderText="book_Id" SortExpression="book_Id" />
                                <asp:BoundField DataField="book_Name" HeaderText="book_Name" SortExpression="book_Name" />
                                <asp:BoundField DataField="issue_Date" HeaderText="issue_Date" SortExpression="issue_Date" />
                                <asp:BoundField DataField="due_Date" HeaderText="due_Date" SortExpression="due_Date" />
                            </Columns>
                            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#FFF1D4" />
                            <SortedAscendingHeaderStyle BackColor="#B95C30" />
                            <SortedDescendingCellStyle BackColor="#F1E5CE" />
                            <SortedDescendingHeaderStyle BackColor="#93451F" />
                         </asp:GridView>
                         <asp:SqlDataSource ID="IssueBookDataSrc" runat="server" ConnectionString="<%$ ConnectionStrings:dbELibraryConnectionString %>" SelectCommand="SELECT * FROM [tblBook_Issue_Master]"></asp:SqlDataSource>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
</asp:Content>
