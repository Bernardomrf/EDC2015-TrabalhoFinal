<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MoviesList.aspx.cs" Inherits="TrabalhoFinal.MoviesList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1><i class="fa fa-film"></i> Movies List</h1>
    <p>
        <asp:DropDownList AppendDataBoundItems="true" CssClass="btn btn-success dropdown-toggle" ID="DropDownList1" AutoPostBack="true" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" DataSourceID="SqlDataSource1" DataTextField="genre" DataValueField="genre">
        <asp:ListItem>All</asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MoviesBSConnectionString %>" SelectCommand="SELECT DISTINCT [genre] FROM [Genres]"></asp:SqlDataSource>
    </p>
    <p>
        <asp:DropDownList AppendDataBoundItems="true" CssClass="btn btn-success dropdown-toggle" ID="DropDownList2" AutoPostBack="true" runat="server" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" DataSourceID="SqlDataSource1" DataTextField="genre" DataValueField="genre">
            <asp:ListItem>0-1</asp:ListItem>
            <asp:ListItem>1-2</asp:ListItem>
            <asp:ListItem>2-3</asp:ListItem>
            <asp:ListItem>3-4</asp:ListItem>
            <asp:ListItem>5-6</asp:ListItem>
            <asp:ListItem>6-7</asp:ListItem>
            <asp:ListItem>7-8</asp:ListItem>
            <asp:ListItem>8-9</asp:ListItem>
            <asp:ListItem>9-10</asp:ListItem>
        </asp:DropDownList>
    </p>
    <hr />

    <div id="wrapper">
        <div class ="center">
            <div class ="row">
                <div id="news" runat="server" class="list">
                </div>
            </div>
        </div>
    </div>
</asp:Content>
