﻿<%@ Page Title="" Language="C#" MasterPageFile="~/ELibrary.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="E_Library.AdminLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="background-admin">
    <div class="container">
        <div class="row">
            <div class="col-md-5 mx-auto">
                <div class="card card-admin-login-bg ">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                           <img class="admin-login-image" src="Images/adminuser.png"/>
                        </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                           <h3>Admin Login</h3>
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
                                <label class="badge badge-secondary badge-info" runat="server">Admin ID</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtMemberID" runat="server" placeholder="Admin Id"></asp:TextBox>
                                </div>
                                <label class="badge badge-secondary badge-info" runat="server">Password</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtPassword" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Button class="btn btn-success btn-block btn-lg " ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
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
