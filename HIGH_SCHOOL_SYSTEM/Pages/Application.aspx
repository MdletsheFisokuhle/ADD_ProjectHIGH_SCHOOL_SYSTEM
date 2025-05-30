<%@ Page Title="Student Application" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Application.aspx.cs" Inherits="HIGH_SCHOOL_SYSTEM.Pages.Application" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  <h2 style="color: navy;">Student Application Form</h2>
  <hr />

  <asp:Panel ID="studentDet" GroupingText="Student Details" runat="server" Width="600px" BackColor="#f9f9f9" Padding="10">
    <asp:Table ID="studentDetTable" runat="server" HorizontalAlign="Left" CellPadding="5">
      <asp:TableRow>
        <asp:TableCell>
          <asp:Label ID="firstNameLBL" runat="server" Text="First Name(s):" AssociatedControlID="firstNameTXT" />
        </asp:TableCell>
        <asp:TableCell>
          <asp:TextBox ID="firstNameTXT" runat="server" CssClass="form-control" />
          <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="firstNameTXT"
            ErrorMessage="First name is required." ForeColor="Red" Display="Dynamic" />
        </asp:TableCell>
      </asp:TableRow>

      <asp:TableRow>
        <asp:TableCell>
          <asp:Label ID="lastNameLBL" runat="server" Text="Last Name:" AssociatedControlID="lastNameTXT" />
        </asp:TableCell>
        <asp:TableCell>
          <asp:TextBox ID="lastNameTXT" runat="server" CssClass="form-control" />
          <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="lastNameTXT"
            ErrorMessage="Last name is required." ForeColor="Red" Display="Dynamic" />
        </asp:TableCell>
      </asp:TableRow>

      <asp:TableRow>
        <asp:TableCell>
          <asp:Label ID="idLBL" runat="server" Text="ID Number:" AssociatedControlID="idTXT" />
        </asp:TableCell>
        <asp:TableCell>
          <asp:TextBox ID="idTXT" runat="server" CssClass="form-control" />
          <asp:RequiredFieldValidator ID="rfvID" runat="server" ControlToValidate="idTXT"
            ErrorMessage="ID number is required." ForeColor="Red" Display="Dynamic" />
        </asp:TableCell>
      </asp:TableRow>

      <asp:TableRow>
        <asp:TableCell>
          <asp:Label ID="dobLBL" runat="server" Text="Date of Birth:" AssociatedControlID="dobTXT" />
        </asp:TableCell>
        <asp:TableCell>
          <asp:TextBox ID="dobTXT" runat="server" CssClass="form-control" TextMode="Date" />
          <asp:RequiredFieldValidator ID="rfvDOB" runat="server" ControlToValidate="dobTXT"
            ErrorMessage="Date of birth is required." ForeColor="Red" Display="Dynamic" />
        </asp:TableCell>
      </asp:TableRow>

      <asp:TableRow>
        <asp:TableCell>
          <asp:Label ID="genderLBL" runat="server" Text="Gender:" AssociatedControlID="genderDDL" />
        </asp:TableCell>
        <asp:TableCell>
          <asp:DropDownList ID="genderDDL" runat="server">
            <asp:ListItem Text="-- Select Gender --" Value="" />
            <asp:ListItem Text="Male" Value="Male" />
            <asp:ListItem Text="Female" Value="Female" />
            <asp:ListItem Text="Other" Value="Other" />
          </asp:DropDownList>
          <asp:RequiredFieldValidator ID="rfvGender" runat="server" ControlToValidate="genderDDL"
            InitialValue="" ErrorMessage="Please select a gender." ForeColor="Red" Display="Dynamic" />
        </asp:TableCell>
      </asp:TableRow>

      <asp:TableRow>
        <asp:TableCell>
          <asp:Label ID="emailLBL" runat="server" Text="Email Address:" AssociatedControlID="emailTXT" />
        </asp:TableCell>
        <asp:TableCell>
          <asp:TextBox ID="emailTXT" runat="server" CssClass="form-control" TextMode="Email" />
          <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="emailTXT"
            ErrorMessage="Email is required." ForeColor="Red" Display="Dynamic" />
        </asp:TableCell>
      </asp:TableRow>

      <asp:TableRow>
        <asp:TableCell>
          <asp:Label ID="phoneLBL" runat="server" Text="Phone Number:" AssociatedControlID="phoneTXT" />
        </asp:TableCell>
        <asp:TableCell>
          <asp:TextBox ID="phoneTXT" runat="server" CssClass="form-control" />
          <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="phoneTXT"
            ErrorMessage="Phone number is required." ForeColor="Red" Display="Dynamic" />
        </asp:TableCell>
      </asp:TableRow>

      <asp:TableRow>
        <asp:TableCell>
          <asp:Label ID="addressLBL" runat="server" Text="Home Address:" AssociatedControlID="addressTXT" />
        </asp:TableCell>
        <asp:TableCell>
          <asp:TextBox ID="addressTXT" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" />
          <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="addressTXT"
            ErrorMessage="Address is required." ForeColor="Red" Display="Dynamic" />
        </asp:TableCell>
      </asp:TableRow>
    </asp:Table>
  </asp:Panel>
  <br />
  <asp:Panel ID="educationDet" GroupingText="Previous Education" runat="server" Width="600px" BackColor="#f9f9f9" Padding="10">
    <asp:Table ID="educationTable" runat="server" HorizontalAlign="Left" CellPadding="5">
      <asp:TableRow>
        <asp:TableCell>
          <asp:Label ID="lastSchoolLBL" runat="server" Text="Last School Attended:" AssociatedControlID="lastSchoolTXT" />
        </asp:TableCell>
        <asp:TableCell>
          <asp:TextBox ID="lastSchoolTXT" runat="server" CssClass="form-control" />
          <asp:RequiredFieldValidator ID="rfvLastSchool" runat="server" ControlToValidate="lastSchoolTXT"
            ErrorMessage="Last school is required." ForeColor="Red" Display="Dynamic" />
        </asp:TableCell>
      </asp:TableRow>

      <asp:TableRow>
        <asp:TableCell>
          <asp:Label ID="lastGradeLBL" runat="server" Text="Last Grade Passed:" AssociatedControlID="lastGradeTXT" />
        </asp:TableCell>
        <asp:TableCell>
          <asp:TextBox ID="lastGradeTXT" runat="server" CssClass="form-control" />
          <asp:RequiredFieldValidator ID="rfvLastGrade" runat="server" ControlToValidate="lastGradeTXT"
            ErrorMessage="Grade is required." ForeColor="Red" Display="Dynamic" />
        </asp:TableCell>
      </asp:TableRow>

      <asp:TableRow>
        <asp:TableCell>
          <asp:Label ID="subjectsLBL" runat="server" Text="Subjects Passed:" AssociatedControlID="subjectsTXT" />
        </asp:TableCell>
        <asp:TableCell>
          <asp:TextBox ID="subjectsTXT" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" />
          <asp:RequiredFieldValidator ID="rfvSubjects" runat="server" ControlToValidate="subjectsTXT"
            ErrorMessage="Subjects are required." ForeColor="Red" Display="Dynamic" />
        </asp:TableCell>
      </asp:TableRow>

      <asp:TableRow>
        <asp:TableCell>
          <asp:Label ID="yearCompletedLBL" runat="server" Text="Year Completed:" AssociatedControlID="yearCompletedTXT" />
        </asp:TableCell>
        <asp:TableCell>
          <asp:TextBox ID="yearCompletedTXT" runat="server" CssClass="form-control" TextMode="Number" MaxLength="4" />
          <asp:RequiredFieldValidator ID="rfvYearCompleted" runat="server" ControlToValidate="yearCompletedTXT"
            ErrorMessage="Year is required." ForeColor="Red" Display="Dynamic" />
          <asp:RegularExpressionValidator ID="revYear" runat="server"
            ControlToValidate="yearCompletedTXT"
            ValidationExpression="^\d{4}$"
            ErrorMessage="Enter a valid 4-digit year."
            ForeColor="Red" Display="Dynamic" />
        </asp:TableCell>
      </asp:TableRow>
    </asp:Table>
  </asp:Panel>
  <br />
  <div style=" align-content: center">
    <asp:Button  ID="submitBTN" runat="server" Text="Submit Application" CssClass="btn btn-primary" OnClick="submitBTN_Click" />
  </div>
  <asp:Label ID="statusLBL" runat="server" ForeColor="Green" Font-Bold="true" />
</asp:Content>
