<%@ Page Title="Subject Registration" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" 
    CodeBehind="SubjectRegistration.aspx.cs" Inherits="HIGH_SCHOOL_SYSTEM.Pages.SubjectRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <h2>Subject Registration</h2>
        
        <div class="form-group">
            <asp:Label ID="lblSelectStream" runat="server" Text="Select Stream:" CssClass="font-weight-bold"></asp:Label>
            <asp:DropDownList ID="ddlStream" runat="server" AutoPostBack="true" 
                OnSelectedIndexChanged="ddlStream_SelectedIndexChanged" CssClass="form-control">
                <asp:ListItem Text="--Select Stream--" Value="" Selected="True" />
                <asp:ListItem Text="Science" Value="Science" />
                <asp:ListItem Text="Commerce" Value="Commerce" />
                <asp:ListItem Text="General" Value="General" />
            </asp:DropDownList>
        </div>

        <div class="form-group" id="subjectsSection" runat="server" visible="false">
            <asp:Label ID="lblSubjects" runat="server" Text="Available Subjects:" CssClass="font-weight-bold"></asp:Label>
            <div class="card">
                <div class="card-body">
                    <asp:CheckBoxList ID="chkSubjects" runat="server" CssClass="checkbox-list"></asp:CheckBoxList>
                </div>
            </div>
        </div>

        <div class="form-group">
            <asp:Button ID="btnSubmit" runat="server" Text="Register Selected Subjects" 
                OnClick="btnSubmit_Click" CssClass="btn btn-primary" Visible="false" />
        </div>

        <asp:Label ID="lblMessage" runat="server" CssClass="alert" Visible="false"></asp:Label>
    </div>
</asp:Content>
