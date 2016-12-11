<%@ Page Language="C#" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="RegisterExternalLogin.aspx.cs" Inherits="SmartMessaging.Account.RegisterExternalLogin" %>
<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <hgroup class="title">
        <h1>Run recording Account <%: ProviderDisplayName %> staff</h1>
        <h2><%: ProviderUserName %>.</h2>
    </hgroup>

    
    <asp:ModelErrorMessage runat="server" ModelStateKey="Provider" CssClass="field-validation-error" />
    

    <asp:PlaceHolder runat="server" ID="userNameForm">
        <fieldset>
            <legend>Association Form</legend>
            <p>
                The user has authenticated with <strong> <%: ProviderDisplayName%> </ strong> as
                 <Strong> <%: ProviderUserName%> </ strong>. Enter below a username for the current site
                 and click the Login button.
            </p>
            <ol>
                <li class="email">
                    <asp:Label runat="server" AssociatedControlID="userName">User Name</asp:Label>
                    <asp:TextBox runat="server" ID="userName" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="userName"
                        Display="Dynamic" ErrorMessage="Il nome utente è obbligatorio" ValidationGroup="NewUser" />
                    
                    <asp:ModelErrorMessage runat="server" ModelStateKey="UserName" CssClass="field-validation-error" />
                    
                </li>
            </ol>
            <asp:Button runat="server" Text="Accedi" ValidationGroup="NewUser" OnClick="logIn_Click" />
            <asp:Button runat="server" Text="Annulla" CausesValidation="false" OnClick="cancel_Click" />
        </fieldset>
    </asp:PlaceHolder>
</asp:Content>
