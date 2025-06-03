<%@ Page Title="Log in" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="HIGH_SCHOOL_SYSTEM.Account.Login" Async="true" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %>.</h2>
        <div class="col-md-8">
        <section id="loginForm" class="container my-5">
            <div class="row justify-content-center">
                <div class="col-md-6 col-lg-4">
                    <!-- Login Form -->
                    <div class="p-4 shadow-sm rounded-3 border">
                        <h4 class="text-center mb-4">Log in to Your Account</h4>

                        <!-- Error Message -->
                        <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                            <div class="alert alert-danger">
                                <asp:Literal runat="server" ID="FailureText" />
                            </div>
                        </asp:PlaceHolder>

                        <!-- Email Field -->
                        <div class="mb-3">
                            <asp:Label runat="server" AssociatedControlID="Email" CssClass="form-label">Email</asp:Label>
                            <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" placeholder="Enter your email" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Email" CssClass="text-danger" ErrorMessage="The email field is required." />
                        </div>

                        <!-- Password Field -->
                        <div class="mb-3">
                            <asp:Label runat="server" AssociatedControlID="Password" CssClass="form-label">Password</asp:Label>
                            <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" placeholder="Enter your password" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="The password field is required." />
                        </div>

                        <!-- Remember Me Checkbox -->
                        <div class="form-check mb-3">
                            <asp:CheckBox runat="server" ID="RememberMe" class="form-check-input" />
                            <asp:Label runat="server" AssociatedControlID="RememberMe" class="form-check-label">Remember me?</asp:Label>
                        </div>

                        <!-- Login Button -->
                        <div class="d-grid">
                            <asp:Button runat="server" OnClick="LogIn" Text="Log in" CssClass="btn btn-primary btn-block" />
                        </div>

                        <!-- Register Link -->
                        <div class="text-center mt-3">
                            <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled" class="text-muted">Don't have an account? Register here.</asp:HyperLink>
                        </div>

                        <!-- Forgot Password Link (uncomment when needed) -->
                        <div class="text-center mt-2">
                            <%-- 
                            <asp:HyperLink runat="server" ID="ForgotPasswordHyperLink" ViewStateMode="Disabled" class="text-muted">Forgot your password?</asp:HyperLink>
                            --%>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        </div>

        <div class="col-md-4">
            <section id="socialLoginForm">
                <uc:OpenAuthProviders runat="server" ID="OpenAuthLogin" />
            </section>
        </div>
    </main>
</asp:Content>
