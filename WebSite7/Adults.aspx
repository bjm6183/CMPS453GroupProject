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

    <div style="text-align: center;" > <button style="text-align: center;" onclick="toggleSupplyDemand()" id="supdemButton">Hide supply and demand information</button>
    <button style="text-align: center;" onclick="togglePlace()" id="placeButton">Hide Citys where jobs are avalable</button></div>
    <br />

    <h1>Jobs:</h1>

    <script type="text/JavaScript">
        function toggleSupplyDemand() {
            var supdem = document.getElementsById('supanddemand')
            var displaySetting = supdem.style.display;
            var supdemButton = document.getElementById('supdemButton');
            if (displaySetting == 'block') {
                supdem.style.display = 'none';
                supdemButton.innerHTML = 'Show supply and demand';
            }
            else {
                supdem.style.display = 'block';
                supdemButton.innerHTML = 'Hide supply and demand';
            }
        }

        function togglePlace() {
            var place = document.getElementsById('place')
            var displaySetting = place.style.display;
            var placeButton = document.getElementById('placeButton');
            if (displaySetting == 'block') {
                place.style.display = 'none';
                placeButton.innerHTML = 'Show Citys where jobs are avalable';
            }
            else {
                place.style.display = 'block';
                placeButton.innerHTML = 'Hide Citys where jobs are avalable';
            }
        }
        var Connect = new XMLHttpRequest();
        Connect.open("GET", "scrapeddata.xml", false);
        Connect.send(null);
        var TheDocument = Connect.responseXML;
        var Root = TheDocument.childNodes[0];

        document.write(" <ol class='round'>")
        for (var i = 0; i < Root.children.length; i++) {

            
            var Job = Root.children[i];
            
            var Name = Job.getElementsByTagName("name");
            var summary = Job.getElementsByTagName("summary");
            var jobsavail = Job.getElementsByTagName("jobs_avail");
            var ntnlsupplydemand = Job.getElementsByTagName("ntnl_supply_demand");
            var edureq = Job.getElementsByTagName("edu_req");
            var place = Job.getElementsByTagName("place");
            

            
            
            document.write("<li class='zero'>");
            document.write("<h2>" + Name[0].textContent.toString() + "</h2>");
            document.write("<h4>Summary of job:</h4>");
            document.write(summary[0].textContent.toString());
            document.write("<br/>");
            document.write("<h4>Education requiered for this job: </h4>");
            document.write(edureq[0].textContent.toString());
            document.write("<br/>");
            document.write("<h4>Total jobs curently avaliable in louisiana: </h4>");
            document.write(jobsavail[0].textContent.toString());
            document.write("<h4>Citys where jobs are curently avaliable in louisiana: </h4>");
            document.write("<span id='place'>");

            //for (var i = 0; i < 1; i++) {
            var placename = place[0].getElementsByTagName('placename');
            var placenum = place[0].getElementsByTagName('placenum');
            document.write("<div style=' text-decoration:underline'>" + placename[0].textContent.toString() +"</div>");
            document.write("Number of jobs are curently avaliable In this city: ");
            document.write(placenum[0].textContent.toString());
            document.write("<br/>");
            //}

            document.write("</span>");
            document.write("<span id='supanddemand'><h4>Supply and demand information for this job: </h4>");
            document.write(ntnlsupplydemand[0].textContent.toString());
            document.write("</span>");
            document.write("<br/>");
            document.write("</li>");
        }
        document.write("</ol>");

        
</script>
</asp:Content>
