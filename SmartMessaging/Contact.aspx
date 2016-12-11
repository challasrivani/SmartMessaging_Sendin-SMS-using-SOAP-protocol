<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="SmartMessaging.Contact" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1><%: Title %>.</h1>
        <h2>contact page.</h2>
    </hgroup>

    <section class="contact">
        <header>
            <h3>Telephone:</h3>
        </header>
        <p>
            <span class="label">Main:</span>
            <span>4255550100</span>
        </p>
        <p>
            <span class="label">Outside office hours:</span>
            <span>4255550199</span>
        </p>
    </section>

    <section class="contact">
        <header>
            <h3>Email:</h3>
        </header>
        <p>
            <span class="label">Support:</span>
            <span><a href="mailto:Support@example.com">Support@example.com</a></span>
        </p>
        <p>
            <span class="label">Marketing:</span>
            <span><a href="mailto:Marketing@example.com">Marketing@example.com</a></span>
        </p>
        <p>
            <span class="label">General:</span>
            <span><a href="mailto:General@example.com">General@example.com</a></span>
        </p>
    </section>

    <section class="contact">
        <header>
            <h3>Address:</h3>
        </header>
        <p>
            Meadowbank<br />
            Sydney, NSW 2114
        </p>
    </section>
</asp:Content>