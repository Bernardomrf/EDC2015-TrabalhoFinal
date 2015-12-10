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
    }
}