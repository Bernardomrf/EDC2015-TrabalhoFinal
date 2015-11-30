﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Movie.aspx.cs" Inherits="TrabalhoFinal.Movie" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1 id="movieName" runat="server"><i class="fa fa-video-camera"></i> </h1>
    <hr/>
    
    <asp:XmlDataSource ID="XmlDataSource1" runat="server" EnableCaching="false"></asp:XmlDataSource>
    
    <div runat="server" class="row">
        <div class="col-lg-8">
            <h3>Movie Info</h3>
            <asp:DetailsView CssClass="table table-bordered" ID="DetailsView1" runat="server" DataSourceID="XmlDataSource1" AutoGenerateRows="False" >
                <Fields>
                    <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title" />
                    <asp:BoundField DataField="year" HeaderText="Year" SortExpression="year" />
                    <asp:BoundField DataField="released" HeaderText="Release Date" SortExpression="released" />
                    <asp:BoundField DataField="runtime" HeaderText="Runtime" SortExpression="runtime" />
                    <asp:BoundField DataField="genre" HeaderText="Genres" SortExpression="genre" />
                    <asp:BoundField DataField="director" HeaderText="Director" SortExpression="director" />
                    <asp:BoundField DataField="writer" HeaderText="Writer" SortExpression="writer" />
                    <asp:BoundField DataField="actors" HeaderText="Actors" SortExpression="actors" />   
                    <asp:BoundField DataField="plot" HeaderText="Plot" SortExpression="plot" /> 
                    <asp:BoundField DataField="language" HeaderText="Language" SortExpression="language" /> 
                    <asp:BoundField DataField="country" HeaderText="Country" SortExpression="country" /> 
                    <asp:BoundField DataField="awards" HeaderText="Awards" SortExpression="awards" /> 
                    <asp:BoundField DataField="metascore" HeaderText="Metascore" SortExpression="metascore" /> 
                    <asp:BoundField DataField="imdbRating" HeaderText="IMDB Rating" SortExpression="imdbRating" /> 

                </Fields>
            </asp:DetailsView>
        </div>
        <div class="col-lg-4">
            <h3>Poster</h3>
            <div id="image" runat="server">
            </div>
        </div>
    </div> 

</asp:Content>