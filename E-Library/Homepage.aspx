<%@ Page Title="" Language="C#" MasterPageFile="~/ELibrary.Master" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="E_Library.Homepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- Section One Start --%>
    <section>
      <img src="Images/home-bg.jpg" class="background img-fluid"/>
   </section>
    <%-- End of Section One  --%>

    <%-- Section Two Start --%>
    <section>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <center>
                        <h2>Our 3 primary features are: </h2>
                        <%--<p><b>Our 3 Primary Features</b></p>--%>
                    </center>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <center>
                        <img src="Images/digital-inventory.png" alt="digital-inventory" class="homepage-images" />
                        <h4>Digital Book Inventory</h4>
                        <p class="text-justify">Some content goes here</p>
                    </center>
                </div>
                <div class="col-md-4">
                    <center>
                        <img src="Images/search-online.png" alt="search-online" class="homepage-images" />
                        <h4>Search Books Online</h4>
                        <p class="text-justify">Some content goes here</p>
                    </center>
                </div>
                <div class="col-md-4">
                    <center>
                        <img src="Images/defaulters-list.png" alt="defaulters-list" class="homepage-images"/>
                        <h4>Defaulter List</h4>
                        <p class="text-justify">Some content goes here</p>
                    </center>
                </div>
            </div>
        </div>
    </section>
    <%-- End of Section Two--%>
    <%-- Section Three --%>
    <section>
        <img src="Images/in-homepage-banner.jpg" class="img-fluid" />
    </section>
    <%-- End of Section Three --%>
    <%-- Section Four --%>
    <section>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <center>
                        <h2>We have 3 simple step process: </h2>
                    </center>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <center>
                        <img src="Images/sign-up.png" alt="sign-up" class="homepage-images" />
                        <h4>Sign Up</h4>
                        <p class="text-justify">Some Content goes here</p>
                    </center>
                </div>
                <div class="col-md-4">
                     <center>
                        <img src="Images/search-online.png" alt="search-online" class="homepage-images" />
                        <h4>Search Books Online</h4>
                        <p class="text-justify">Some content goes here</p>
                    </center>
                </div>
                <div class="col-md-4">
                    <center>
                        <<img src="Images/library.png" alt="library" class="homepage-images" />
                        <h4>Visit Us</h4>
                        <p class="text-justify">Some Content goes here</p>
                    </center>
                </div>
            </div>
        </div>
    </section>
    <%-- End of Section Four --%>
</asp:Content>
