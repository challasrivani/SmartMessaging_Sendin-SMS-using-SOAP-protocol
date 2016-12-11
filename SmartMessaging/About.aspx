
<%@ Page Title = "Information" Language = "C#" MasterPageFile = "~ / Site.master" AutoEventWireup = "true" CodeBehind = "About.aspx.cs" Inherits = "SmartMessaging.About"%>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="MainContent">
    
        <hgroup class = "title">
        <h1> <%: Title%>. </h1>
        <h2> the app's description page. </h2>

        </hgroup>
        
    <article>
        
        <p>Use this area to provide additional information.</p>
        <p>Use this area to provide additional information.</p>
        <p>Use this area to provide additional information.</p>
    </article>
    <aside>
        <h3> Title apart </h3>
        <p>
            Use this area to provide additional information.
        </p>
        <ul>
            <li> <a runat="server" href="~/"> Home </a> </li>
            <li> <a runat="server" href="~/About.aspx"> </a> information </li>
            <li> <a runat="server" href="~/Contact.aspx"> Contact </a> </li>
        </ul>
    </aside>
    
</asp:Content>


    


    
