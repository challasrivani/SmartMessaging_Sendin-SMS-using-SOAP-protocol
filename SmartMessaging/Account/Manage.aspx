<%@ Page Title="Manage account" Language="C#" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Manage.aspx.cs" Inherits="SmartMessaging.Account.Manage" %>
<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <hgroup class="title">
        <h1><%: Title %>.</h1>
    </hgroup>

    <section id="passwordForm">
        <asp:PlaceHolder runat="server" ID="successMessage" Visible="false" ViewStateMode="Disabled">
            <p class="message-success"><%: SuccessMessageText %></p>
        </asp:PlaceHolder>

        <p>The user is logged in as <strong><%: User.Identity.Name %></strong>.</p>

        <asp:PlaceHolder runat="server" ID="setPassword" Visible="false">
            <p>
                You do not have a local password for this site. Add a local password to access without external logins.
            </p>
            <fieldset>
                <legend>Form setting password</legend>
                <ol>
                    <li>
                        <asp:Label runat="server" AssociatedControlID="password">Password</asp:Label>
                        <asp:TextBox runat="server" ID="password" TextMode="Password" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="password"
                            CssClass="field-validation-error" ErrorMessage="Il campo Password è obbligatorio."
                            Display="Dynamic" ValidationGroup="SetPassword" />
                        
                        <asp:ModelErrorMessage runat="server" ModelStateKey="NewPassword" AssociatedControlID="password"
                            CssClass="field-validation-error" SetFocusOnError="true" />
                        
                    </li>
                    <li>
                        <asp:Label runat="server" AssociatedControlID="confirmPassword">Confirm password</asp:Label>
                        <asp:TextBox runat="server" ID="confirmPassword" TextMode="Password" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="confirmPassword"
                            CssClass="field-validation-error" Display="Dynamic" ErrorMessage="The Confirm password field is required."
                            ValidationGroup="SetPassword" />
                        <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="confirmPassword"
                            CssClass="field-validation-error" Display="Dynamic" ErrorMessage="Password and confirm password do not match."
                            ValidationGroup="SetPassword" />
                    </li>
                </ol>
                <asp:Button runat="server" Text="Enforced password" ValidationGroup="SetPassword" OnClick="setPassword_Click" />
            </fieldset>
        </asp:PlaceHolder>

        <asp:PlaceHolder runat="server" ID="changePassword" Visible="false">
            <h3>change password</h3>
            <asp:ChangePassword runat="server" CancelDestinationPageUrl="~/" ViewStateMode="Disabled" RenderOuterTable="false" SuccessPageUrl="Manage.aspx?m=ChangePwdSuccess">
                <ChangePasswordTemplate>
                    <p class="validation-summary-errors">
                        <asp:Literal runat="server" ID="FailureText" />
                    </p>
                    <fieldset class="changePassword">
                        <legend>Change password data</legend>
                        <ol>
                            <li>
                                <asp:Label runat="server" ID="CurrentPasswordLabel" AssociatedControlID="CurrentPassword">Current Password</asp:Label>
                                <asp:TextBox runat="server" ID="CurrentPassword" CssClass="passwordEntry" TextMode="Password" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="CurrentPassword"
                                    CssClass="field-validation-error" ErrorMessage="The current Password field is required."
                                    ValidationGroup="ChangePassword" />
                            </li>
                            <li>
                                <asp:Label runat="server" ID="NewPasswordLabel" AssociatedControlID="NewPassword">New password</asp:Label>
                                <asp:TextBox runat="server" ID="NewPassword" CssClass="passwordEntry" TextMode="Password" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="NewPassword"
                                    CssClass="field-validation-error" ErrorMessage="The new password field is required."
                                    ValidationGroup="ChangePassword" />
                            </li>
                            <li>
                                <asp:Label runat="server" ID="ConfirmNewPasswordLabel" AssociatedControlID="ConfirmNewPassword">Confirm New password</asp:Label>
                                <asp:TextBox runat="server" ID="ConfirmNewPassword" CssClass="passwordEntry" TextMode="Password" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmNewPassword"
                                    CssClass="field-validation-error" Display="Dynamic" ErrorMessage="The Confirm new password field is required."
                                    ValidationGroup="ChangePassword" />
                                <asp:CompareValidator runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword"
                                    CssClass="field-validation-error" Display="Dynamic" ErrorMessage="The new password and confirm password do not match."
                                    ValidationGroup="ChangePassword" />
                            </li>
                        </ol>
                        <asp:Button runat="server" CommandName="ChangePassword" Text="Change password" ValidationGroup="ChangePassword" />
                    </fieldset>
                </ChangePasswordTemplate>
            </asp:ChangePassword>
        </asp:PlaceHolder>
    </section>

    <section id="externalLoginsForm">
        
        <asp:ListView runat="server"
            ItemType="Microsoft.AspNet.Membership.OpenAuth.OpenAuthAccountData"
            SelectMethod="GetExternalLogins" DeleteMethod="RemoveExternalLogin" DataKeyNames="ProviderName,ProviderUserId">
        
            <LayoutTemplate>
                <h3>External login register</h3>
                <table>
                    <thead><tr><th>Service</th><th>UserName</th><th>Last used</th><th>&nbsp;</th></tr></thead>
                    <tbody>
                        <tr runat="server" id="itemPlaceholder"></tr>
                    </tbody>
                </table>
            </LayoutTemplate>
            <ItemTemplate>
                <tr>
                    
                    <td><%#: Item.ProviderDisplayName %></td>
                    <td><%#: Item.ProviderUserName %></td>
                    <td><%#: ConvertToDisplayDateTime(Item.LastUsedUtc) %></td>
                    <td>
                        <asp:Button runat="server" Text="Rimuovi" CommandName="Delete" CausesValidation="false" 
                            ToolTip='<%#: "Remove your login " & Item.ProviderDisplayName & " Remove data access from your account" %>'
                            Visible="<%# CanRemoveExternalLogins %>" />
                    </td>
                    
                </tr>
            </ItemTemplate>
        </asp:ListView>

        <h3>Add external logins</h3>
        <uc:OpenAuthProviders runat="server" ReturnUrl="~/Account/Manage.aspx" />
    </section>
</asp:Content>
