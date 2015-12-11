using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace TrabalhoFinal
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            getRecent();
            getTop();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            XmlReader reader = XmlReader.Create("http://www.myapifilms.com/imdb/top?format=XML&start=1&end=200&data=F");
            XmlDocument doc = new XmlDocument();
            doc.Load(reader);
            reader.Close();


            XmlDataSource1.Data = doc.OuterXml;
            XmlDataSource1.DataBind();
            XmlDataSource1.XPath = "/channel";

            XmlDocument xdoc2 = XmlDataSource1.GetXmlDocument();
            XmlNodeList noticias = xdoc2.SelectNodes("//movie");

            foreach (XmlNode i in noticias)
            {
                String query = "INSERT INTO dbo.Movies (id,rating,year,poster,title) VALUES (@id,@rating, @year, @poster, @title)";
                using (SqlConnection connection = new SqlConnection("Data Source=localhost\\SQLEXPRESS;Initial Catalog=MoviesBS;Integrated Security=True;Pooling=False"))
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    //a shorter syntax to adding parameters
                    command.Parameters.Add("@id", SqlDbType.NChar).Value = i.Attributes["idIMDB"].Value;

                    command.Parameters.Add("@rating", SqlDbType.NChar).Value = i.Attributes["rating"].Value;

                    command.Parameters.Add("@year", SqlDbType.NChar).Value = i.Attributes["year"].Value;

                    command.Parameters.Add("@poster", SqlDbType.NChar).Value = i.Attributes["urlPoster"].Value;

                    command.Parameters.Add("@title", SqlDbType.NChar).Value = i.Attributes["title"].Value;

                    //make sure you open and close(after executing) the connection
                    connection.Open();
                    try
                    {
                        command.ExecuteNonQuery();
                    }
                    catch { }
                    connection.Close();
                }
            }

            reader = XmlReader.Create("http://www.myapifilms.com/imdb/top?format=XML&start=1&end=200&data=F");
            doc = new XmlDocument();
            doc.Load(reader);
            reader.Close();


            XmlDataSource1.Data = doc.OuterXml;
            XmlDataSource1.DataBind();
            XmlDataSource1.XPath = "/channel";

            xdoc2 = XmlDataSource1.GetXmlDocument();
            noticias = xdoc2.SelectNodes("//movie");


            foreach (XmlNode i in noticias)
            {
                string[] genres = i.Attributes["genre"].Value.Split(',');

                foreach (String a in genres)
                {
                    string query = "INSERT INTO dbo.Genres (id,genre) VALUES (@id,@genre)";
                    using (SqlConnection connection = new SqlConnection("Data Source=localhost\\SQLEXPRESS;Initial Catalog=MoviesBS;Integrated Security=True;Pooling=False"))
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        //a shorter syntax to adding parameters
                        command.Parameters.Add("@id", SqlDbType.NChar).Value = i.Attributes["idIMDB"].Value;

                        command.Parameters.Add("@genre", SqlDbType.NChar).Value = a;
                        //make sure you open and close(after executing) the connection
                        connection.Open();
                        try
                        {
                            command.ExecuteNonQuery();
                        }
                        catch { }
                        connection.Close();
                    }
                }
            }
        }

        private void getRecent()
        {
            string link = "http://localhost:49486/RSS/recent";

            XmlReader reader = XmlReader.Create(link);
            XmlDocument doc = new XmlDocument();
            doc.Load(reader);
            reader.Close();

            XmlDataSource3.Data = doc.OuterXml;
            XmlDataSource3.DataBind();
            XmlDataSource3.XPath = "/rss/channel";

            XmlDataSource2.Data = doc.OuterXml;
            XmlDataSource2.DataBind();
            XmlDataSource2.XPath = "/channel";

            XmlDocument xdoc1 = XmlDataSource3.GetXmlDocument();
            XmlDocument xdoc2 = XmlDataSource2.GetXmlDocument();
            XmlNodeList channel = xdoc1.SelectNodes("//channel");
            XmlNode info = channel[0];
            XmlNodeList noticias = xdoc2.SelectNodes("//item");

            recent.InnerHtml = "<ul>";

            foreach (XmlNode i in noticias)
            {
                recent.InnerHtml += "" +
                    "<li>" +
                        "<a href = \"/Movie?ID=" + i.Attributes["title"].Value + "\" >" +
                            "<div class=\"thumb\">" +
                                "<div class=\"img\" style=\"background-image: url('" + i.Attributes["poster"].Value + "');\"></div>" +
                            "</div>" +
                            "<div class=\"info\">" +
                                "<div class=\"title\">" + i.Attributes["title"].Value + "</div>" +
                                "<div class=\"infos\">" +
                                    "<div class=\"year\">" + i.Attributes["year"].Value + "</div>" +
                                    "<div class=\"imdb\">TMDB: " + i.Attributes["rating"].Value + "</div>" +
                                "</div>" +
                            "</div>" +
                        "</a>" +
                    "</li>";
            }
            recent.InnerHtml += "</ul>";
        }

        private void getTop()
        {
            string link = "http://localhost:49486/RSS/top";

            XmlReader reader = XmlReader.Create(link);
            XmlDocument doc = new XmlDocument();
            doc.Load(reader);
            reader.Close();

            XmlDataSource3.Data = doc.OuterXml;
            XmlDataSource3.DataBind();
            XmlDataSource3.XPath = "/rss/channel";

            XmlDataSource2.Data = doc.OuterXml;
            XmlDataSource2.DataBind();
            XmlDataSource2.XPath = "/channel";

            XmlDocument xdoc1 = XmlDataSource3.GetXmlDocument();
            XmlDocument xdoc2 = XmlDataSource2.GetXmlDocument();
            XmlNodeList channel = xdoc1.SelectNodes("//channel");
            XmlNode info = channel[0];
            XmlNodeList noticias = xdoc2.SelectNodes("//item");

            top.InnerHtml = "<ul>";

            foreach (XmlNode i in noticias)
            {
                top.InnerHtml += "" +
                    "<li>" +
                        "<a href = \"/Movie?ID=" + i.Attributes["title"].Value + "\" >" +
                            "<div class=\"thumb\">" +
                                "<div class=\"img\" style=\"background-image: url('" + i.Attributes["poster"].Value + "');\"></div>" +
                            "</div>" +
                            "<div class=\"info\">" +
                                "<div class=\"title\">" + i.Attributes["title"].Value + "</div>" +
                                "<div class=\"infos\">" +
                                    "<div class=\"year\">" + i.Attributes["year"].Value + "</div>" +
                                    "<div class=\"imdb\">TMDB: " + i.Attributes["rating"].Value + "</div>" +
                                "</div>" +
                            "</div>" +
                        "</a>" +
                    "</li>";
            }
            top.InnerHtml += "</ul>";
        }
    }
}