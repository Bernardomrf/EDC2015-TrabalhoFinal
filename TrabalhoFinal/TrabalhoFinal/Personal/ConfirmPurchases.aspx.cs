using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace TrabalhoFinal.Personal
{
    public partial class ConfirmPurchases : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string url = Request.QueryString["ID"];
            //Button2.PostBackUrl = "~/Personal/MyArea";
            string apiLink = "http://www.omdbapi.com/?i=" + url + "&plot=short&r=xml";
            
            XmlReader reader = XmlReader.Create(apiLink);
            XmlDocument doc = new XmlDocument();
            doc.Load(reader);
            reader.Close();
            XmlDataSource1.Data = doc.OuterXml;
            XmlDataSource1.DataBind();
            XmlDataSource1.XPath = "/root/movie";
            XmlDocument xdoc1 = XmlDataSource1.GetXmlDocument();
            XmlNode info = xdoc1.SelectSingleNode("/root/movie");

            movie.InnerText = info.Attributes["title"].Value;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated)
                Debug.WriteLine(User.Identity.Name);

            String query = "INSERT INTO dbo.Purchases (id,email) VALUES (@id,@email)";
            using (SqlConnection connection = new SqlConnection("Data Source=BERNARDOFER78A1\\SQLEXPRESS;Initial Catalog=MoviesBS;Integrated Security=True;Pooling=False"))
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                //a shorter syntax to adding parameters
                command.Parameters.Add("@id", SqlDbType.NChar).Value = Request.QueryString["ID"];

                command.Parameters.Add("@email", SqlDbType.NChar).Value = User.Identity.Name;

                //make sure you open and close(after executing) the connection
                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }

            Response.Redirect("~/Personal/MyArea");
        }
    }
}