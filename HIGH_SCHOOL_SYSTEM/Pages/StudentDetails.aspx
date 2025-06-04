<%@ Page Title="Student Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StudentDetails.aspx.cs" Inherits="HIGH_SCHOOL_SYSTEM.Pages.StudentDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Student Details</h2>
    <asp:Panel ID="pnlDetails" runat="server" Visible="false">
        <table class="table">
            <tr>
                <th>Student ID:</th>
                <td><asp:Label ID="lblStudentID" runat="server" /></td>
            </tr>
            <tr>
                <th>Application ID:</th>
                <td><asp:Label ID="lblApplicationID" runat="server" /></td>
            </tr>
            <tr>
                <th>First Name:</th>
                <td><asp:Label ID="lblFirstName" runat="server" /></td>
            </tr>
            <tr>
                <th>Last Name:</th>
                <td><asp:Label ID="lblLastName" runat="server" /></td>
            </tr>
            <tr>
                <th>ID Number:</th>
                <td><asp:Label ID="lblIDNumber" runat="server" /></td>
            </tr>
            <tr>
                <th>Enrollment Date:</th>
                <td><asp:Label ID="lblEnrollmentDate" runat="server" /></td>
            </tr>
            <tr>
                <th>Current Grade:</th>
                <td><asp:Label ID="lblCurrentGrade" runat="server" /></td>
            </tr>
            <tr>
                <th>Status:</th>
                <td><asp:Label ID="lblStatus" runat="server" /></td>
            </tr>
        </table>
    </asp:Panel>

    <asp:Label ID="lblError" runat="server" ForeColor="Red" Visible="false" />
</asp:Content>
