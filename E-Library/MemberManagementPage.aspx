    <%@ Page Title="" Language="C#" MasterPageFile="~/ELibrary.Master" AutoEventWireup="true" CodeBehind="MemberManagementPage.aspx.cs" Inherits="E_Library.MemberManagementPage" %>
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
    <div class="background-member-management">
    <div class="container-fluid">
      <div class="row">
         <div class="col-md-5">
            <div class="card card-membermgmt-bg">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Member Details</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <img class="member-management-image" src="Images/generaluser.png" />
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-3">
                        <label class="badge badge-secondary badge-info">Member ID</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="txtMemberId" runat="server" placeholder="ID"></asp:TextBox>
                              <asp:LinkButton class="btn btn-primary lnkbtn" ID="lnkButtonSearch" runat="server" OnClick="lnkButtonSearch_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label class="badge badge-secondary badge-info">Full Name</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtFullName" runat="server" placeholder="Full Name" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-5">
                        <label class="badge badge-secondary badge-info">Account Status</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control mr-1" ID="txtAcctStatus" runat="server" placeholder="Status" ReadOnly="True"></asp:TextBox>
                               <asp:LinkButton ID="lnkBtnActive" class="btn btn-success mr-1 lnkbtn" runat="server" OnClick="lnkBtnActive_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>
                               <asp:LinkButton ID="lnkBtnPending" class="btn btn-warning mr-1 lnkbtn" runat="server" OnClick="lnkBtnPending_Click"><i class="far fa-pause-circle"></i></asp:LinkButton>
                               <asp:LinkButton ID="lnkBtnInActive" class="btn btn-danger mr-1 lnkbtn" runat="server" OnClick="lnkBtnInActive_Click"><i class="fas fa-times-circle"></i></asp:LinkButton>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-3">
                        <label class="badge badge-secondary badge-info">Date Of Birth</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtDOB" runat="server" placeholder="DOB" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label class="badge badge-secondary badge-info">Contact Number</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtContactNo" runat="server" placeholder="000-000-0000" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-5">
                        <label class="badge badge-secondary badge-info">Email ID</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtEmailId" runat="server" placeholder="abc@gmail.com" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-4">
                        <label class="badge badge-secondary badge-info">State</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtState" runat="server" placeholder="State" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label class="badge badge-secondary badge-info">City</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtCity" runat="server" placeholder="City" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label class="badge badge-secondary badge-info">Pin Code</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtPincode" runat="server" placeholder="000-000" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-12">
                        <label class="badge badge-secondary badge-info">Full Postal Address</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtFullAddress" runat="server" placeholder="Full Postal Address" TextMode="MultiLine" Rows="2" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-8 mx-auto">
                        <asp:Button ID="btnDeleteUser" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete User Permanently" OnClick="btnDeleteUser_Click" />
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <div class="col-md-7">
            <div class="card card-membermgmt-bg">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Member List</h4>
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
                        <asp:GridView class="table table-striped table-bordered" ID="grdViewMemberList" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="member_Id" DataSourceID="Member_Master_DataSrc">
                            <Columns>
                                <asp:BoundField DataField="member_Id" HeaderText="Member ID" ReadOnly="True" SortExpression="member_Id" />
                                <asp:BoundField DataField="full_name" HeaderText="Full Name" SortExpression="full_name" />
                                <%--<asp:BoundField DataField="contact_no" HeaderText="contact_no" SortExpression="contact_no" />
                                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                                <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />--%>
                                <asp:BoundField DataField="account_status" HeaderText="Account Status" SortExpression="account_status" />
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
                         <asp:SqlDataSource ID="Member_Master_DataSrc" runat="server" ConnectionString="Data Source=LAPTOP-F654F767\SQLEXPRESS;Initial Catalog=dbELibrary;Persist Security Info=True;User ID=Whitefox;Password=123456789" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [tblMember_Master]"></asp:SqlDataSource>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
    </div>
</asp:Content>
