using Microsoft.AspNet.Membership.OpenAuth;
using System;
using System.Web.Security;

namespace SmartMessaging.Account
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RegisterUser.ContinueDestinationPageUrl = Request.QueryString("ReturnUrl");
        }
        protected void RegisterUser_CreatedUser(object sender, EventArgs e)
        {
            FormsAuthentication.SetAuthCookie(RegisterUser.UserName, createPersistentCookie: false);

            string continueUrl = RegisterUser.ContinueDestinationPageUrl;
            if (!OpenAuth.IsLocalUrl(continueUrl))
            {
                continueUrl = "~/";
            }

            Response.Redirect(continueUrl);
        }
        public Register()
        {
            Load += Page_Load;
        }
    }
}
