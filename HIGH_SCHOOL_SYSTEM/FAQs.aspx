<%@ Page Title="Frequently Asked Questions" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FAQs.aspx.cs" Inherits="HIGH_SCHOOL_SYSTEM.FAQs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="padding: 20px; max-width: 900px; margin: auto; font-family: Segoe UI, sans-serif;">
        <h2 style="color: #2c3e50;">Frequently Asked Questions (FAQs)</h2>
        <p style="color: #555;">Below are answers to some of the common questions asked by parents and prospective students.</p>
        <hr />

        <asp:Repeater ID="faqRepeater" runat="server">
            <ItemTemplate>
                <div style="margin-bottom: 20px;">
                    <h4 style="color: #2c3e50; margin-bottom: 5px;">Q: <%# Eval("Question") %></h4>
                    <p style="color: #444; background-color: #f8f9fa; padding: 10px 15px; border-left: 5px solid #3498db; border-radius: 3px;">
                        <%# Eval("Answer") %>
                    </p>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content><%--  --%>