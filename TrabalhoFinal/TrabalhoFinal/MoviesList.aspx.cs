using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace TrabalhoFinal
{
    public partial class MoviesList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            XmlReader reader = XmlReader.Create("http://www.myapifilms.com/imdb/top?format=XML&start=1&end=250&data=F");
            XmlDocument doc = new XmlDocument();
            doc.Load(reader);
            reader.Close();


            XmlDataSource1.Data = doc.OuterXml;
            XmlDataSource1.DataBind();
            XmlDataSource1.XPath = "/channel";

            XmlDocument xdoc2 = XmlDataSource1.GetXmlDocument();
            XmlNodeList noticias = xdoc2.SelectNodes("//movie");
            news.InnerHtml = "<ul>";
            

            foreach (XmlNode i in noticias)
            {
                Debug.WriteLine(i.Attributes["title"].Value);

                news.InnerHtml += ""+
                
                "<li>" +
                    "<a href = \"/filme/"+ i.Attributes["idIMDB"].Value + "\" >" +
                        "<div class=\"thumb\">" +
                            "<div class=\"img\" style=\"background-image: url('"+i.Attributes["urlPoster"].Value + "');\"></div>"+
                        "</div>" + 
                        "<div class=\"info\">"+
                            "<div class=\"title\">"+ i.Attributes["title"].Value + "</div>" + 
                            "<div class=\"infos\">" +
                                "<div class=\"year\">" + i.Attributes["year"].Value + "</div>" +
                                "<div class=\"imdb\">TMDB: " + i.Attributes["rating"].Value + "</div>" +
                            "</div>"+
                        "</div>"+
                    "</a>"+
                "</li>";
            }
            news.InnerHtml += "</ul>";
        }
    }
}