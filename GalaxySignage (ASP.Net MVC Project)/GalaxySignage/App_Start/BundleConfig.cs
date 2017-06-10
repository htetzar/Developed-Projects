using System.Web;
using System.Web.Optimization;

namespace GalaxySignage
{
    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at http://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.js",
                      "~/Scripts/respond.js"));

            bundles.Add(new ScriptBundle("~/bundles/FileUpload").Include(
                      //"~/Content/FileUpload/jquery-{version].min.js",
                      //"~/Content/FileUpload/jquery-ui-{version}.min.js",
                      //"~/Content/FileUpload/jquery-{version].js",
                      "~/Scripts/jquery-ui-{version}.js",
                      "~/Content/FileUpload/tmpl.min.js",
                      "~/Content/FileUpload/canvas-to-blob.min.js",
                      "~/Content/FileUpload/load-image.min.js",
                      "~/Content/FileUpload/jquery.iframe-transport.js",
                      "~/Content/FileUpload/jquery.fileupload.js",
                      "~/Content/FileUpload/jquery.fileupload-ip.js",
                      "~/Content/FileUpload/jquery.fileupload-ui.js",
                      "~/Content/FileUpload/locale.js",
                      "~/Content/FileUpload/main.js"));

            bundles.Add(new StyleBundle("~/Content/cssFileupload").Include(
                      "~/Content/FileUpload/jquery.fileupload-ui.css"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/bootstrap.css",
                      "~/Content/bootstrap-responsive.css",
                      "~/Content/site.css"));
            bundles.Add(
                new StyleBundle("~/Content/chosen").Include(
                "~/Content/chosen.css"
                ));
        }
    }
}
