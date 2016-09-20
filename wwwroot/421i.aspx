<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="421i.aspx.cs" Inherits="_421i" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="col-lg-6 col-lg-offset-1" style="margin-top: 25px;">
        <img src="img/421p.png" class="img-responsive">
        <br>
        <asp:Button ID="Button1" CssClass="button1" runat="server" Text="View Project" OnClick="Button1_Click" />
    </div>
    
    <div class="col-lg-4 col-sm-12">
        <h1>About</h1>
        <p>This is a project I created for my CIS 421 class. I was given a specific set of instructions to create a website with five different pages, and show different ways of how to use Photoshop. We created home, 
            gallery, video, webmaster, and manipulations pages. As part of the instructions I had to choose a theme for the site based on the prompt "100 not so famous views of ______". Because I did a bit of travling 
            that previous summer I chose the theme of my travels. The manipulations page is a collection of images edited using different photoshop Tools. 
        </p>
        <p> I originally created this website with my own custom css to learn more about how a global.css file would affect a simple html page, but then converted the project to use the Bootstrap framework. The
            Bootstrap framework allowed me to display the website with better organization, and allowed me to create a simple image viewer using the built in modal component.
        </p>
    </div>
    
</asp:Content>

