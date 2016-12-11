<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SmartMessaging.Account.Login" %>
<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1><%: Title %>.</h1>
    </hgroup>
    
    <section id="loginForm">
        <h2>Use a local account to log on..</h2>
        <asp:Login runat="server" ViewStateMode="Disabled" RenderOuterTable="false">
            <LayoutTemplate>
                <p class="validation-summary-errors">
                    <asp:Literal runat="server" ID="FailureText" />
                </p>
                <fieldset>
                    <legend>Login Form</legend>
                    <ol>
                        <li>
                            <asp:Label runat="server" AssociatedControlID="UserName">User Name</asp:Label>
                            <asp:TextBox runat="server" ID="UserName" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName" CssClass="field-validation-error" ErrorMessage="The username field is required.." />
                        </li>
                        <li>
                            <asp:Label runat="server" AssociatedControlID="Password">Password</asp:Label>
                            <asp:TextBox runat="server" ID="Password" TextMode="Password" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="field-validation-error" ErrorMessage="The Password field is required." />
                        </li>
                        <li>
                            <asp:CheckBox runat="server" ID="RememberMe" />
                            <asp:Label runat="server" AssociatedControlID="RememberMe" CssClass="checkbox">Remember me</asp:Label>
                        </li>
                    </ol>
                    <asp:Button runat="server" CommandName="Login" Text="Accedi" />
                </fieldset>
            </LayoutTemplate>
        </asp:Login>
        <p>
            <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled">Run registration</asp:HyperLink>
            If you don't have an account.
        </p>
    </section>

    <section id="socialLoginForm">
        <h2>Use another service to sign in.</h2>
        <uc:OpenAuthProviders runat="server" ID="OpenAuthLogin" />
    </section>
</asp:Content>