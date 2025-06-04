<%@ Page Title="Subject Summary" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminSubjectSummary.aspx.cs" Inherits="HIGH_SCHOOL_SYSTEM.Pages.AdminSubjectSummary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Subject Registration Summary</h2>
    <asp:GridView ID="gvSubjectSummary" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField DataField="SubjectName" HeaderText="Subject" />
            <asp:BoundField DataField="StudentCount" HeaderText="Number of Students Registered" />
        </Columns>
    </asp:GridView>
</asp:Content>
