<%@ Page Title="Pending Applications" Language="C#" MasterPageFile="~/Site.Master" 
    AutoEventWireup="true" CodeBehind="PendingApplications.aspx.cs" 
    Inherits="HIGH_SCHOOL_SYSTEM.Pages.Admin.PendingApplications" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Pending Applications</h2>
    
    <asp:GridView ID="applicationsGrid" runat="server" AutoGenerateColumns="false"
        OnRowCommand="applicationsGrid_RowCommand" DataKeyNames="ApplicationID"
        CssClass="table table-striped table-bordered">
        <Columns>
            <asp:BoundField DataField="ApplicationID" HeaderText="ID" />
            <asp:BoundField DataField="FirstName" HeaderText="First Name" />
            <asp:BoundField DataField="LastName" HeaderText="Last Name" />
            <asp:BoundField DataField="Email" HeaderText="Email" />
            <asp:BoundField DataField="LastSchoolAttended" HeaderText="Previous School" />
            <asp:BoundField DataField="ApplicationDate" HeaderText="Applied On" DataFormatString="{0:d}" />
            
            <asp:TemplateField HeaderText="Actions">
                <ItemTemplate>
                    <asp:LinkButton ID="btnReview" runat="server" CommandName="Review" 
                        CommandArgument='<%# Eval("ApplicationID") %>' Text="Review" CssClass="btn btn-info" />
                    <asp:LinkButton ID="btnApprove" runat="server" CommandName="Approve" 
                        CommandArgument='<%# Eval("ApplicationID") %>' Text="Approve" CssClass="btn btn-success" />
                    <asp:LinkButton ID="btnReject" runat="server" CommandName="Reject" 
                        CommandArgument='<%# Eval("ApplicationID") %>' Text="Reject" CssClass="btn btn-danger" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>