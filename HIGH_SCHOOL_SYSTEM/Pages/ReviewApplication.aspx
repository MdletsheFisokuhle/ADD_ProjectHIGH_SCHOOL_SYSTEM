<%@ Page Title="Review Application" Language="C#" MasterPageFile="~/Site.Master" 
    AutoEventWireup="true" CodeBehind="ReviewApplication.aspx.cs" 
    Inherits="HIGH_SCHOOL_SYSTEM.Pages.Admin.ReviewApplication" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Review Application</h2>
    
    <asp:FormView ID="applicationForm" runat="server" CssClass="table">
        <ItemTemplate>
            <h3>Personal Information</h3>
            <p><strong>Name:</strong> <%# Eval("FirstName") %> <%# Eval("LastName") %></p>
            <p><strong>ID Number:</strong> <%# Eval("IDNumber") %></p>
            <p><strong>Date of Birth:</strong> <%# Eval("DateOfBirth", "{0:d}") %></p>
            <p><strong>Gender:</strong> <%# Eval("Gender") %></p>
            <p><strong>Email:</strong> <%# Eval("Email") %></p>
            <p><strong>Phone:</strong> <%# Eval("PhoneNumber") %></p>
            <p><strong>Address:</strong> <%# Eval("Address") %></p>

            <h3>Education Background</h3>
            <p><strong>Last School:</strong> <%# Eval("LastSchoolAttended") %></p>
            <p><strong>Last Grade:</strong> <%# Eval("LastGradePassed") %></p>
            <p><strong>Subjects Passed:</strong> <%# Eval("SubjectsPassed") %></p>
            <p><strong>Year Completed:</strong> <%# Eval("YearCompleted") %></p>

            <div class="form-group">
                <label>Notes:</label>
                <asp:TextBox ID="notesTXT" runat="server" TextMode="MultiLine" Rows="3" 
                    CssClass="form-control" Text='<%# Bind("Notes") %>' />
            </div>
            
            <asp:Button ID="btnApprove" runat="server" Text="Approve" 
                CommandArgument='<%# Eval("ApplicationID") %>' OnClick="btnApprove_Click" 
                CssClass="btn btn-success" />
            <asp:Button ID="btnReject" runat="server" Text="Reject" 
                CommandArgument='<%# Eval("ApplicationID") %>' OnClick="btnReject_Click" 
                CssClass="btn btn-danger" />
            <asp:Button ID="btnBack" runat="server" Text="Back to List" 
                OnClick="btnBack_Click" CssClass="btn btn-default" />
        </ItemTemplate>
    </asp:FormView>
</asp:Content>