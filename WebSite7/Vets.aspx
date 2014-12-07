<%@ Page Title="Veterans" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Vets.aspx.cs" Inherits="Vets" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
       <style  type="text/css">
        .supdem {
            display: none;
        }
        .place {
            display: none;
        }
        .buttons{
           position:fixed;
           bottom:200px;
           height:100px;
           width: 150px;
           text-align: center;
           padding-left: 40px;
        }
    </style>
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>Veterans</h1>        
            </hgroup>
            <p>
               This page is for veterans that are interested in learning about the IT field, what jobs are offered, what the education requirements are for that position, what areas in Louisiana currently have job openings, and the supply and demand for that position.
            </p>
        </div>
    </section>
</asp:Content>

<asp:Content runat="server" ID="buttons" ContentPlaceHolderID="buttons">
    <div class="buttons" > <button type="button"  onclick="toggleSupplyDemand()" id="supdemButton">Show Supply and Demand</button> <br/><br/>
    <button type="button" style="text-align: center;" onclick="togglePlace()" id="placeButton">Show Areas With Job Openings</button></div>
    <br />
 </asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

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
            document.write("<h3>Summary:</h3>");
            document.write(summary[0].textContent.toString());
            document.write("<br/>");
            document.write("<h3>Education Requirements: </h3>");
            document.write(edureq[0].textContent.toString());
            document.write("<br/>");
            document.write("<h3>Number of Job Openings in Louisiana: " + "<span style='font-weight:normal; font-size:.9em'>" + jobsavail[0].textContent.toString() + "</span>" + "</h3>");
            document.write("<div class='place'>");
            document.write("<h3>Areas With Job Openings In Louisiana: </h3>");

            var placename = place[0].getElementsByTagName('placename');
            var placenum = place[0].getElementsByTagName('placenum');
            document.write("<div style=' text-decoration:underline'>" + placename[0].textContent.toString() + "</div>");
            document.write("Number of Job Openings: ");
            document.write(placenum[0].textContent.toString());
            document.write("<br/>");

            document.write("</div>");
            document.write("<div class='supdem'><h3>Supply and Demand: </h3>");
            document.write(ntnlsupplydemand[0].textContent.toString());
            document.write("</div>");
            document.write("<br/>" + "<br/>" + "<br/>" + "</li>");
        }
        document.write("</ol>");

        function toggleSupplyDemand() {
            var cssRuleCode = document.all ? 'rules' : 'cssRules';
            var supdem = document.styleSheets[1][cssRuleCode][0];
            var displaySetting = supdem.style.display;
            var supdemButton = document.getElementById('supdemButton');
            if (displaySetting == 'block') {
                supdem.style.display = 'none';
                supdemButton.innerHTML = 'Show Supply and Demand';
            }
            else {
                supdem.style.display = 'block';
                supdemButton.innerHTML = 'Hide Supply and Demand';
            }
        }

        function togglePlace() {
            var cssRuleCode = document.all ? 'rules' : 'cssRules';
            var place = document.styleSheets[1][cssRuleCode][1];
            var displaySetting = place.style.display;
            var placeButton = document.getElementById('placeButton');
            if (displaySetting == 'block') {
                place.style.display = 'none';
                placeButton.innerHTML = 'Show Areas With Job Openings';
            }
            else {
                place.style.display = 'block';
                placeButton.innerHTML = 'Hide Areas With Job Openings';
            }
        }

</script>
</asp:Content>
