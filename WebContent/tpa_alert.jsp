<%@ page  import="java.sql.*" import="databaseconnection.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--

	zenlike1.0 by nodethirtythree design
	http://www.nodethirtythree.com

-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Secure Cloud</title>
<meta name="keywords" content="free website templates, CSS templates, download HTML page, templatemo.com" />
<meta name="description" content="templatemo 004 - free CSS website template" />
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
</head>



<body>

<div id="templatemo_container_wrapper">
	<div class="templatemo_spacer"></div>
<div id="templatemo_container">
<div id="templatemo_top"> <a href="index.jsp" target="_parent">Home</a> · <a href="#">Company</a> · <a href="#">Contact</a></div>
  <div id="templatemo_header">
      <div id="inner_header"><br><br>
        <div>
		<br> <font color=#ffffff size=+3>Privacy-Preserving Public Auditing for 
		<br><br>Secure Cloud Storage</font></div>
         
      </div>
  </div>
  
      <div id="templatemo_left_column">
 		<div class="text_area" align="justify">
<table>

   
   <table border=9 colspan=8> <tr><td><a href="tpa_home.jsp"  ><h2>Tpa Home</a><td>
    <a href="tpa_all_files.jsp" ><h2>All Files</a><td>
      <a href="tpa_alert.jsp" ><h2>File Alert</a><td>
     <a href="tpa_all_alerts.jsp" ><h2>All File Alert</a><td>
      <a href="index.jsp"><h2>Logout</a></li>
	  </tr>
</table>
<table><br><br><br> 
    <!-- Normal content: Stuff that's not going to be put in the left or right column. -->
    <p> <img src="images/alert1.png" width="25" height="30">&nbsp;&nbsp;&nbsp;&nbsp;<strong><em><font color="#990000" size="+1" face="Verdana, Arial, Helvetica, sans-serif" style="text-decoration:underline">File 
      Alert</font></em></strong> <br/>
      <br/>
    </p>
    <!-- Primary content: Stuff that goes in the primary content column (by default, the left column) -->
    <div id="primarycontainer"> 
     
        <!-- Primary content area start -->
        
    <div class="box"> 
      <form>
        <%
String aid=null,uid=null,uname=null,mby=null,mb=null,fid=null,fname=null,fsize=null,sta=null;

try
{
	Connection con = databasecon.getconnection();
	Statement st = con.createStatement();	
	String a="new";
    String qry="select * from tpa_alert where status = '"+a+"'";
	ResultSet rs =st.executeQuery(qry);
	while(rs.next())
	{
	aid=rs.getString("aid");
	fid=rs.getString("fid");
	uid=rs.getString("uid");
	
	uname=rs.getString("name");
	fname=rs.getString("fname");
	fsize=rs.getString("fsize");
     mb=rs.getString("mblock");
	mby=rs.getString("mby");
	 

%>
        <tr> 
          <td><img src="images/alert1.png" width="25" height="25"></td>
          <td><font color="#333300" size="+1" face="Times New Roman, Times, serif"><strong>The&nbsp;</strong></font> 
            <font face="Courier New, Courier, mono" size="+1" color="#FF6633"><em><strong><%=mby%>&nbsp;</strong></em></font> 
            <font color="#333300" size="+1" face="Times New Roman, Times, serif"><strong>is&nbsp;trying&nbsp;to&nbsp;modify&nbsp;the</strong></font> 
            <font face="Courier New, Courier, mono" size="+1" color="#FF6633"><em><strong>&nbsp;<%=mb%>&nbsp;</strong></em></font> 
            <font color="#333300" size="+1" face="Times New Roman, Times, serif"><strong>of&nbsp;the&nbsp;</strong></font> 
            <font face="Courier New, Courier, mono" size="+1" color="#FF6633"><em><strong><%=fname%></strong></em></font></td>
          <td>&nbsp;&nbsp;<a href="tpa_alert1.jsp?<%=aid%>"><strong><font color="#990000" size="+2" face="Times New Roman, Times, serif">Ok</font></strong></a></td>
        </tr>
        <br>
        <br>
        <%
	   }
	   }
	   catch(Exception e1)
	   {
	     out.println(e1.getMessage());
	   }
 %></table>
        
      </form>
      <br>
      <br>
      <br>
      <br>
      <br>
        </div>
	
    </div>

	<div id="templatemo_footer">
    Copyright © 2013-2014 All Rights Reserved
    </div>
        
</div>
<div class="templatemo_spacer"></div>
</div>
<div align=center><a href='http://pgembeddedsystems.com/securelogin/upload/project/IEEE/31/PG2013JOO18/Privacy-Preserving%20Public%20Auditing.pdf'>Privacy Preserving Public Auditing for Secure Cloud Storage</a></div></body>
</html>