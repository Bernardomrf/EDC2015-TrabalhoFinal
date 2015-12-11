<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TrabalhoFinal._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:XmlDataSource ID="XmlDataSource3" runat="server" TransformFile="~/App_Data/channel.xsl" EnableCaching="false"></asp:XmlDataSource>
    <asp:XmlDataSource ID="XmlDataSource2" runat="server" TransformFile="~/App_Data/noticias.xsl" EnableCaching="false"></asp:XmlDataSource>
    <div class="jumbotron">
        <h1>
            <asp:XmlDataSource ID="XmlDataSource1" runat="server" TransformFile="~/App_Data/Movie.xsl"></asp:XmlDataSource>
            Movies Bookshelf & Store</h1>
        <p class="lead"> Movies B&S is an online platform for buying and review the best movies ever made.</p>
        <p><a href="MoviesList" class="btn btn-primary btn-lg">Movies List &raquo;</a></p>
    </div>
    <div class="col-md-12">
            <h2>Populate Database (isto e para sair daqui)</h2>
            <p>
               
                <asp:Button ID="Button2" CssClass="btn btn-primary" runat="server" OnClick="Button1_Click" Text="Button" />
               
            </p>
    </div>
    <p></p>
    <div id="wrapper">
        <div class ="center">
            <div class ="row">
                <div class="col-md-12">
                    <h2>Recent Addictions</h2>
                    <div id="recent" runat="server" class="list">
                    </div>
                </div>
                <div class="col-md-12">
                    <h2>Top Sellers</h2>
                    <div id="top" runat="server" class="list">
                    </div>
                </div>
            </div>
        </div>
     </div>


</asp:Content>
