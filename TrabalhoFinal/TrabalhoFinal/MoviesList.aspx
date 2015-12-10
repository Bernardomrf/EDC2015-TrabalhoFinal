<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MoviesList.aspx.cs" Inherits="TrabalhoFinal.MoviesList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1><i class="fa fa-film"></i> Movies List</h1>
   
        <asp:DropDownList AppendDataBoundItems="true" CssClass="btn btn-success dropdown-toggle" ID="DropDownList1" AutoPostBack="true" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" DataSourceID="SqlDataSource1" DataTextField="genre" DataValueField="genre">
        <asp:ListItem>All</asp:ListItem>
        <asp:ListItem Enabled="false">----------</asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MoviesBSConnectionString2 %>" SelectCommand="SELECT DISTINCT [genre] FROM [Genres]"></asp:SqlDataSource>
    
        <asp:DropDownList AppendDataBoundItems="true" CssClass="btn btn-success dropdown-toggle" ID="DropDownList2" AutoPostBack="true" runat="server" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" DataTextField="rating" DataValueField="rating">
            <asp:ListItem>Any</asp:ListItem>
            
            <asp:ListItem Enabled="false">----------</asp:ListItem>           
            <asp:ListItem>Higher Rating</asp:ListItem>
            <asp:ListItem>Lower Rating</asp:ListItem>
            <asp:ListItem Enabled="false">----------</asp:ListItem>
            <asp:ListItem>Newer</asp:ListItem>
            <asp:ListItem>Older</asp:ListItem>
        </asp:DropDownList>
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
