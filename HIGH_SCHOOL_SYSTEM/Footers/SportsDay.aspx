<%@ Page Title="Sports Day" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SportsDay.aspx.cs" Inherits="HIGH_SCHOOL_SYSTEM.Footers.SportsDay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Sports Day Events</h2>
    <p>Here are the events scheduled for this year's Sports Day. Join us for a fun and exciting day of athletic competition!</p>

    <!-- Hardcoded Sports Day Event Table -->
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
                <td>100m Sprint</td>
                <td>09/25/2025</td>
                <td>9:00 AM</td>
                <td>Track</td>
            </tr>
            <tr>
                <td>Long Jump</td>
                <td>09/25/2025</td>
                <td>9:30 AM</td>
                <td>Field</td>
            </tr>
            <tr>
                <td>Relay Race</td>
                <td>09/25/2025</td>
                <td>10:30 AM</td>
                <td>Track</td>
            </tr>
            <tr>
                <td>High Jump</td>
                <td>09/25/2025</td>
                <td>11:00 AM</td>
                <td>Field</td>
            </tr>
            <tr>
                <td>Tug of War</td>
                <td>09/25/2025</td>
                <td>12:00 PM</td>
                <td>Field</td>
            </tr>
            <tr>
                <td>Football Match</td>
                <td>09/25/2025</td>
                <td>1:00 PM</td>
                <td>Football Field</td>
            </tr>
        </tbody>
    </table>
</asp:Content>