using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using UrlSharer;

namespace OnlineUtilities
{
    public partial class UrlSharerDemo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static UrlInfo GetUrlInfo(string url)
        {
            UrlInfo urlInfo = UrlSharer.UrlSharer.GetUrlInfo(url);
            return urlInfo;
        }
        [WebMethod]
        public static UrlSharer.UrlInfo GetDate()
        {
            UrlInfo uInfo = new UrlInfo();
            uInfo.Description = "test";
            uInfo.Title = "test";
            uInfo.Images = new List<string>();
            uInfo.Images.Add("http://google.com");
            return uInfo;
        }
    }
}