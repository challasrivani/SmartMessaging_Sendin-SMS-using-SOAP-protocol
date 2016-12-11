<%@ Control Language = "C#" AutoEventWireup = "false" CodeBehind = "OpenAuthProviders.ascx.cs" Inherits = "SmartMessaging.Account.OpenAuthProviders"%>


<fieldset class = "open-auth-providers">
    <legend> Sign in with another service </legend>
    
    <asp: ListView runat = "server" ID = "providerDetails" ItemType = "Microsoft.AspNet.Membership.OpenAuth.ProviderDetails"
        SelectMethod = "GetProviderNames" ViewStateMode = "Disabled">
        <itemTemplate>
            <button type = "submit" name = "provider" value = "<% #: Item.ProviderName%>"
                title = "Sign in with the <% #account: Item.ProviderDisplayName%> Personal.">
                <% #: Item.ProviderDisplayName%>
            </button>
        </itemTemplate>
    
        <emptyDataTemplate>
            <div class = "message-info">
                <P> There are configured for external authentication services. See <a href="http://go.microsoft.com/fwlink/?LinkId=252803"> </a> this article for information on how to configure the ASP.NET application to support access by external services . </ p>
            </div>
        </emptyDataTemplate>
    </asp:>
</fieldset>