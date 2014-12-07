/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package scraper;

//import java.io.File;
import java.io.*;
//import java.io.IOException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.xml.parsers.*;
import javax.xml.transform.*;
import org.jsoup.Connection;
import org.jsoup.Connection.Response;
import org.jsoup.Jsoup;
import org.jsoup.nodes.DataNode;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.w3c.dom.Attr;



/**
 *
 * @author ajt6275
 */
public class Scraper {

    /**
     * @param args the command line arguments
     */
    
    //Scraper scraper;
    
    public Document document;
    public  static BufferedWriter output;
    
    public Scraper() {
        
        
        
    }

    public static void main(String[] args) {
        try {
            
            
            File file = new File("scrapeddata.xml");
            output = new BufferedWriter(new FileWriter(file));
            
            output.write("<root>\n");
            System.out.println("wrote: " + "<root>\n");
            
            
            //Home page
            Response res = Jsoup.connect("https://www.louisianaworks.net/hire/vosnet/Default.aspx?plang=E").method(Connection.Method.GET).execute();
            
            
            //Redirect to occupation information page
            res = Jsoup.connect("https://www.louisianaworks.net/hire/altentry.asp?action=indguest&whereto=OCCPROFILE").method(Connection.Method.GET).cookies(res.cookies()).execute();
            

            /*
                0.) Computer Network Architects
                1.) Computer Network Support Specialists
                2.) Computer Programmers
                3.) Computer Systems Analysts
                4.) Computer Systems Engineers/Architects
                5.) Database Administrators
                6.) Database Architects
                7.) Information Security Analysts
                8.) Information Technology Project Managers
                9.) Network and Computer Systems Administrators
                10.) Software Developers, Applications
                11.) Software Developers, Systems Software
                12.) Software Quality Assurance Engineers and Testers
                13.) Telecommunications Engineering Specialists
                14.) Video Game Designers
                15.) Web Administrators
                16.) Web Developers
            */
            
            ArrayList<String> job_urls = new ArrayList<String>();
            
            //Computer Network Architects
            job_urls.add("https://www.louisianaworks.net/hire/vosnet/lmi/occ/occsummary.aspx?enc=e7AKr7bjUGRBEdrMte14UcX+X8cAPsRfrySjgxXSfwWGFQ+nUO8qOBYI9edgKa+ulAlnTAoB9a938Xif82KYTSeTlkB2MpjzcQlQ1efCP0R5VqxK6cLQpHLN+8HgQWYP");
            
            //Computer Network Support Specialists
            job_urls.add("https://www.louisianaworks.net/hire/vosnet/lmi/occ/occsummary.aspx?enc=e7AKr7bjUGRBEdrMte14UcX+X8cAPsRfrySjgxXSfwWGFQ+nUO8qOBYI9edgKa+ulAlnTAoB9a938Xif82KYTaPR5mgk2DTCC0sZvMRhbCfx9n6TmJN6tEjUBm7cNm658gPgTB2EXmiLs0AXptvbqw==");
            
            //Computer Programmers
            job_urls.add("https://www.louisianaworks.net/hire/vosnet/lmi/occ/occsummary.aspx?enc=e7AKr7bjUGRBEdrMte14UcX+X8cAPsRfrySjgxXSfwWGFQ+nUO8qOBYI9edgKa+ulAlnTAoB9a938Xif82KYTYEBfHFh4e/ACL3QFns5iY3KF7sQKhHJ/NN4fxmvHvkehRdXTA8DjxzYUuX0Ptccxw==");
            
            //Computer Systems Analysts
            job_urls.add("https://www.louisianaworks.net/hire/vosnet/lmi/occ/occsummary.aspx?enc=e7AKr7bjUGRBEdrMte14UcX+X8cAPsRfrySjgxXSfwWGFQ+nUO8qOBYI9edgKa+ulAlnTAoB9a938Xif82KYTf5oB8GiiqIZx9F7fP3vTjFgAj6f2ETveZTWGfGJSASqK/Iu7YFrrE2+sqPbRDfzeQ==");
            
            //Computer Systems Engineers/Architects
            job_urls.add("https://www.louisianaworks.net/hire/vosnet/lmi/occ/occsummary.aspx?enc=e7AKr7bjUGRBEdrMte14UcX+X8cAPsRfrySjgxXSfwWGFQ+nUO8qOBYI9edgKa+ulAlnTAoB9a938Xif82KYTdZewTjGhtiYMEqnH3qGg9Hu1wzsC1Chb0ncjx57ADqiYPHU+Q8hlIHAznRhf0LjgA==");
            
            //Database Administrators
            job_urls.add("https://www.louisianaworks.net/hire/vosnet/lmi/occ/occsummary.aspx?enc=e7AKr7bjUGRBEdrMte14UcX+X8cAPsRfrySjgxXSfwWGFQ+nUO8qOBYI9edgKa+ulAlnTAoB9a938Xif82KYTVvwwAuY/y8VMtsWvUvvtN8E33ohZQ7sqG2GHvemRjn6T/t2/kZSSAfw+NioWPNNvQ==");
            
            //Database Architects
            job_urls.add("https://www.louisianaworks.net/hire/vosnet/lmi/occ/occsummary.aspx?enc=e7AKr7bjUGRBEdrMte14UcX+X8cAPsRfrySjgxXSfwWGFQ+nUO8qOBYI9edgKa+ulAlnTAoB9a938Xif82KYTdZewTjGhtiYMEqnH3qGg9GpQUPsZJPF4K1WqkTqgwAscNXEM4YTdZKYIO5lQz6+aw==");
            
            //Information Security Analysts
            job_urls.add("https://www.louisianaworks.net/hire/vosnet/lmi/occ/occsummary.aspx?enc=e7AKr7bjUGRBEdrMte14UcX+X8cAPsRfrySjgxXSfwWGFQ+nUO8qOBYI9edgKa+ulAlnTAoB9a938Xif82KYTU9zr8siR4Dlkcc3GACNZz3PLN+pccccccFe1n2Is0Q+sfTOmf8c4XKllbSvUprbsA==");
            
            //Information Technology Project Managers
            job_urls.add("https://www.louisianaworks.net/hire/vosnet/lmi/occ/occsummary.aspx?enc=e7AKr7bjUGRBEdrMte14UcX+X8cAPsRfrySjgxXSfwWGFQ+nUO8qOBYI9edgKa+ulAlnTAoB9a938Xif82KYTdZewTjGhtiYMEqnH3qGg9HNNNcLW9/uFPJCL1OH7XB8UZFe4ufJYBeChCVXiD4p+w==");
            
            //Network and Computer Systems Administrators
            job_urls.add("https://www.louisianaworks.net/hire/vosnet/lmi/occ/occsummary.aspx?enc=e7AKr7bjUGRBEdrMte14UcX+X8cAPsRfrySjgxXSfwWGFQ+nUO8qOBYI9edgKa+ulAlnTAoB9a938Xif82KYTavdngDda6VtQIdTlT4eSWsjoxQubEOj1CkEp1NuKkEHGW1+or4XvIxUwN6rPmqhIQ==");
            
            //Software Developers, Applications
            job_urls.add("https://www.louisianaworks.net/hire/vosnet/lmi/occ/occsummary.aspx?enc=e7AKr7bjUGRBEdrMte14UcX+X8cAPsRfrySjgxXSfwWGFQ+nUO8qOBYI9edgKa+ulAlnTAoB9a938Xif82KYTS4ktXda+aIRG46dxqcnurC5w0lSygLiXUxw7Cn4o+LQgP1iA65h069goxMdIeyM3Q==");
            
            //Software Developers, Systems Software
            job_urls.add("https://www.louisianaworks.net/hire/vosnet/lmi/occ/occsummary.aspx?enc=e7AKr7bjUGRBEdrMte14UcX+X8cAPsRfrySjgxXSfwWGFQ+nUO8qOBYI9edgKa+ulAlnTAoB9a938Xif82KYTelEYg85RERVRU/lYeFazJCzmod5PHHUqOuuirGnv4tgWpqy7Zk9YnEe2UBzP8N6/w==");
            
            //Software Quality Assurance Engineers and Testers
            job_urls.add("https://www.louisianaworks.net/hire/vosnet/lmi/occ/occsummary.aspx?enc=e7AKr7bjUGRBEdrMte14UcX+X8cAPsRfrySjgxXSfwWGFQ+nUO8qOBYI9edgKa+ulAlnTAoB9a938Xif82KYTdZewTjGhtiYMEqnH3qGg9FUpomxyqNBrJwSQ5D+AAYHHZ+wejBsLvre7KJOTs3BmQ==");
            
            //Telecommunications Engineering Specialists
            job_urls.add("https://www.louisianaworks.net/hire/vosnet/lmi/occ/occsummary.aspx?enc=e7AKr7bjUGRBEdrMte14UcX+X8cAPsRfrySjgxXSfwWGFQ+nUO8qOBYI9edgKa+ulAlnTAoB9a938Xif82KYTSeTlkB2MpjzcQlQ1efCP0SIgaQVsUsa1fNQ/jW7aZJKp5mo9p4LszxJIPDnglhxJw==");
            
            //Video Game Designers
            job_urls.add("https://www.louisianaworks.net/hire/vosnet/lmi/occ/occsummary.aspx?enc=e7AKr7bjUGRBEdrMte14UcX+X8cAPsRfrySjgxXSfwWGFQ+nUO8qOBYI9edgKa+ulAlnTAoB9a938Xif82KYTdZewTjGhtiYMEqnH3qGg9GcBvmhRCyjOROO6U2JQLbqnWT9ilC/6JRh+A9WNvnwkg==");
            
            //Web Administrators
            job_urls.add("https://www.louisianaworks.net/hire/vosnet/lmi/occ/occsummary.aspx?enc=e7AKr7bjUGRBEdrMte14UcX+X8cAPsRfrySjgxXSfwWGFQ+nUO8qOBYI9edgKa+ulAlnTAoB9a938Xif82KYTdZewTjGhtiYMEqnH3qGg9FmykkBMpu/CE8jubpRdkdHZc/+e1u2+DDAozzjX3Q/Tw==");
            
            //Web Developers
            job_urls.add("https://www.louisianaworks.net/hire/vosnet/lmi/occ/occsummary.aspx?enc=e7AKr7bjUGRBEdrMte14UcX+X8cAPsRfrySjgxXSfwWGFQ+nUO8qOBYI9edgKa+ulAlnTAoB9a938Xif82KYTWgXHWGRyviy8sRu/yVrWSVAve+kuawf1Q0qKe8bUGOWoEPcqYscsktC/2i37p9tCA==");
            
            
            Scraper scraper = new Scraper();
            
            for(int x = 0; x<job_urls.size(); x++) {
                try
                {
                Document doc = Jsoup.connect(job_urls.get(x)).timeout(1000000000).cookies(res.cookies()).get();
                
                scraper.scrapeData(doc);
                }
                catch (Exception e)
                {
                    System.out.println("HEY! THIS ONE DIDN'T LOAD! x=" + x + " url= " + job_urls.get(x));
                }
                System.out.println("\n");
                
            }
            
            output.write("</root>");
            
            
            try {output.close();} catch (Exception ex) {}
            
//            Document doc = Jsoup.connect(job_urls.get(14)).timeout(1000000000).cookies(res.cookies()).get();
//            
//            scraper.scrapeData(doc);
            
            
            
        } catch (IOException ex) {
            Logger.getLogger(Scraper.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void scrapeData(Document doc) {
        
        Element body = doc.body();
        
  //      try{
 //       output.write("<job>\n");
  //      }catch(IOException e){
  //          Logger.getLogger(Scraper.class.getName()).log(Level.SEVERE, null, e);
   //     }
        
        
        /************************************************* Job Summary ********************************************************/

        Element body_sub_section = body.getElementById("ctl00_Main_content_pnlSummarySections");


        Element network_architect_job_summ = body_sub_section.getElementById("ctl00_Main_content_ucOccSumaryOfJobDuties_pnSectionContainer");

        Elements divs = network_architect_job_summ.getElementsByTag("div");

        String jobsumstr = divs.get(1).ownText();
        
    String[] parts = jobsumstr.split("-");
    String jobname = parts[0]; 
    
        try{
        output.write("<job>\n");    
        output.write("<name>" + jobname + "</name>\n");
        output.write("<summary>"+jobsumstr+"</summary>\n");
        }catch(IOException e){
            Logger.getLogger(Scraper.class.getName()).log(Level.SEVERE, null, e);
        }
        
        
        System.out.println(jobname);
        //System.out.println(divs.get(1).ownText());


        /************************************************* End Job Summary ********************************************************/

        /************************************************* Jobs Data ********************************************************/

        network_architect_job_summ = body_sub_section.getElementById("ctl00_Main_content_pnlJobsData");

        
        
        divs = network_architect_job_summ.getElementsByAttributeValue("title","Display Jobs");
        
        Element check_jd = divs.parents().get(0).parents().get(0).child(0);
        
        String jobsdata;

        if(!check_jd.text().equals("Computer and Mathematical Occupations")) 
            jobsdata = divs.get(0).text();
        else
            jobsdata = "No Job Openings Data Available.";

        try{
        output.write("<jobs_avail>"+jobsdata+"</jobs_avail>\n");
        }catch(IOException e){
            Logger.getLogger(Scraper.class.getName()).log(Level.SEVERE, null, e);
        }
        
        //System.out.println(jobsdata);

        /************************************************* End Jobs Data ********************************************************/

        /************************************************ Jobs Area Distribution ********************************************/

        network_architect_job_summ = body_sub_section.getElementById("tblJobsAreaDistributionDisplay");

        Element check_jad = network_architect_job_summ.child(0).child(0).child(3);
        
        
        network_architect_job_summ = network_architect_job_summ.children().get(1);

       
        try{
        output.write("<job_area_dist>\n");
        }catch(IOException e){
            Logger.getLogger(Scraper.class.getName()).log(Level.SEVERE, null, e);
        }
        
        
        if(!check_jad.text().equals("Job Openings for Computer and Mathematical Occupations")) {
            for(int i = 0; i<network_architect_job_summ.children().size(); i++)
            {
                
                String placename = network_architect_job_summ.children().get(i).child(1).child(0).text();
                String placenum = network_architect_job_summ.children().get(i).child(3).child(0).text();
                //System.out.println();
                
                
                try{
                output.write("<place>\n<placename>"+placename+"</placename>\n<placenum>"+placenum+"</placenum>\n</place>\n");
                }catch(IOException e){
                Logger.getLogger(Scraper.class.getName()).log(Level.SEVERE, null, e);
                }
                
            }
        }
        else
        {
            try{
                output.write("<place>\n<placename>"+"No Jobs area Distribution Data Available."+"</placename>\n<placenum>"+"No Jobs area Distribution Data Available."+"</placenum>\n</place>\n");
                }catch(IOException e){
                Logger.getLogger(Scraper.class.getName()).log(Level.SEVERE, null, e);
                }
            
            
            System.out.println("No Jobs area Distribution Data Available.");
        }
        
        try{
        output.write("</job_area_dist>\n");
        }catch(IOException e){
            Logger.getLogger(Scraper.class.getName()).log(Level.SEVERE, null, e);
        }
        /************************************************ End Jobs Area Distribution ********************************************/

        /************************************************ National Supply and Demand ********************************************/

        //network_architect_job_summ = body_sub_section.getElementById("sp0ccCandAvail");

        network_architect_job_summ = body_sub_section.getElementById("ctl00_Main_content_ucOccNatSupplyDemand_pnSectionContainer");



        String ntnlsuppdmnd = network_architect_job_summ.child(0).child(2).text();
        
        try{
        output.write("<ntnl_supply_demand>"+ntnlsuppdmnd+"</ntnl_supply_demand>\n");
        }catch(IOException e){
            Logger.getLogger(Scraper.class.getName()).log(Level.SEVERE, null, e);
        }

        /************************************************ End National Supply and Demand ********************************************/

        /************************************************ Education Requirements ********************************************/

        network_architect_job_summ = body_sub_section.getElementById("ctl00_Main_content_ucOccTypicalEduReq_pnSectionContainer");

        String edureq = network_architect_job_summ.child(0).child(2).text();
        
        
        try{
        output.write("<edu_req>"+edureq+"</edu_req>\n");
        }catch(IOException e){
            Logger.getLogger(Scraper.class.getName()).log(Level.SEVERE, null, e);
        }

        /************************************************ End Education Requirements ********************************************/

        /************************************************ Work Experience ********************************************/

        network_architect_job_summ = body_sub_section.getElementById("ctl00_Main_content_ucOccTypicalWorkExperience_pnSectionContainer");


        String workexp = network_architect_job_summ.child(0).child(2).text();
        
        try{
        output.write("<work_exp>"+workexp+"</work_exp>\n");
        }catch(IOException e){
            Logger.getLogger(Scraper.class.getName()).log(Level.SEVERE, null, e);
        }

        /************************************************ End Work Experience ********************************************/
        
        try{
        output.write("</job>\n");
        }catch(IOException e){
            Logger.getLogger(Scraper.class.getName()).log(Level.SEVERE, null, e);
        }
        
    }

}
