<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MoviesList.aspx.cs" Inherits="TrabalhoFinal.MoviesList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1><i class="fa fa-film"></i> Movies List</h1>
    <p>
        <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem>Year</asp:ListItem>
            <asp:ListItem>Rating</asp:ListItem>
            <asp:ListItem>Title</asp:ListItem>
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
