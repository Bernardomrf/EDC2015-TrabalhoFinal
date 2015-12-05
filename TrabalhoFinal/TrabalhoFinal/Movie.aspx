<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Movie.aspx.cs" Inherits="TrabalhoFinal.Movie" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1 id="movieName" runat="server"></h1>
    <hr/>
    
    <asp:XmlDataSource ID="XmlDataSource1" runat="server" EnableCaching="false"></asp:XmlDataSource>
    
    <div runat="server" class="row">
        <div class="col-lg-8">
            <h3>Movie Info</h3>
            <asp:DetailsView CssClass="table" GridLines="None" ID="DetailsView1" runat="server" DataSourceID="XmlDataSource1" AutoGenerateRows="False" >
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
                    <asp:BoundField DataField="imdbID" HeaderText="IMDB ID" SortExpression="imdbID" /> 

                </Fields>
            </asp:DetailsView>
        </div>
        <div class="col-lg-4">
            <h3>Poster</h3>
            <div id="image" runat="server">
            </div>
            <p>

            </p>
            <div>
                    <asp:Button CssClass="button" ID="Button1" runat="server" Text="Purchase" Width="300"/>
            </div>
        </div>
    </div> 
     <hr/>

    <div class="container">
        <div class="col-lg-12 col-sm-6 text-left">
            <div class="well">
                <h4>Review this movie</h4>
                <div class="input-group">
                    <input type="text" id="userComment" class="form-control input-sm chat-input" runat="server" placeholder="Write your review here..." />
	                <span class="input-group-btn"> 
                        <asp:Button CssClass="btn btn-primary btn-sm" ID="Button2" runat="server" Text="Add Review" OnClick="Button2_Click" />  
                    </span>
                </div>
                
                <ul id="sortable" runat="server" class="list-unstyled ui-sortable">
                    
                </ul>

       </div>    
     </div>
</div>


</asp:Content>
