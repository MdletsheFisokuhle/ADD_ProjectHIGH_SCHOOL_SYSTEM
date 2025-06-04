<%@ Page Title="Application Status" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewApplicationStatus.aspx.cs" Inherits="HIGH_SCHOOL_SYSTEM.Pages.ViewApplicationStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  <h2 style="color: navy;">Check Application Status</h2>
  <hr />

  <asp:Panel ID="statusPanel" runat="server" Width="500px" BackColor="#f9f9f9" Padding="15">
    <asp:Label ID="emailLBL" runat="server" Text="Enter your Email Address:" AssociatedControlID="emailTXT" />
    <br />
    <asp:TextBox ID="emailTXT" runat="server" CssClass="form-control" Width="300px" />
    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="emailTXT"
        ErrorMessage="Email is required." ForeColor="Red" Display="Dynamic" />
    <br /><br />
    <asp:Button ID="checkStatusBTN" runat="server" Text="Check Status" CssClass="btn btn-primary" OnClick="checkStatusBTN_Click" />
    <br /><br />
    <asp:Label ID="resultLBL" runat="server" Font-Bold="true" />
  </asp:Panel>
</asp:Content>
