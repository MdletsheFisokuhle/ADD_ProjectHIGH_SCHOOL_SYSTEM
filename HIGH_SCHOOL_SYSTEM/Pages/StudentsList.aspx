<%@ Page Title="Enrolled Students" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StudentsList.aspx.cs" Inherits="HIGH_SCHOOL_SYSTEM.Pages.Admin.StudentsList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <h2>Enrolled Students</h2>
        
        <div class="row mb-3">
            <div class="col-md-6">
                <div class="input-group">
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Search students..."></asp:TextBox>
                    <div class="input-group-append">
                        <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="btnSearch_Click" />
                    </div>
                </div>
            </div>
            <div class="col-md-6 text-right">
                <asp:DropDownList ID="ddlGradeFilter" runat="server" CssClass="form-control d-inline-block" AutoPostBack="true" 
                    OnSelectedIndexChanged="ddlGradeFilter_SelectedIndexChanged" Width="200px">
                    <asp:ListItem Value="">All Grades</asp:ListItem>
                    <asp:ListItem>Grade 8</asp:ListItem>
                    <asp:ListItem>Grade 9</asp:ListItem>
                    <asp:ListItem>Grade 10</asp:ListItem>
                    <asp:ListItem>Grade 11</asp:ListItem>
                    <asp:ListItem>Grade 12</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        
        <div class="table-responsive">
            <asp:GridView ID="gvStudents" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered"
                DataKeyNames="StudentID" AllowPaging="True" PageSize="15" OnPageIndexChanging="gvStudents_PageIndexChanging"
                OnRowCommand="gvStudents_RowCommand" OnRowDataBound="gvStudents_RowDataBound">
                <Columns>
                    <asp:BoundField DataField="StudentID" HeaderText="ID" SortExpression="StudentID" />
                    <asp:BoundField DataField="ApplicationID" HeaderText="App ID" SortExpression="ApplicationID" />
                    <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                    <asp:BoundField DataField="EnrollmentDate" HeaderText="Enrollment Date" SortExpression="EnrollmentDate" 
                        DataFormatString="{0:yyyy-MM-dd}" />
                    <asp:BoundField DataField="CurrentGrade" HeaderText="Grade" SortExpression="CurrentGrade" />
                    <asp:TemplateField HeaderText="Status" SortExpression="IsActive">
                        <ItemTemplate>
                            <asp:Label ID="lblStatus" runat="server" Text='<%# (bool)Eval("IsActive") ? "Active" : "Inactive" %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:Button ID="btnView" runat="server" Text="View" CommandName="ViewDetails" 
                                CommandArgument='<%# Eval("StudentID") %>' CssClass="btn btn-info btn-sm" />
                            <asp:Button ID="btnDeactivate" runat="server" Text='<%# (bool)Eval("IsActive") ? "Deactivate" : "Activate" %>' 
                                CommandName="ToggleStatus" CommandArgument='<%# Eval("StudentID") %>' 
                                CssClass='<%# (bool)Eval("IsActive") ? "btn btn-warning btn-sm" : "btn btn-success btn-sm" %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerSettings Mode="NumericFirstLast" Position="Bottom" />
                <PagerStyle CssClass="pagination" />
            </asp:GridView>
        </div>
        
        <div class="text-right mt-3">
            <asp:Button ID="btnExport" runat="server" Text="Export to Excel" CssClass="btn btn-secondary" OnClick="btnExport_Click" />
        </div>
    </div>
</asp:Content>