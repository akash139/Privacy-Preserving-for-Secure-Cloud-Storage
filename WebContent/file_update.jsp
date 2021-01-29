<%@ page  import="java.sql.*" import="databaseconnection.*,databaseconnection1.*,databaseconnection2.*,databaseconnection3.*"%>

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
<!--
This is a free CSS template provided by templatemo.com
-->
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

  <h3>
      <a href="#" class="active" >User Home</a> &para; <a href="file_upload.jsp" >File Upload</a> &para; <a href="file_update.jsp" >File Update</a> &para;
       <a href="index.jsp">Logout</a> 
    </h3><br><br>




<%
String name=(String)session.getAttribute("name");
%> </div>
  <div id="menubottom"></div>
  <div id="content"> 
 
<table>
<h2>File Update
		
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
              <td align="center"> <font color="#110022"><strong>File Update</strong></font></td>
            </tr>
            <%
			String u=(String)session.getAttribute("u");
			
			String uname=(String)session.getAttribute("name");
			String date=null,fid=null,fname=null,fsize=null,uid=null;
ResultSet rs=null;
String all="allowed";
try
{
	Connection con = databasecon1.getconnection();
	Statement st = con.createStatement();	

    String qry="select * from filestore where uid='"+u+"' && name='"+uname+"' && status='"+all+"'";
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
              <td align="center"><strong><font color="#6300C6"> <%=fname%> </font></strong></td>
              <td align="center"> <strong><font color="#6300C6"> <%=fsize%>&nbsp;&nbsp;</font><font color="#333333">KB</font></strong> 
              </td>
              <td align="center"><a href="file_update1.jsp?<%=fid%>"><strong><font color="#6300C6" class="big"> 
                Update</font></strong></a></td>
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
      </div>
      <table align="center">
        <tr> 
          <td colspan="4" align="center"><font size="2"><b> 
            <%
                                                       String message=request.getParameter("message");
                                                       if(message!=null && message.equalsIgnoreCase("success"))
                                                       {
                                                               out.println("<font color='red'><blink>File Updated Successfully !</blink></font>");
                                                       }
                                               %>
            </b></font></td>
        </tr>
      </table>

	<br><br><br><br><br><br><br>
    </div>

	<div id="templatemo_footer">
    Copyright © 2019-2020 All Rights Reserved
    </div>
        
</div>
<div class="templatemo_spacer"></div>
</div>

<div align=center><a href='http://pgembeddedsystems.com/securelogin/upload/project/IEEE/31/PG2013JOO18/Privacy-Preserving%20Public%20Auditing.pdf'>Privacy Preserving Public Auditing for Secure Cloud Storage</a></div></body>
</html>
