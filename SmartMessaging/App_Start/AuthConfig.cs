using Microsoft.AspNet.Membership.OpenAuth;

namespace SmartMessaging.App_Start
{
    public static class AuthConfig
    {
        public static void RegisterOpenAuth()
        {

            OpenAuth.AuthenticationClients.AddTwitter("User code personal Twitter","User secret personal Twitter");

            OpenAuth.AuthenticationClients.AddFacebook("Personal Facebook App ID","Secret personal Facebook app");

            OpenAuth.AuthenticationClients.AddMicrosoft("Microsoft account personal client ID","Microsoft client secret personal account");

            OpenAuth.AuthenticationClients.AddGoogle()
        }
    }
}



