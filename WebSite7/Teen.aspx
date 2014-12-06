<%@ Page Title="Teens" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Teen.aspx.cs" Inherits="Teen" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>Teens</h1>
                <br />
                <h2>(ages 13-17)</h2>            
            </hgroup>
            <p>
                Info on page
            </p>
        </div>
    </section>
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2>Jobs:</h2>

    <script language="JavaScript">

        var Connect = new XMLHttpRequest();
        Connect.open("GET", "scrapeddata.xml", false);
        Connect.send(null);
        var TheDocument = Connect.responseXML;
        var Root = TheDocument.childNodes[0];

        document.write(" <ol class='round'>")
        for (var i = 0; i < Root.children.length; i++) {

            var Job = Root.children[i];
            // Access each of the data values.
            var Name = Job.getElementsByTagName("name");
            var summary = Job.getElementsByTagName("summary");
            var jobsavail = Job.getElementsByTagName("jobs_avail");
            var edureq = Job.getElementsByTagName("edu_req");

            document.write("<li class='zero'>");
            document.write("<h3>" + Name[0].textContent.toString() + "</h3>");
            document.write("<h5>Summary of Job:</h5>");
            document.write(summary[0].textContent.toString());
            document.write("<br/>");
            document.write("<h5>Jobs Curently Avaliable In Louisiana: </h5>");
            document.write(jobsavail[0].textContent.toString());
            document.write("<br/>");
            document.write("<h5>Education Requiered for this Job: </h5>");
            document.write(edureq[0].textContent.toString());
            document.write("</li>");
        }
        document.write("</ol>");
</script>
</asp:Content>
