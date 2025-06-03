<%@ Page Title="Our Team" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OurTeam.aspx.cs" Inherits="HIGH_SCHOOL_SYSTEM.Footers.OurTeam" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Our Team</h2>
    <p>Meet the dedicated and hardworking individuals who make our school a success.</p>

    <!-- Hardcoded Our Team Members Table -->
    <table border="1" cellpadding="5" cellspacing="0" style="width: 100%; border-collapse: collapse;">
        <thead>
            <tr>
                <th>Name</th>
                <th>Position</th>
                <th>Contact</th>
                <th>Email</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Mr. John Smith</td>
                <td>Principal</td>
                <td>(555) 123-4567</td>
                <td>john.smith@highschool.edu</td>
            </tr>
            <tr>
                <td>Ms. Jane Doe</td>
                <td>Vice Principal</td>
                <td>(555) 234-5678</td>
                <td>jane.doe@highschool.edu</td>
            </tr>
            <tr>
                <td>Mr. Michael Brown</td>
                <td>Math Teacher</td>
                <td>(555) 345-6789</td>
                <td>michael.brown@highschool.edu</td>
            </tr>
            <tr>
                <td>Ms. Emily White</td>
                <td>English Teacher</td>
                <td>(555) 456-7890</td>
                <td>emily.white@highschool.edu</td>
            </tr>
            <tr>
                <td>Mr. Daniel Black</td>
                <td>Sports Coach</td>
                <td>(555) 567-8901</td>
                <td>daniel.black@highschool.edu</td>
            </tr>
        </tbody>
    </table>
</asp:Content>