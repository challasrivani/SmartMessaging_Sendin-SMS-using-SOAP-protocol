using Microsoft.AspNet.Membership.OpenAuth;
using System;
using System.Collections.Generic;

namespace SmartMessaging.Account
{
    public partial class Manage : System.Web.UI.Page
    {
        private string successMessageTextValue;
        protected string SuccessMessageText
        {
            get { return successMessageTextValue; }
            private set { successMessageTextValue = value; }
        }

        private bool canRemoveExternalLoginsValue;
        protected bool CanRemoveExternalLogins
        {
            get { return canRemoveExternalLoginsValue; }
            set { canRemoveExternalLoginsValue = value; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Determine the sections of which render
                dynamic hasLocalPassword = OpenAuth.HasLocalPassword(User.Identity.Name);
                setPassword.Visible = !hasLocalPassword;
                changePassword.Visible = hasLocalPassword;

                CanRemoveExternalLogins = hasLocalPassword;

                // completion of the rendering message
                dynamic message = Request.QueryString["m"];
                
                if ((message != null))
                {
                    // Remove the query string from the action
                    Form.Action = ResolveUrl("~/Account/Manage.aspx");

                    switch ((string)message)
                    {
                        case "ChangePwdSuccess":
                            SuccessMessageText = "Complete change password.";
                            break;
                        case "SetPwdSuccess":
                            SuccessMessageText = "Setting completed passwords.";
                            break;
                        case "RemoveLoginSuccess":
                            SuccessMessageText = "The external access account has been removed.";
                            break;
                        default:
                            SuccessMessageText = string.Empty;
                            break;
                    }

                    successMessage.Visible = !string.IsNullOrEmpty(SuccessMessageText);
                }
            }

        }
        protected void setPassword_Click(object sender, System.EventArgs e)
        {
            if (IsValid)
            {
                SetPasswordResult result = OpenAuth.AddLocalPassword(User.Identity.Name, password.Text);
                if (result.IsSuccessful)
                {
                    Response.Redirect("~/Account/Manage.aspx?m=SetPwdSuccess");
                }
                else
                {

                    ModelState.AddModelError("NewPassword", result.ErrorMessage);

                }
            }
        }


        public IEnumerable<OpenAuthAccountData> GetExternalLogins()
        {
            dynamic accounts = OpenAuth.GetAccountsForUser(User.Identity.Name);
            CanRemoveExternalLogins = CanRemoveExternalLogins || accounts.Count() > 1;
            return accounts;
        }

        public void RemoveExternalLogin(string providerName, string providerUserId)
        {
            dynamic m = OpenAuth.DeleteAccount(User.Identity.Name, providerName, providerUserId) ? "?m=RemoveLoginSuccess" : string.Empty;
            Response.Redirect("~/Account/Manage.aspx" + m);
        }


        protected static string ConvertToDisplayDateTime(Nullable<DateTime> utcDateTime)
        {
            // You can modify this method to convert the date and time UTC according to the offset and size
            // Desired display. In this case the conversion based on the server time is executed and in the format
            // Date short and long time, according to the settings of the current thread culture.
            return utcDateTime.HasValue ? utcDateTime.Value.ToLocalTime().ToString("G") : "[mai]";
        }
        public Manage()
        {
            Load += Page_Load;
        }
    }
   
}


