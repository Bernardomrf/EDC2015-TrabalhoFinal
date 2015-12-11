<%@ Page Language="C#" ContentType="text/xml" AutoEventWireup="true" CodeBehind="recent.aspx.cs" Inherits="TrabalhoFinal.RSS.recent" %>


<asp:Repeater id="RepeaterRSS" runat="server">
        <HeaderTemplate>
           <rss version="2.0">
                <channel>
                    <title>MoviesBS</title>
                    <link>http://www.moviesBS.com</link>
                    <description>
                        Movies B&amp;S is an online platform for buying and review the best movies ever made.
                    </description>
                    <language>en-EN</language>
        </HeaderTemplate>
        <ItemTemplate>
            <item>
                <id><%# RemoveIllegalCharacters(DataBinder.Eval(Container.DataItem, "id")) %></id>
                <rating><%# RemoveIllegalCharacters(DataBinder.Eval(Container.DataItem, "rating")) %></rating>
                <year><%# RemoveIllegalCharacters(DataBinder.Eval(Container.DataItem, "year"))%></year>
                <poster><%# RemoveIllegalCharacters(DataBinder.Eval(Container.DataItem, "poster"))%></poster>
                <title><%# RemoveIllegalCharacters(DataBinder.Eval(Container.DataItem, "title"))%></title>
            </item>
        </ItemTemplate>
        <FooterTemplate>
                </channel>
            </rss>  
        </FooterTemplate>
</asp:Repeater>


