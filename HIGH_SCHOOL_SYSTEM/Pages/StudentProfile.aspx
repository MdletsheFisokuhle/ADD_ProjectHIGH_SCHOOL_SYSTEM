<%@ Page Title="Student Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StudentProfile.aspx.cs" Inherits="HIGH_SCHOOL_SYSTEM.Pages.StudentProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Student Profile</h2>
    <asp:Panel ID="pnlProfile" runat="server" CssClass="card p-3 shadow-sm">
        <table class="table">
            <tr>
                <th>Full Name:</th>
                <td><asp:Label ID="lblFullName" runat="server" /></td>
            </tr>
            <tr>
                <th>ID Number:</th>
                <td><asp:Label ID="lblIDNumber" runat="server" /></td>
            </tr>
            <tr>
                <th>Date of Birth:</th>
                <td><asp:Label ID="lblDOB" runat="server" /></td>
            </tr>
            <tr>
                <th>Gender:</th>
                <td><asp:Label ID="lblGender" runat="server" /></td>
            </tr>
            <tr>
                <th>Grade:</th>
                <td><asp:Label ID="lblGrade" runat="server" /></td>
            </tr>
            <tr>
                <th>Enrollment Date:</th>
                <td><asp:Label ID="lblEnrollDate" runat="server" /></td>
            </tr>
        </table>

        <h4 class="mt-4">Contact Information</h4>
        <div class="form-group">
            <label>Email:</label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" ReadOnly="true" />
        </div>
        <div class="form-group">
            <label>Phone Number:</label>
            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" />
        </div>
        <div class="form-group">
            <label>Address:</label>
            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" />
        </div>

        <asp:Button ID="btnUpdateContact" runat="server" Text="Update Contact Info" CssClass="btn btn-primary" OnClick="btnUpdateContact_Click" />
        <br /><br />
        <asp:Label ID="lblMessage" runat="server" ForeColor="Green" />
    </asp:Panel>

    <hr />

    <h3>Academic Summary</h3>
    <asp:Label ID="lblProgressNote" runat="server" />
    <div class="progress mt-3" style="height: 25px;">
        <div id="progressAcademic" class="progress-bar bg-success" role="progressbar"
             style="width: 0%;" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
            Loading...
        </div>
    </div>

    <hr />

    <h3>Registered Subjects</h3>
    <asp:Panel ID="pnlSubjects" runat="server" CssClass="card p-3 shadow-sm">
        <asp:GridView ID="gvSubjects" runat="server" AutoGenerateColumns="False" CssClass="table table-striped" EmptyDataText="No subjects registered yet.">
            <Columns>
                <asp:BoundField DataField="SubjectName" HeaderText="Subject" />
                <asp:TemplateField HeaderText="Status">
                    <ItemTemplate>
                        <asp:Label ID="lblStatus" runat="server" Text='<%# Convert.ToBoolean(Eval("IsApproved")) ? "Approved" : "Pending Approval" %>' 
                            CssClass='<%# Convert.ToBoolean(Eval("IsApproved")) ? "text-success" : "text-warning" %>'>
                        </asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </asp:Panel>
</asp:Content>
