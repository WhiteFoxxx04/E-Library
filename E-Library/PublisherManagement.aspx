<%@ Page Title="" Language="C#" MasterPageFile="~/ELibrary.Master" AutoEventWireup="true" CodeBehind="PublisherManagement.aspx.cs" Inherits="E_Library.PublisherManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            var table = $('.table').prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable({
                pageLength: 5,
                lengthMenu: [[5, 10, 20, -1], [5, 10, 20, 'All']],
            })
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="background-publisher">
    <div class="container">
        <div class="row">
            <div class="col-md-5">
                <div class="card card-author-bg">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                        <h4>Publisher Details</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img class="publisher-image" src="Images/publisher.png" />
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
                                <label class="badge badge-secondary badge-info">Publisher ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="txtPublisherId" runat="server" placeholder="ID"></asp:TextBox>
                                        <asp:Button class="btn btn-primary" ID="btnPublisherGo" runat="server" Text="Go" OnClick="btnPublisherGo_Click" />
                                    </div>
                                </div>
                            </div> 
                            <div class="col-md-8">
                                <label class="badge badge-secondary badge-info">Publisher Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtPublisherName" runat="server" placeholder="Publisher Name"></asp:TextBox>
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
                                    <h4>Publisher List</h4>
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
                                <asp:GridView class="table table-striped table-bordered" ID="grdViewPublisherMgmt" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="publisher_Id" DataSourceID="PublisherDataSrc">
                                    <Columns>
                                        <asp:BoundField DataField="publisher_Id" HeaderText="Publisher ID" ReadOnly="True" SortExpression="publisher_Id" />
                                        <asp:BoundField DataField="publisher_Name" HeaderText="Publisher Name" SortExpression="publisher_Name" />
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
                                <asp:SqlDataSource ID="PublisherDataSrc" runat="server" ConnectionString="Data Source=LAPTOP-F654F767\SQLEXPRESS;Initial Catalog=dbELibrary;Persist Security Info=True;User ID=Whitefox;Password=123456789" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [tblPublisher_Master]"></asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </div>
            </div> 
        </div>
    </div>
</div>
</asp:Content>
