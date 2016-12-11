using System;
using System.Web;
using System.Web.Security;
using System.Web.UI;

namespace SmartMessaging
{

    public partial class Site : System.Web.UI.MasterPage
    {
        const string AntiXsrfTokenKey = "__AntiXsrfToken";
        const string AntiXsrfUserNameKey = "__AntiXsrfUserName";

        string _antiXsrfTokenValue;
        protected void Page_Init(object sender, System.EventArgs e)
        {
            // The following code helps protect from attacks XSRF
            HttpCookie requestCookie = Request.Cookies(AntiXsrfTokenKey);
            Guid requestCookieGuidValue = default(Guid);
            if ((((requestCookie != null)) && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue)))
            {
                // Use the token Anti-XSRF from cookies
                _antiXsrfTokenValue = requestCookie.Value;
                Page.ViewStateUserKey = _antiXsrfTokenValue;
            }
            else
            {
                // Generate a new token Anti-XSRF and save it in the cookie
                _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
                Page.ViewStateUserKey = _antiXsrfTokenValue;

                HttpCookie responseCookie = new HttpCookie(AntiXsrfTokenKey)
                {
                    HttpOnly = true,
                    Value = _antiXsrfTokenValue
                };
                if ((FormsAuthentication.RequireSSL & Request.IsSecureConnection))
                {
                    responseCookie.Secure = true;
                }
                Response.Cookies.Set(responseCookie);
            }

            Page.PreLoad += master_Page_PreLoad;
        }
        private void master_Page_PreLoad(object sender, System.EventArgs e)
        {
            if ((!IsPostBack))
            {
                // Set the Anti-XSRF token
                ViewState(AntiXsrfTokenKey) = Page.ViewStateUserKey;
                ViewState(AntiXsrfUserNameKey) = Context.User.Identity.Name ?? string.Empty;
            }
            else
            {
                // Validate Anti-XSRF token
                if ((!((string)ViewState(AntiXsrfTokenKey) == _antiXsrfTokenValue) | !((string)ViewState(AntiXsrfUserNameKey) == Context.User.Identity.Name ?? string.Empty)))
                {
                    throw new InvalidOperationException("Validation of the token Anti-XSRF failed.");
                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void SiteMaster()
        {
            Load += Page_Load;
        }
    }
}
