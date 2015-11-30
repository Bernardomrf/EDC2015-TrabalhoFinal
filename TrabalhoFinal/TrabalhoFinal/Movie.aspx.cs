using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace TrabalhoFinal
{
    public partial class Movie : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string url = Request.QueryString["ID"];
            string apiLink = "http://www.omdbapi.com/?i=" + url + "&plot=full&r=xml";
            if (url == null)
            {
                apiLink = "http://www.omdbapi.com/?i=tt0111161&plot=full&r=xml";
            }
            
            XmlReader reader = XmlReader.Create(apiLink);
            XmlDocument doc = new XmlDocument();
            doc.Load(reader);
            reader.Close();
            
            XmlDataSource1.Data = doc.OuterXml;
            
            XmlDataSource1.DataBind();
            XmlDataSource1.XPath = "/root/movie";

            DetailsView1.DataBind();

            XmlDocument xdoc1 = XmlDataSource1.GetXmlDocument();
            XmlNode info = xdoc1.SelectSingleNode("/root/movie");
            DetailsView1.DataBind();

            image.InnerHtml = "<img border=\"0\" alt=\"" + info.Attributes["title"].Value + "\" src=\"" + info.Attributes["poster"].Value + "\">";
            movieName.InnerHtml+= info.Attributes["title"].Value;


            //XmlDataSource1.XPath = "/channel";

        }
    }
}