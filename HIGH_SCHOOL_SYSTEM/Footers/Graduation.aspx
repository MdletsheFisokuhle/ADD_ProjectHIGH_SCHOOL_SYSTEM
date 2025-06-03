<%@ Page Title="Graduation (Matric Dance)" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Graduation.aspx.cs" Inherits="HIGH_SCHOOL_SYSTEM.Footers.Graduation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Graduation (Matric Dance)</h2>
    <p>Join us for this year's Graduation Ceremony and Matric Dance. A special night to celebrate the accomplishments of our graduating class.</p>

    <!-- Hardcoded Graduation Event Table -->
    <table border="1" cellpadding="5" cellspacing="0" style="width: 100%; border-collapse: collapse;">
        <thead>
            <tr>
                <th>Event Name</th>
                <th>Event Date</th>
                <th>Event Time</th>
                <th>Location</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Graduation Ceremony</td>
                <td>11/20/2025</td>
                <td>10:00 AM</td>
                <td>Auditorium</td>
            </tr>
            <tr>
                <td>Matric Dance</td>
                <td>11/20/2025</td>
                <td>7:00 PM</td>
                <td>Grand Ballroom</td>
            </tr>
        </tbody>
    </table>
</asp:Content>