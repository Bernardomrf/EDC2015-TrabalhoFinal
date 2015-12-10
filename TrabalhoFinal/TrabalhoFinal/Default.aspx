<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TrabalhoFinal._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>
            <asp:XmlDataSource ID="XmlDataSource1" runat="server" TransformFile="~/App_Data/Movie.xsl"></asp:XmlDataSource>
            Movies Bookshelf & Store</h1>
        <p class="lead"> Movies B&S is an online platform for buying and review the best movies ever made.</p>
        <p><a href="MoviesList" class="btn btn-primary btn-lg">Movies List &raquo;</a></p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Populate Database</h2>
            <p>
                Run scripts to populate Database
            </p>
            <p>
               
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
               
            </p>
        </div>
        <div class="col-md-4">
            <h2>Get more libraries</h2>
            <p>
                NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Web Hosting</h2>
            <p>
                You can easily find a web hosting company that offers the right mix of features and price for your applications.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
