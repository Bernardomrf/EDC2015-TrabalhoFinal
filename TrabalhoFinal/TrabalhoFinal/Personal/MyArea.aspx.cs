﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TrabalhoFinal.Personal
{
    public partial class MyArea : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                String sql = "SELECT Movies.id, rating, year, poster, title FROM dbo.Purchases, dbo.Movies WHERE email = '" + User.Identity.Name + "' AND Movies.id = Purchases.id";
                SqlConnection connection = new SqlConnection("Data Source=BERNARDOFER78A1\\SQLEXPRESS;Initial Catalog=MoviesBS;Integrated Security=True;Pooling=False");
                SqlCommand command = new SqlCommand(sql, connection);

                DataTable table = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                adapter.Fill(table);
                connection.Open();
                news.InnerHtml = "<ul>";
                foreach (DataRow row in table.Rows)
                {
                    Debug.WriteLine(row["title"].ToString());

                    news.InnerHtml += "" +

                    "<li>" +
                        "<a href = \"/Movie?ID=" + row["id"].ToString() + "\" >" +
                            "<div class=\"thumb\">" +
                                "<div class=\"img\" style=\"background-image: url('" + row["poster"].ToString() + "');\"></div>" +
                            "</div>" +
                            "<div class=\"info\">" +
                                "<div class=\"title\">" + row["title"].ToString() + "</div>" +
                                "<div class=\"infos\">" +
                                    "<div class=\"year\">" + row["year"].ToString() + "</div>" +
                                    "<div class=\"imdb\">TMDB: " + row["rating"].ToString() + "</div>" +
                                "</div>" +
                            "</div>" +
                        "</a>" +
                    "</li>";

                }
                connection.Close();
            }
            catch
            {
            }
            news.InnerHtml += "</ul>";
        }
    }
}