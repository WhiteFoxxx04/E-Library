<%@ Page Title="" Language="C#" MasterPageFile="~/ELibrary.Master" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="E_Library.LoginPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="bg-image">
    <div class="container">
      <div class="row">
         <div class="col-md-6 mx-auto">
            <div class="card card-login-bg">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <img class="login-image" src="Images/generaluser.png"/>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <h3 style="color:#fff">Member Login</h3>
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
                        <asp:Label ID="lblMemberId" class="label" runat="server" Text="Member ID"></asp:Label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtMemberID" runat="server" placeholder="Member ID"></asp:TextBox>
                        </div>
                        <asp:Label ID="lblPassword" class="label" runat="server" Text="Password"></asp:Label>                        
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtPassword" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                        </div>
                        <div class="form-group">
                           <asp:Button class="btn btn-success btn-block btn-lg" ID="btnLogin" runat="server" Text="Login"/>
                           <a href="usersignup.aspx"><input class="btn btn-info btn-block btn-lg btn-signup" id="btnSignup" type="button" value="Sign Up" /></a></div>
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
