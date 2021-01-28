<%@ Page Title="" Language="C#" MasterPageFile="~/ELibrary.Master" AutoEventWireup="true" CodeBehind="BookInventoryPage.aspx.cs" Inherits="E_Library.BookInventoryPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            var table = $('.table').prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable({
                pageLength: 5,
                lengthMenu: [[5, 10,-1], [5, 10, 'All']],
            })
        });

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#imgview').attr('src', e.target.result);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="background-book-inventory">
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
                           <img id="imgview" Height="150px" Width="100px" src="Images/Book_Inventory/books1.png" />
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
                        <asp:FileUpload onchange="readURL(this);" class="form-group" ID="flUpload" runat="server" />
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-3">
                        <label class="badge badge-secondary badge-info">Book ID</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="txtBookId" runat="server" placeholder="ID"></asp:TextBox>
                              <asp:LinkButton class="btn btn-primary lnkbtn" ID="lnkBtnSearch" runat="server" OnClick="lnkBtnSearch_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>
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
                           <asp:TextBox CssClass="form-control" ID="txtPublishedDate" runat="server" placeholder="Date" TextMode="Date"></asp:TextBox>
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
                           <asp:TextBox CssClass="form-control" ID="txtBookCost" runat="server" placeholder="Cost(per unit)" TextMode="Number"></asp:TextBox>
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
                           <asp:TextBox CssClass="form-control" ID="txtCurrStock" runat="server" placeholder="Current Stock" TextMode="Number" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label class="badge badge-secondary badge-info">Issued Books</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtIssuedBooks" runat="server" placeholder="Issued Books" TextMode="Number" ReadOnly="True"></asp:TextBox>
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
                        <asp:Button ID="btnAdd" class="btn btn-lg btn-block btn-success" runat="server" Text="Add" OnClick="btnAdd_Click" />
                     </div>
                     <div class="col-4">
                        <asp:Button ID="btnUpdate" class="btn btn-lg btn-block btn-primary" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                     </div>
                     <div class="col-4">
                        <asp:Button ID="btnDelete" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete" OnClick="btnDelete_Click" />
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
                        <asp:GridView class="table table-striped table-bordered" ID="grdViewBookInventory" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="book_Id" DataSourceID="BookInventoryDataSrc">
                            <Columns>
                              <asp:BoundField DataField="book_id" HeaderText="ID" ReadOnly="True" SortExpression="book_id" >
                                 <ControlStyle Font-Bold="True" />
                                 <ItemStyle Font-Bold="True" />
                              </asp:BoundField>
                              <asp:TemplateField>
                                 <ItemTemplate>
                                    <div class="container-fluid">
                                       <div class="row">
                                          <div class="col-lg-10">
                                             <div class="row">
                                                <div class="col-12">
                                                   <asp:Label ID="lblBookName" runat="server" Text='<%# Eval("book_Name") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                                </div>
                                             </div>
                                             <div class="row">
                                                <div class="col-12">
                                                   <span>Author - </span>
                                                   <asp:Label ID="lblAuthorName" runat="server" Font-Bold="True" Text='<%# Eval("author_Name") %>'></asp:Label>
                                                   &nbsp;| <span><span>&nbsp;</span>Genre - </span>
                                                   <asp:Label ID="lblGenre" runat="server" Font-Bold="True" Text='<%# Eval("genre") %>'></asp:Label>
                                                   &nbsp;| 
                                                   <span>
                                                      Language -<span>&nbsp;</span>
                                                      <asp:Label ID="lblLanguage" runat="server" Font-Bold="True" Text='<%# Eval("language") %>'></asp:Label>
                                                   </span>
                                                </div>
                                             </div>
                                             <div class="row">
                                                <div class="col-12">
                                                   Publisher -
                                                   <asp:Label ID="lblPublisherName" runat="server" Font-Bold="True" Text='<%# Eval("publisher_Name") %>'></asp:Label>
                                                   &nbsp;| Publish Date -
                                                   <asp:Label ID="lblPublishDate" runat="server" Font-Bold="True" Text='<%# Eval("publish_Date") %>'></asp:Label>
                                                   &nbsp;| Pages -
                                                   <asp:Label ID="lblNoOfPages" runat="server" Font-Bold="True" Text='<%# Eval("no_of_Pages") %>'></asp:Label>
                                                   &nbsp;| Edition -
                                                   <asp:Label ID="lblEdition" runat="server" Font-Bold="True" Text='<%# Eval("edition") %>'></asp:Label>
                                                </div>
                                             </div>
                                             <div class="row">
                                                <div class="col-12">
                                                   Cost -
                                                   <asp:Label ID="lblBookCost" runat="server" Font-Bold="True" Text='<%# Eval("book_Cost") %>'></asp:Label>
                                                   &nbsp;| Actual Stock -
                                                   <asp:Label ID="lblActualStock" runat="server" Font-Bold="True" Text='<%# Eval("actual_Stock") %>'></asp:Label>
                                                   &nbsp;| Available Stock -
                                                   <asp:Label ID="lblCurrentStock" runat="server" Font-Bold="True" Text='<%# Eval("current_Stock") %>'></asp:Label>
                                                </div>
                                             </div>
                                             <div class="row">
                                                <div class="col-12">
                                                   Description -
                                                   <asp:Label ID="lblBookDesc" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Smaller" Text='<%# Eval("book_Description") %>'></asp:Label>
                                                </div>
                                             </div>
                                          </div>
                                          <div class="col-lg-2">
                                             <asp:Image class="img-fluid" ID="bookImg" runat="server" ImageUrl='<%# Eval("book_img_Link") %>' />
                                          </div>
                                       </div>
                                    </div>
                                 </ItemTemplate>
                              </asp:TemplateField>
                           </Columns>
                            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                            <HeaderStyle BackColor="#5e548e" Font-Bold="True" ForeColor="White" />
                            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#FFF1D4" />
                            <SortedAscendingHeaderStyle BackColor="#B95C30" />
                            <SortedDescendingCellStyle BackColor="#F1E5CE" />
                            <SortedDescendingHeaderStyle BackColor="#93451F" />
                         </asp:GridView>
                         <asp:SqlDataSource ID="BookInventoryDataSrc" runat="server" ConnectionString="Data Source=LAPTOP-F654F767\SQLEXPRESS;Initial Catalog=dbELibrary;Persist Security Info=True;User ID=Whitefox;Password=123456789" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [tblBook_Master]"></asp:SqlDataSource>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
    </div>
</asp:Content>
