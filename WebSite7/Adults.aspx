<%@ Page Title="Adults" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Adults.aspx.cs" Inherits="Adults" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>Adults</h1>
                <br />
                <h2>(ages 18 & Up)</h2>                
            </hgroup>
            <p>
                Info on page
            </p>
        </div>
    </section>
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
<%--    <button onclick="toggleSupplyDemand()" id="supdemButton">Hide supply and demand</button>
    <button >Toggle Job city locations</button>--%>

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
            var ntnlsupplydemand = Job.getElementsByTagName("ntnl_supply_demand");
            var edureq = Job.getElementsByTagName("edu_req");
            var place = Job.getElementsByTagName("place");

            for (var i = 0; i < place.length; i++) {
                var placename = place[i].getElementsByTagName('placename');
                document.write(placename[0].textContent.toString());
            }
            
            
            document.write("<li class='zero'>");
            document.write("<h3>" + Name[0].textContent.toString() + "</h3>");
            document.write("<h5>Summary of Job:</h5>");
            document.write(summary[0].textContent.toString());
            document.write("<br/>");
            document.write("<h5>Education Requiered for this Job: </h5>");
            document.write(edureq[0].textContent.toString());
            document.write("<br/>");
            document.write("<h5>Jobs Curently Avaliable In Louisiana: </h5>");
            document.write(jobsavail[0].textContent.toString());

            document.write("<br/>");
            document.write("<div id='supanddemand'><h5>supply and demand information for this job for this Job: </h5>");
            document.write(ntnlsupplydemand[0].textContent.toString());
            document.write("</div>");
            document.write("<br/>");
            document.write("</li>");
        }
        document.write("</ol>");

        //function toggleSupplyDemand() {
        //    var supdem = document.getElementsById('supanddemand')
        //    var displaySetting = supdem.style.display;
        //    var supdemButton = document.getElementById('supdemButton');
        //    if (displaySetting == 'block') {
        //        supdem.style.display = 'none';
        //        supdemButton.innerHTML = 'Show supply and demand';
        //    }
        //    else {
        //        supdem.style.display = 'block';
        //        supdemButton.innerHTML = 'Hide supply and demand';
        //    }
        //}
</script>
</asp:Content>
