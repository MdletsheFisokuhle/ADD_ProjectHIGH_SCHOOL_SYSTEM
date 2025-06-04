<%@ Page Title="Approve Subject Registrations" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ApproveSubjects.aspx.cs" Inherits="HIGH_SCHOOL_SYSTEM.Pages.ApproveSubjects" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Subject Approval Panel</h2>

    <asp:GridView ID="gvSubjectRegistrations" runat="server" AutoGenerateColumns="False" DataKeyNames="SubjectRegistrationId">
        <Columns>
            <asp:BoundField DataField="StudentId" HeaderText="Student ID" />
            <asp:BoundField DataField="ApplicationId" HeaderText="Application ID" />
            <asp:BoundField DataField="SubjectName" HeaderText="Subject" />
            <asp:CheckBoxField DataField="IsApproved" HeaderText="Approved" ReadOnly="true" />
            <asp:TemplateField HeaderText="Approve Now">
                <ItemTemplate>
                    <asp:CheckBox ID="chkApprove" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <br />
    <asp:Button ID="btnApproveSelected" runat="server" Text="Approve Selected" OnClick="btnApproveSelected_Click" />
    <asp:Label ID="lblStatus" runat="server" ForeColor="Green" />
</asp:Content>
