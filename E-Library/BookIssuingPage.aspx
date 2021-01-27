<%@ Page Title="" Language="C#" MasterPageFile="~/ELibrary.Master" AutoEventWireup="true" CodeBehind="BookIssuingPage.aspx.cs" Inherits="E_Library.BookIssuingPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="background-book-issuing">
    <div class="container-fluid">
      <div class="row">
         <div class="col-md-5">
            <div class="card card-signup-bg">
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
                              <asp:Button class="btn btn-primary" ID="btnGo" runat="server" Text="Go" />
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
                        <asp:Button ID="btnIssue" class="btn btn-lg btn-block btn-primary" runat="server" Text="Issue" />
                     </div>
                     <div class="col-6">
                        <asp:Button ID="btnReturn" class="btn btn-lg btn-block btn-success" runat="server" Text="Return" />
                     </div>
                  </div>
               </div>
            </div>
            <br>
         </div>
         <div class="col-md-7">
            <div class="card card-signup-bg">
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
                        <asp:GridView class="table table-striped table-bordered" ID="grdViewIssuedBookList" runat="server"></asp:GridView>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
</asp:Content>
