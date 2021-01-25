<%@ Page Title="" Language="C#" MasterPageFile="~/ELibrary.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="E_Library.AdminLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="bg-image">
    <div class="container">
      <div class="row">
         <div class="col-md-6 mx-auto">
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
                        <asp:Label ID="lblAdminId" class="badge badge-secondary badge-info" runat="server" Text="Admin ID"></asp:Label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtMemberID" runat="server" placeholder="Admin Id"></asp:TextBox>
                        </div>
                        <asp:Label ID="lblPassword" class="badge badge-secondary badge-info" runat="server" Text="Password"></asp:Label>                        
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtPassword" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                        </div>
                        <div class="form-group">
                           <asp:Button class="btn btn-success btn-block btn-lg " ID="btnLogin" runat="server" Text="Login"/>
                     </div>
                  </div>
               </div>
            </div>
         </div>
        <center>
            <a href="homepage.aspx" class="back-to-homepage"><i class="fas fa-angle-double-left"></i>Go back to homepage</a><br><br>
        </center>
      </div>
   </div>
</div>
    </div>
</asp:Content>
