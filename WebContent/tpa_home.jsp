<%@ page  import="java.sql.*" import="databaseconnection.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

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
<div id="templatemo_top"> <a href="index.jsp" target="_parent">Home</a> � <a href="#">Company</a> � <a href="#">Contact</a></div>
  <div id="templatemo_header">
      <div id="inner_header"><br><br>
        <div>
		<br> <font color=#ffffff size=+3>Privacy-Preserving Public Auditing for 
		<br><br>Secure Cloud Storage</font></div>
         
      </div>
  </div>
  
      <div id="templatemo_left_column">
 		<div class="text_area" align="justify">

<%
String name=(String)session.getAttribute("tname");
%>

<table>
   
   <table border=9 colspan=8> <tr><td><a href="#"  ><h2>Tpa Home</a><td>
    <a href="tpa_all_files.jsp" ><h2>All Files</a><td>
      <a href="tpa_alert.jsp" ><h2>File Alert</a><td>
     <a href="tpa_all_alerts.jsp" ><h2>All File Alert</a><td>
      <a href="index.jsp"><h2>Logout</a></li>
	  </tr>
</table>
<table><br><br><br>
      <br/>
    </p>
    <!-- Primary content: Stuff that goes in the primary content column (by default, the left column) -->
    <div id="primarycontainer"> 
      <!-- Primary content area start -->
      <div class="box"> <em><font color="#FF0000" size="+1" face="Courier New, Courier, mono"><strong>New 
        Files</strong></font></em> <br>
        <br>
        <form>
          <table bgcolor="#FFFFFF" cellpadding="5" cellspacing="5" width="725" border="0">
            <tr  bgcolor="#33CCFF"> 
            <tr bgcolor="#E4E4F1"> 
              <td align="center"><font color="#110022"><strong>User ID</strong></font></td>
              <td align="center"> <font color="#110022"><strong>Name</strong></font></td>
              <td align="center"><font color="#110022"><strong>Date</strong></font></td>
              <td align="center"><font color="#110022"><strong>File ID</strong></font></td>
              <td align="center"> <font color="#110022"><strong>File Name</strong></font></td>
              <td align="center"> <font color="#110022"><strong>File Size</strong></font></td>
              <td align="center"><font color="#110022"><strong>Status</strong></font></td>
              <td align="center"> <font color="#110022"><strong>View</strong></font></td>
            </tr>
		
            <%
String uid=null,uname=null,date=null,fid=null,fname=null,fsize=null,sta=null;
ResultSet rs=null;
try
{
	Connection con = databasecon.getconnection();
	Statement st = con.createStatement();	
	String a="not_verified";
    String qry="select * from tpafile where status = '"+a+"'";
		rs =st.executeQuery(qry);
	while(rs.next())
	{
	fid=rs.getString("fileid");
	uid=rs.getString("uid");
	
	uname=rs.getString("name");
	fname=rs.getString("fname");
	fsize=rs.getString("fsize");
		date=rs.getString("date");
	sta=rs.getString("status");
	 
%>

            <tr bgcolor="#FFFFCC"> 
              <td align="center"> <strong><font color="#6300C6"> <%=uid%> </font></strong></td>
              <td align="center"><strong><font color="#6300C6"> <%=uname%> </font></strong></td>
              <td align="center"><strong><font color="#6300C6"> <%=date%> </font></strong></td>
              <td align="center"><strong><font color="#FF3300"> <%=fid%> </font></strong></td>
              <td align="center"><strong><font color="#6300C6"> <%=fname%> </font></strong> 
              </td>
              <td align="center"> <strong><font color="#6300C6"> <%=fsize%>&nbsp;&nbsp;<font color="#333333">KB</font> 
                </font></strong> </td>
              <td align="center"><strong><font color="#6300C6"> <%=sta%> </font></strong> 
              </td>
              <td align="center"><a href="tpa_key.jsp?<%=fid%>" class="big">View</a></td>
            </tr>	

            <%
	   }

	   }
	   catch(Exception e1)
	   {
	     out.println(e1.getMessage());
	   }
 %>
        
        </form>
		</table>

		<br><br><br><br><br><br>
 </div>
	
    </div>

	<div id="templatemo_footer">
    Copyright � 2013-2014 All Rights Reserved
    </div>
        
</div>
<div class="templatemo_spacer"></div>
</div>
<div align=center><a href='http://pgembeddedsystems.com/securelogin/upload/project/IEEE/31/PG2013JOO18/Privacy-Preserving%20Public%20Auditing.pdf'>Privacy Preserving Public Auditing for Secure Cloud Storage</a></div></body>
</html>