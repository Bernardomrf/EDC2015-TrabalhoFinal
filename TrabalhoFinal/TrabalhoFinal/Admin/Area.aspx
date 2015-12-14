<%@ Page Title="" EnableEventValidation="false" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Area.aspx.cs" Inherits="TrabalhoFinal.Admin.Area" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Admin Area</h1>
   <asp:XmlDataSource ID="XmlDataSource1" runat="server" TransformFile="~/App_Data/Movie.xsl"></asp:XmlDataSource>

   <hr/>

    <div class="bs-docs-section">

        <div class="row">
          <div class="col-lg-6">
            <div class="well bs-component">
              <form class="form-horizontal">
                <fieldset>
                  <legend>Actions</legend>
                  <div class="form-group">
                    <label class="col-lg-4 control-label">Populate Database</label>
                    <div class="col-lg-8">
                        <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" OnClick="Button1_Click" Text="Just do it" />
                        <p> </p>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-lg-4 control-label">Insert Movie</label>
                    <div class="col-lg-6">
                      <input class="form-control" id="idInput">
                    </div>
                    <div class="col-lg-2">
                      <asp:Button ID="Button2" CssClass="btn btn-primary" runat="server" OnClick="Button2_Click" Text="Insert" />
                      <p> </p>
                    </div>
                  </div>
                  

                
                </fieldset>
              </form>
            </div>
          </div>
          <div class="col-lg-6">
            <div class="well bs-component">
              <form class="form-horizontal">
                <fieldset>
                  <legend>Statistics</legend>
                  <div class="form-group">
                    <label class="col-lg-4 control-label" style="text-align:left;">  Number of Movies:</label>
                    <label class="col-lg-8 control-label" style="text-align:left;">100</label>
                  </div>

                  <div class="form-group">
                    <label class="col-lg-4 control-label" style="text-align:left;">  Number of Users:</label>
                    <label class="col-lg-8 control-label" style="text-align:left;">100</label>
                  </div>

                  <div class="form-group">
                    <label class="col-lg-4 control-label" style="text-align:left;">  Number of Comments:</label>
                    <label class="col-lg-8 control-label" style="text-align:left;">100</label>
                  </div>

                </fieldset>
              </form>
            </div>
          </div>
        </div>
      </div>
</asp:Content>
