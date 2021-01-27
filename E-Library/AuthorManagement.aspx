<%@ Page Title="" Language="C#" MasterPageFile="~/ELibrary.Master" AutoEventWireup="true" CodeBehind="AuthorManagement.aspx.cs" Inherits="E_Library.AuthorManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            var table = $('.table').prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable({
                pageLength: 5,
                lengthMenu: [[5, 10,-1], [5, 10, 'All']],
            })
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="background-author">
    <div class="container">
        <div class="row">
            <div class="col-md-5">
                <div class="card card-author-bg">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Author Details</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img class="author-image" src="Images/writer.png" />
                                </center>
                            </div>
                        </div> 
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label class="badge badge-secondary badge-info">Author ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="txtAuthorId" runat="server" placeholder="ID"></asp:TextBox>
                                        <asp:Button class="btn btn-primary" ID="btnAuthorGo" runat="server" Text="Go" OnClick="btnAuthorGo_Click" />
                                    </div>
                                </div>
                            </div> 
                            <div class="col-md-8">
                                <label class="badge badge-secondary badge-info">Author Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtAuthorName" runat="server" placeholder="Author Name"></asp:TextBox>
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
                <%--<a href="homepage.aspx" class="back-to-homepage"><i class="fas fa-angle-double-left"></i>Go back to homepage</a><br><br>--%>                
                <br>
            </div>
            <div class="col-md-7">
                <div class="card card-author-bg">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Author List</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <asp:SqlDataSource ID="dataSrcAuthor" runat="server" ConnectionString="<%$ ConnectionStrings:dbELibraryConnectionString %>" SelectCommand="SELECT * FROM [tblAuthor_Master]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="grdViewAuthorMgmt" runat="server" AutoGenerateColumns="False" DataKeyNames="author_Id" DataSourceID="dataSrcAuthor" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
                                    <Columns>
                                        <asp:BoundField DataField="author_Id" HeaderText="Author ID" ReadOnly="True" SortExpression="author_Id" />
                                        <asp:BoundField DataField="author_Name" HeaderText="Author Name" SortExpression="author_Name" />
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
                            </div>
                        </div>
                    </div>
                </div>
            </div> 
        </div>
    </div>
</div>
</asp:Content>
