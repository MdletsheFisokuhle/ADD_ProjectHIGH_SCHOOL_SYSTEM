<%@ Page Title="Careers" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Careers.aspx.cs" Inherits="HIGH_SCHOOL_SYSTEM.Footers.Careers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Career Opportunities</h2>
    <p>Explore exciting career opportunities with our institution. We are looking for talented and passionate individuals to join our team.</p>

    <!-- Hardcoded Career Opportunities Table -->
    <table border="1" cellpadding="5" cellspacing="0" style="width: 100%; border-collapse: collapse;">
        <thead>
            <tr>
                <th>Job Title</th>
                <th>Location</th>
                <th>Requirements</th>
                <th>Closing Date</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Math Teacher</td>
                <td>Main Campus</td>
                <td>Bachelor's in Education or related field</td>
                <td>10/30/2025</td>
            </tr>
            <tr>
                <td>Sports Coach</td>
                <td>Sports Field</td>
                <td>Degree in Sports Science, Coaching Experience</td>
                <td>11/15/2025</td>
            </tr>
            <tr>
                <td>Administrative Assistant</td>
                <td>Administration Building</td>
                <td>Strong organizational skills, experience with office software</td>
                <td>12/01/2025</td>
            </tr>
            <tr>
                <td>Science Lab Technician</td>
                <td>Science Department</td>
                <td>Degree in Science, Lab experience preferred</td>
                <td>12/10/2025</td>
            </tr>
        </tbody>
    </table>
</asp:Content>