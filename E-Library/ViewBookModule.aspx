<%@ Page Title="" Language="C#" MasterPageFile="~/ELibrary.Master" AutoEventWireup="true" CodeBehind="ViewBookModule.aspx.cs" Inherits="E_Library.ViewBookModule" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            var table = $('.table').prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable({
                pageLength: 5,
                lengthMenu: [[5, 10, -1], [5, 10, 'All']],
            })
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="background-book-inventory"> 
    <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <center>
                        <h3>List of Books</h3>
                    </center>
                    <div class="row">
                        <div class="col-sm-12 col-md-12">
                            <asp:Panel class="alert alert-success" role="alert" ID="Panel1" runat="server" Visible="False">
                                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                            </asp:Panel>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="card card-bookinventory-bg">
                            <div class="card-body">

                                <div class="row">
                                    <asp:SqlDataSource ID="BookInventoryDataSrc" runat="server" ConnectionString="Data Source=LAPTOP-F654F767\SQLEXPRESS;Initial Catalog=dbELibrary;Persist Security Info=True;User ID=Whitefox;Password=123456789" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [tblBook_Master]"></asp:SqlDataSource>
                                    <div class="col">
                                        <asp:GridView class="table table-striped table-bordered" ID="grdViewBooks" runat="server" AutoGenerateColumns="False" DataKeyNames="book_id" DataSourceID="BookInventoryDataSrc">
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
                            <%--<%--<FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                            <HeaderStyle BackColor="#5e548e" Font-Bold="True" ForeColor="White" />
                            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                            <%--<RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#FFF1D4" />
                            <SortedAscendingHeaderStyle BackColor="#B95C30" />
                            <SortedDescendingCellStyle BackColor="#F1E5CE" />
                            <SortedDescendingHeaderStyle BackColor="#93451F" />--%>
                            </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
</asp:Content>
