<%@ Page Title="Upcoming Events" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UpcomingEvents.aspx.cs" Inherits="HIGH_SCHOOL_SYSTEM.Footers.UpcomingEvents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Upcoming School Events</h2>
    <p>Stay updated with the latest events happening at our school. Below is a list of upcoming events for the academic year.</p>

    <!-- Hardcoded Event Table -->
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
                <td>Back to School Night</td>
                <td>09/10/2025</td>
                <td>6:00 PM</td>
                <td>Auditorium</td>
            </tr>
            <tr>
                <td>Homecoming Dance</td>
                <td>10/20/2025</td>
                <td>8:00 PM</td>
                <td>Gymnasium</td>
            </tr>
            <tr>
                <td>Parent-Teacher Conference</td>
                <td>11/05/2025</td>
                <td>3:00 PM</td>
                <td>Main Building</td>
            </tr>
            <tr>
                <td>Winter Holiday Concert</td>
                <td>12/15/2025</td>
                <td>7:00 PM</td>
                <td>Music Hall</td>
            </tr>
        </tbody>
    </table>
</asp:Content>