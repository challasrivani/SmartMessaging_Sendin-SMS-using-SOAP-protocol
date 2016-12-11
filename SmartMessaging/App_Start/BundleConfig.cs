namespace SmartMessaging.App_Start
{
    public class BundleConfig
    {
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/WebFormsJs").Include("~/Scripts/WebForms/WebForms.js",
                "~/Scripts/WebForms/WebUIValidation.js",
                "~/Scripts/WebForms/MenuStandards.js",
                "~/Scripts/WebForms/Focus.js",
                "~/Scripts/WebForms/GridView.js",
                "~/Scripts/WebForms/DetailsView.js",
                "~/Scripts/WebForms/TreeView.js",
                "~/Scripts/WebForms/WebParts.js"));

            //The order is very important for the functioning of these files since they have explicit dependencies
            bundles.Add(new ScriptBundle("~/bundles/MsAjaxJs").Include("~/Scripts/WebForms/MsAjax/MicrosoftAjax.js",
                "~/Scripts/WebForms/MsAjax/MicrosoftAjaxApplicationServices.js",
                "~/Scripts/WebForms/MsAjax/MicrosoftAjaxTimer.js",
                "~/Scripts/WebForms/MsAjax/MicrosoftAjaxWebForms.js"));

            // Use the development version of Modernizr to perform development activities and exercises. Later, when it is
            // ready to go to production, use the build tool at http://modernizr.com to select only the necessary tests
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include("~/Scripts/modernizr-*"));

        }
    }
}
