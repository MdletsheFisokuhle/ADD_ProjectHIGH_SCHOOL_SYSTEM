<%@ Page Title="Top Students" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TopStudents.aspx.cs" Inherits="HIGH_SCHOOL_SYSTEM.Footers.TopStudents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Top Students (Matric Results)</h2>
    <p>Congratulations to the highest-performing students in the past few years. We are proud of their academic achievements!</p>

    <!-- Hardcoded Top Students Table -->
    <table border="1" cellpadding="5" cellspacing="0" style="width: 100%; border-collapse: collapse;">
        <thead>
            <tr>
                <th>Year</th>
                <th>Student Name</th>
                <th>Average Percentage</th>
                <th>Top Subject</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>2024</td>
                <td>Sarah Williams</td>
                <td>96%</td>
                <td>Mathematics</td>
            </tr>
            <tr>
                <td>2023</td>
                <td>James Anderson</td>
                <td>94%</td>
                <td>Physics</td>
            </tr>
            <tr>
                <td>2022</td>
                <td>Amy Johnson</td>
                <td>92%</td>
                <td>Chemistry</td>
            </tr>
            <tr>
                <td>2021</td>
                <td>Michael Davis</td>
                <td>98%</td>
                <td>English Literature</td>
            </tr>
            <tr>
                <td>2020</td>
                <td>Emily Moore</td>
                <td>93%</td>
                <td>Biology</td>
            </tr>
        </tbody>
    </table>
</asp:Content>