<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="PebbleCounter.aspx.cs" Inherits="_421i" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="col-lg-6 col-lg-offset-1" style="margin-top: 25px;">
        <img src="/img/PebbleCounter.PNG" class="img-responsive">
        <br>
        <asp:Button ID="Button1" CssClass="button1" runat="server" Text="View Source Code" OnClick="Button1_Click" />
    </div>
    
    <div class="col-lg-4 col-sm-12">
        <h1>About</h1>
        <p>This is a project I started in order to learn the Pebble Developer kit using the documentation provided on Pebble's website and other sources I created this simple counting app for the Pebble smartwatch. 
        </p>
        <p> 
            <ul>
                <li>Programed in Pebble C on Pebble's cloud web IDE: CloudPebble</li>
                <li>Uses Github and  CloudPebble for Version Control</li>
            </ul>
        </p>
    </div>
    
</asp:Content>

