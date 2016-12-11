using System;
using System.Web;

namespace SmartMessaging.Account
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RegisterHyperLink.NavigateUrl = "Register.aspx";
            OpenAuthLogin.ReturnUrl = Request.QueryString("ReturnUrl");

            dynamic returnUrl = HttpUtility.UrlEncode(Request.QueryString("ReturnUrl"));
            if (!string.IsNullOrEmpty(returnUrl))
            {
                RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
            }

        }
        public Login()
        {
            Load += Page_Load;
        }
    }
}
