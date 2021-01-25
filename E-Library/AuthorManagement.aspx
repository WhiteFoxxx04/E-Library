<%@ Page Title="" Language="C#" MasterPageFile="~/ELibrary.Master" AutoEventWireup="true" CodeBehind="AuthorManagement.aspx.cs" Inherits="E_Library.AuthorManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="author-bg">
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
                                        <asp:Button class="btn btn-primary" ID="btnAuthorGo" runat="server" Text="Go" />
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
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="grdViewAuthorMgmt" runat="server"></asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div> 
        </div>
    </div>
</div>
</asp:Content>
