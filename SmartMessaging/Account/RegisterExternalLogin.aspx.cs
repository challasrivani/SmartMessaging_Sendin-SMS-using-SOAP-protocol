using DotNetOpenAuth.AspNet;
using Microsoft.AspNet.Membership.OpenAuth;
using System;
using System.Web;
using System.Web.Security;

namespace SmartMessaging.Account
{
    public partial class RegisterExternalLogin : System.Web.UI.Page
    {
        protected string ProviderName
        {
            get { return (string)ViewState["ProviderName"] ?? string.Empty; }
            private set { ViewState["ProviderName"] = value; }
        }

        protected string ProviderDisplayName
        {
            get { return (string)ViewState["PropertyProviderDisplayName"] ?? string.Empty; }
            private set { ViewState["ProviderDisplayName"] = value; }
        }

        protected string ProviderUserId
        {
            get { return (string)ViewState["ProviderUserId"] ?? string.Empty; }

            private set { ViewState["ProviderUserId"] = value; }
        }

        protected string ProviderUserName
        {
            get { return (string)ViewState["ProviderUserName"] ?? string.Empty; }

            private set { ViewState["ProviderUserName"] = value; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ProcessProviderResult();
            }
        }
        protected void logIn_Click(object sender, System.EventArgs e)
        {
            CreateAndLoginUser();
        }

        protected void cancel_Click(object sender, System.EventArgs e)
        {
            RedirectToReturnUrl();
        }

        private void ProcessProviderResult()
        {
            // Process the results provided by an authentication provider in the request
            ProviderName = OpenAuth.GetProviderNameFromCurrentRequest();

            if (string.IsNullOrEmpty(ProviderName))
            {
                Response.Redirect(FormsAuthentication.LoginUrl);
            }

            // Generating the redirect URL for verification OpenAuth
            string redirectUrl = "~/Account/RegisterExternalLogin.aspx";
            string returnUrl = Request.QueryString["ReturnUrl"];
            if (!string.IsNullOrEmpty(returnUrl))
            {
                redirectUrl += "?ReturnUrl=" + HttpUtility.UrlEncode(returnUrl);
            }

            // Check the payload OpenAuth
            AuthenticationResult authResult = OpenAuth.VerifyAuthentication(redirectUrl);
            ProviderDisplayName = OpenAuth.GetProviderDisplayName(ProviderName);
            if (!authResult.IsSuccessful)
            {
                Title = "External Access Failed";
                userNameForm.Visible = false;

                ModelState.AddModelError("Provider", string.Format("external access with {0} failed.", ProviderDisplayName));

                // To view this error, enable tracing of the pages in web.config (<system.web> <trace enabled = "true" /> </ system.web>) and visit ~ / Trace.axd
                Trace.Warn("OpenAuth", string.Format("There was an error during the authentication occurs with {0})", ProviderDisplayName), authResult.Error);
                return;
            }

            // The user has logged in with your provider
            // Check if the user is already registered on the local computer
            if (OpenAuth.Login(authResult.Provider, authResult.ProviderUserId, createPersistentCookie: false))
            {
                RedirectToReturnUrl();
            }

            // Store provider data in ViewState
            ProviderName = authResult.Provider;
            ProviderUserId = authResult.ProviderUserId;
            ProviderUserName = authResult.UserName;

            // Remove the query string from the action
            Form.Action = ResolveUrl(redirectUrl);

            if ((User.Identity.IsAuthenticated))
            {
                // The user is already authenticated, add the account of external access and redirect to the URL returned
                OpenAuth.AddAccountToExistingUser(ProviderName, ProviderUserId, ProviderUserName, User.Identity.Name);
                RedirectToReturnUrl();
            }
            else
            {
                // The user is new, ask to specify the name of the intended parent
                userName.Text = authResult.UserName;
            }
        }

        private void CreateAndLoginUser()
        {
            if (!IsValid)
            {
                return;
            }

            CreateResult createResult = OpenAuth.CreateUser(ProviderName, ProviderUserId, ProviderUserName, userName.Text);

            if (!createResult.IsSuccessful)
            {

                ModelState.AddModelError("UserName", createResult.ErrorMessage);

            }
            else
            {
                // User is created and associated
                if (OpenAuth.Login(ProviderName, ProviderUserId, createPersistentCookie: false))
                {
                    RedirectToReturnUrl();
                }
            }
        }

        private void RedirectToReturnUrl()
        {
            string returnUrl = Request.QueryString["ReturnUrl"];
            if (!string.IsNullOrEmpty(returnUrl) & OpenAuth.IsLocalUrl(returnUrl))
            {
                Response.Redirect(returnUrl);
            }
            else
            {
                Response.Redirect("~/");
            }
        }
        public RegisterExternalLogin()
        {
            Load += Page_Load;
        }
    }
}

