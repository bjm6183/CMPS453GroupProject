<%@ Page Title="Adults" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Adults.aspx.cs" Inherits="Adults" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <style  type="text/css">
        .supdem {
            display: none;
        }
        .place {
            display: none;
        }
    </style>
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

    <div style="text-align: center;" > <button type="button" style="text-align: center;" onclick="toggleSupplyDemand()" id="supdemButton">Show supply and demand information</button>
    <button type="button" style="text-align: center;" onclick="togglePlace()" id="placeButton">Show Cities where jobs are avalable</button></div>
    <br />

    <h1>Jobs:</h1>

    <script type="text/JavaScript">
       
        var Connect = new XMLHttpRequest();
        Connect.open("GET", "scrapeddata.xml", false);
        Connect.send(null);
        var TheDocument = Connect.responseXML;
        var Root = TheDocument.childNodes[0];
        
        document.write(" <ol class='round'>");
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
            document.write("<div class='place'>");
            document.write("<h4>Cities where jobs are curently avaliable in louisiana: </h4>");

            //for (var i = 0; i < 1; i++) {
            var placename = place[0].getElementsByTagName('placename');
            var placenum = place[0].getElementsByTagName('placenum');
            document.write("<div style=' text-decoration:underline'>" + placename[0].textContent.toString() +"</div>");
            document.write("Number of jobs are curently avaliable In this city: ");
            document.write(placenum[0].textContent.toString());
            document.write("<br/>");
            //}

            document.write("</div>");
            document.write("<div class='supdem'><h4>Supply and demand information for this job: </h4>");
            document.write(ntnlsupplydemand[0].textContent.toString());
            document.write("</div>");
            document.write("<br/>");
            document.write("</li>");
        }
        document.write("</ol>");
        function toggleSupplyDemand() {
            var cssRuleCode = document.all ? 'rules' : 'cssRules'; 
            var supdem = document.styleSheets[1][cssRuleCode][0];
            var displaySetting = supdem.style.display;
            var supdemButton = document.getElementById('supdemButton');
            if (displaySetting == 'block') {
                supdem.style.display = 'none';
                supdemButton.innerHTML = 'Show supply and demand information';
            }
            else {
                supdem.style.display = 'block';
                supdemButton.innerHTML = 'Hide supply and demand information';
            }
        }

        function togglePlace() {
            var cssRuleCode = document.all ? 'rules' : 'cssRules'; 
            var place = document.styleSheets[1][cssRuleCode][1];  
            var displaySetting = place.style.display;
            var placeButton = document.getElementById('placeButton');
            if (displaySetting == 'block') {
                place.style.display = 'none';
                placeButton.innerHTML = 'Show Cities where jobs are avalable';
            }
            else {
                place.style.display = 'block';
                placeButton.innerHTML = 'Hide Cities where jobs are avalable';
            }
        }
        
</script>
</asp:Content>
