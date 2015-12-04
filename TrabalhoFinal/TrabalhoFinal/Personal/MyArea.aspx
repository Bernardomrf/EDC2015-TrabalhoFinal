<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyArea.aspx.cs" Inherits="TrabalhoFinal.Personal.MyArea" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1><i class="fa fa-user"></i> My Area</h1>
    
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
