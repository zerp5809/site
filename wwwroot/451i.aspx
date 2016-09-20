<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="451i.aspx.cs" Inherits="_421i" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="col-lg-6 col-lg-offset-1" style="margin-top: 25px;">
        <img src="/img/451p.PNG" class="img-responsive">
        <br>
        <asp:Button ID="Button1" CssClass="button1" runat="server" Text="View Project" OnClick="Button1_Click" />
    </div>
    
    <div class="col-lg-4 col-sm-12">
        <h1>About</h1>
        <p>This is a project I created for my CIS 451 class. This project not only tested my skills as a web developer, but also as an application developer. In this project we attached a SQL database to an ASP website, then we used queries to choose different categories for products, in this case I chose Headphones. 
        </p>
        <p> 
            <ul>
                <li>Converted an HTML site to work in ASP</li>
                <li>Project code behind is Visual Basic</li>
                <li>Executed SQL queries to access database</li>
            </ul>
        </p>
    </div>
    
</asp:Content>

