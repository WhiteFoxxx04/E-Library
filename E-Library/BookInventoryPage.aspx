<%@ Page Title="" Language="C#" MasterPageFile="~/ELibrary.Master" AutoEventWireup="true" CodeBehind="BookInventoryPage.aspx.cs" Inherits="E_Library.BookInventoryPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="book-inventory-bg">
    <div class="container-fluid">
      <div class="row">
         <div class="col-md-5">
            <div class="card card-bookinventory-bg">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Book Details</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <img class="book-inventory-image" src="Images/books.png" />
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
                        <asp:FileUpload class="form-group" ID="flUpload" runat="server" />
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-3">
                        <label class="badge badge-secondary badge-info">Book ID</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="txtMemberId" runat="server" placeholder="Member ID"></asp:TextBox>
                              <asp:LinkButton class="btn btn-primary" ID="lnkBtnSearch" runat="server"><i class="fas fa-check-circle"></i></asp:LinkButton>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-9">
                        <label class="badge badge-secondary badge-info">Book Name</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtBookName" runat="server" placeholder="Book Name"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-4">
                        <label class="badge badge-secondary badge-info">Language</label>
                        <div class="form-group">
                           <asp:DropDownList class="form-control" ID="ddlLanguage" runat="server">
                              <asp:ListItem Text="English" Value="English" />
                              <asp:ListItem Text="Hindi" Value="Hindi" />
                              <asp:ListItem Text="Marathi" Value="Marathi" />
                              <asp:ListItem Text="French" Value="French" />
                              <asp:ListItem Text="German" Value="German" />
                              <asp:ListItem Text="Urdu" Value="Urdu" />
                           </asp:DropDownList>
                        </div>
                        <label class="badge badge-secondary badge-info">Publisher Name</label>
                        <div class="form-group">
                           <asp:DropDownList class="form-control" ID="ddlPublisherName" runat="server">
                              <asp:ListItem Text="Publisher 1" Value="Publisher 1" />
                              <asp:ListItem Text="Publisher 2" Value="Publisher 2" />
                           </asp:DropDownList>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label class="badge badge-secondary badge-info">Author Name</label>
                        <div class="form-group">
                           <asp:DropDownList class="form-control" ID="ddlAuthorName" runat="server">
                              <asp:ListItem Text="A1" Value="a1" />
                              <asp:ListItem Text="a2" Value="a2" />
                           </asp:DropDownList>
                        </div>
                        <label class="badge badge-secondary badge-info">Publish Date</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtPublisherDate" runat="server" placeholder="Date" TextMode="Date"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label class="badge badge-secondary badge-info">Genre</label>
                        <div class="form-group">
                           <asp:ListBox CssClass="form-control" ID="lstGenre" runat="server" SelectionMode="Multiple" Rows="5">
                              <asp:ListItem Text="Action" Value="Action" />
                              <asp:ListItem Text="Adventure" Value="Adventure" />
                              <asp:ListItem Text="Comic Book" Value="Comic Book" />
                              <asp:ListItem Text="Self Help" Value="Self Help" />
                              <asp:ListItem Text="Motivation" Value="Motivation" />
                              <asp:ListItem Text="Healthy Living" Value="Healthy Living" />
                              <asp:ListItem Text="Wellness" Value="Wellness" />
                              <asp:ListItem Text="Crime" Value="Crime" />
                              <asp:ListItem Text="Drama" Value="Drama" />
                              <asp:ListItem Text="Fantasy" Value="Fantasy" />
                              <asp:ListItem Text="Horror" Value="Horror" />
                              <asp:ListItem Text="Poetry" Value="Poetry" />
                              <asp:ListItem Text="Personal Development" Value="Personal Development" />
                              <asp:ListItem Text="Romance" Value="Romance" />
                              <asp:ListItem Text="Science Fiction" Value="Science Fiction" />
                              <asp:ListItem Text="Suspense" Value="Suspense" />
                              <asp:ListItem Text="Thriller" Value="Thriller" />
                              <asp:ListItem Text="Art" Value="Art" />
                              <asp:ListItem Text="Autobiography" Value="Autobiography" />
                              <asp:ListItem Text="Encyclopedia" Value="Encyclopedia" />
                              <asp:ListItem Text="Health" Value="Health" />
                              <asp:ListItem Text="History" Value="History" />
                              <asp:ListItem Text="Math" Value="Math" />
                              <asp:ListItem Text="Textbook" Value="Textbook" />
                              <asp:ListItem Text="Science" Value="Science" />
                              <asp:ListItem Text="Travel" Value="Travel" />
                           </asp:ListBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-4">
                        <label class="badge badge-secondary badge-info">Edition</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtEdition" runat="server" placeholder="Edition"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label class="badge badge-secondary badge-info">Book Cost(per unit)</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtBookCost" runat="server" placeholder="Book Cost(per unit)" TextMode="Number"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label class="badge badge-secondary badge-info">Pages</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtPages" runat="server" placeholder="Pages" TextMode="Number"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-4">
                        <label class="badge badge-secondary badge-info">Actual Stock</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtActualStock" runat="server" placeholder="Actual Stock" TextMode="Number"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label class="badge badge-secondary badge-info">Current Stock</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtCurrStock" runat="server" placeholder="Book Cost(per unit)" TextMode="Number" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label class="badge badge-secondary badge-info">Issued Books</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtIssuedBooks" runat="server" placeholder="Pages" TextMode="Number" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-12">
                        <label class="badge badge-secondary badge-info">Book Description</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtBookDesc" runat="server" placeholder="Book Description" TextMode="MultiLine" Rows="2"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-4">
                        <asp:Button ID="btnAdd" class="btn btn-lg btn-block btn-success" runat="server" Text="Add" />
                     </div>
                     <div class="col-4">
                        <asp:Button ID="btnUpdate" class="btn btn-lg btn-block btn-primary" runat="server" Text="Update" />
                     </div>
                     <div class="col-4">
                        <asp:Button ID="btnDelete" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete" />
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <div class="col-md-7">
            <div class="card card-bookinventory-bg">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Book Inventory List</h4>
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
                        <asp:GridView class="table table-striped table-bordered" ID="grdViewBookInventory" runat="server"></asp:GridView>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
    </div>
</asp:Content>
