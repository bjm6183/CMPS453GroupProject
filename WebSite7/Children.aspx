﻿<%@ Page Title="Children" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Children.aspx.cs" Inherits="Children" %>


<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>Children</h1>
                <br />
                <h2>(Ages 6-12)</h2>           
            </hgroup>
            <p>
                This page is for children ages 6 to 12 that are interested in learning about the IT field and what jobs are offered.
            </p>
        </div>
    </section>
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
   
    <h1>Jobs:</h1>
   
<script type="text/JavaScript">

    var Connect = new XMLHttpRequest();

    Connect.open("GET", "scrapeddata.xml", false);

    Connect.send(null);

    var TheDocument = Connect.responseXML;

    var Root = TheDocument.childNodes[0];

        document.write("<ol class='round'>");
        for (var i = 0; i < Root.children.length; i++) {

            var Job = Root.children[i];

            // Access each of the data values.
            var Name = Job.getElementsByTagName("name");
            var summary = Job.getElementsByTagName("summary");
            var edureq = Job.getElementsByTagName("edu_req");

            document.write("<li class='zero'>");
            document.write("<h2>" + Name[0].textContent.toString() + "</h2>");
            document.write("<h3>Summary:</h3>");
            document.write(summary[0].textContent.toString());
            document.write("<br/>");
            document.write("<h3>Education Requirements: </h3>");
            document.write(edureq[0].textContent.toString());
            document.write("<br/>" + "<br/>" + "<br/>" + "</li>");
        }
        document.write("</ol>");
</script>
</asp:Content>