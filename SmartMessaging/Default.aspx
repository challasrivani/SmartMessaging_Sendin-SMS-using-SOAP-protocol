<%@ Page Title="Home page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SmartMessaging.Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1><%: Title %>.</h1>
                <h2>Modify this template to start the ASP.NET application.</h2>
            </hgroup>
            <p>
                For more information about ASP.NET, visit<a href="http://asp.net" title="ASP.NET Website">http://asp.net</a>.
                The page available <mark> video, tutorials and examples </ mark> to help you make the most of the potential of ASP.NET.
                 For any questions about ASP.NET, visit the <a href="http://forums.asp.net/18.aspx" title="ASP.NET Forum">forum</a> specific.
            </p>
        </div>
    </section>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h3>We recommend the following:</h3>
    <ol class="round">
        <li class="one">
            <h5>Introduction</h5>
            With ASP.NET Web Forms, you can create dynamic Web sites using a template driven by the simple and intuitive event-based drag and drop.
             This programming model provides developers a design surface and numerous controls and components to quickly create Web sites based on user interface powerful and impressive, with data access capabilities.
             <a href="http://go.microsoft.com/fwlink/?LinkId=245146"> More information ... </a>
        </li>
        <li class="two">
            <h5> Add packages NuGet and starts encoding </h5>
             NuGet simplifies installation and upgrading of libraries and free tools.
             <a href="http://go.microsoft.com/fwlink/?LinkId=245147"> More information ... </a>
        </li>
        <li class="three">
            <h5> Find Web Host </h5>
             You can easily find a web hosting company can offer functionality and adequate prices for their applications.
             <a href="http://go.microsoft.com/fwlink/?LinkId=245143"> More information ... </a>
        </li>
    </ol>
</asp:Content>
