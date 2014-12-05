<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>



<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <style type="text/css">
    a:link{
        text-decoration: none;
    }
    a:hover{
        
        color:#fff;
        text-decoration: none;
    }
        .image:hover
        {
        position:absolute;
        left: 1;
        background-repeat: no-repeat;
        background-size:cover;
        background: url("/Images/linkselet.png");
        }
    </style>
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h2>Welcome to the Louisiana Workforce Commissions IT Job Information Website.</h2>           
            </hgroup>
            <p>
                This site displays information about IT Jobs from the Louisiana Workforce Commissions website in an easy to read format for all ages.
                <br/><br />
                IT stands for Information Technology and is the application of computers and telecommunications equipment to store, retrieve, transmit and manipulate data, often in the context of a business or other enterprise. The term is commonly used as a synonym for computers and computer networks, but it also encompasses other information distribution technologies such as television and telephones. Several industries are associated with information technology, including computer hardware, software, electronics, semiconductors, internet, telecom equipment, e-commerce and computer services.
            </p>
        </div>
    </section>
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2>Age Catagories:</h2>
    <ol class="round">
        <li class="zero">
            <h3><a class="image" runat="server" href="~/Children.aspx">Children (Ages 6-12)</a></h3>
            info on this
        </li>
        <li class="zero">
            <h3><a class="image" runat="server" href="~/Teen.aspx">Teens (Ages 13-17)</a></h3>
            info on this
        </li>
        <li class="zero">
            <h3><a class="image" runat="server" href="~/Adults.aspx">Adults (Ages 18 & Up)</a></h3>
            info on this
        </li>
        <li class="zero">
            <h3><a class="image" runat="server" href="~/Vets.aspx">Veterans</a></h3>
            info on this
        </li>
    </ol>
</asp:Content>