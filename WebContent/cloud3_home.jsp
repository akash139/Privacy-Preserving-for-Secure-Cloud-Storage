<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,databaseconnection1.*,databaseconnection2.*,databaseconnection3.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*" %>

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
    <table border=3>
     <tr><td> <a href="#" class="active" ><h2>Cloud server3 Home</a>
      <td><a href="cloud3_all_files.jsp" ><h2>All Files</a>
      <td><a href="index.jsp"><h2>Logout</a>
</tr>   
</table>
<table>
<%
String name=(String)session.getAttribute("sname");
%>

    <!-- Normal content: Stuff that's not going to be put in the left or right column. -->
 <h2><%=name%>
    <!-- Primary content: Stuff that goes in the primary content column (by default, the left column) -->
	<br><br>
    <em><font color="#FF0000" size="+1" face="Courier New, Courier, mono"><strong>New 
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
              <td align="center"> <font color="#110022"><strong>Status</strong></font></td>
            </tr>
            <%
String uid=null,uname=null,date=null,fid=null,fname=null,fsize=null,sta=null;
ResultSet rs=null;
String a="allow";
try
{
	Connection con = databasecon3.getconnection();
	Statement st = con.createStatement();	

    String qry="select * from filestore where status='"+a+"'";
		rs =st.executeQuery(qry);
	while(rs.next())
	{
	fid=rs.getString("fid");
	uid=rs.getString("uid");
	
	uname=rs.getString("name");
	fname=rs.getString("fname");
	fsize=rs.getString("fsize");
	date=rs.getString("date");
	
	
	 
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
              <td align="center"><a href="cloud3_allow.jsp?<%=fid%>"><strong><font color="#6300C6">allow</font></strong></a></td>
            </tr>
            <%
	   }
	   }
	   catch(Exception e1)
	   {
	     out.println(e1.getMessage());
	   }
 %>
          </table>
        </form>
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