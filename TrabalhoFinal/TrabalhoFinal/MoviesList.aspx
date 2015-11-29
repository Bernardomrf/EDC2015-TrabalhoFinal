<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MoviesList.aspx.cs" Inherits="TrabalhoFinal.MoviesList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1><i class="fa fa-film"></i> Movies List</h1>
    <hr />

    <asp:XmlDataSource ID="XmlDataSource1" runat="server" TransformFile="~/App_Data/MoviesList.xsl" EnableCaching="false"></asp:XmlDataSource>
    <div id="wrapper">
        <div class ="center">
            <div class ="row">
                <div id="news" runat="server" class="list">
                </div>
            </div>
        </div>
    </div>
</asp:Content>
