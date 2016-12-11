using Microsoft.AspNet.Membership.OpenAuth;
using System;
using System.Collections.Generic;
using System.Web;


namespace SmartMessaging.Account
{
    public partial class OpenAuthProviders : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                dynamic provider = Request.Form["provider"];
                if (provider == null)
                {
                    return;
                }

                dynamic redirectUrl = "~/Account/RegisterExternalLogin.aspx";
                if (!string.IsNullOrEmpty(ReturnUrl))
                {
                    dynamic resolvedReturnUrl = ResolveUrl(ReturnUrl);
                    redirectUrl += "?ReturnUrl=" + HttpUtility.UrlEncode(resolvedReturnUrl);
                }

                OpenAuth.RequestAuthentication(provider, redirectUrl);
            }
        }
        public string ReturnUrl { get; set; }


        public IEnumerable<ProviderDetails> GetProviderNames()
        {
            return OpenAuth.AuthenticationClients.GetAll();
        }
        public OpenAuthProviders()
        {
            Load += Page_Load;
        }
    }
}

