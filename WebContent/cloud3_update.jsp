<%@ page import="java.util.Date.*,java.text.DateFormat.*,java.text.ParseException.*"%>
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*" %>
<%@ page import = "java.util.Date,java.text.SimpleDateFormat,java.text.ParseException"%>	 
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,databaseconnection1.*,databaseconnection2.*,databaseconnection3.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*" %>

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

<%
String fid=request.getQueryString();
session.setAttribute("fid",fid);
String name=(String)session.getAttribute("sname");
//System.out.println(fid);
	Blob file1= null;
	String data1=null,uid=null,uname=null,fs=null,fn=null;
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
		String sql=null;
	 sql = "select uid,name,fid,fname,fsize,b3,date,status from filestore where fid ='"+fid+"'";
	
	try
	{
		con=databasecon3.getconnection();
		ps = con.prepareStatement(sql);
		rs = ps.executeQuery();
		while(rs.next())
		{
		uid=rs.getString(2);
		uname=rs.getString(3);
		fn=rs.getString(4);
		fs=rs.getString(5);
		file1 = rs.getBlob(6);
		
		}
		byte[] bdata = file1.getBytes(1, (int)file1.length());
        data1 = new String(bdata);
        session.setAttribute("fn",fn);
        session.setAttribute("fs",fs);
		session.setAttribute("uid",uid);
		session.setAttribute("uname",uname);
		
	
	}
		catch(Exception e)
	{
	out.println("Exception :"+e);
	}
	finally
	{
		if(con != null)
			con.close();
		if(ps != null)
			ps.close();
		if(rs != null)
			rs.close();
	}
	//session.setAttribute("resumeBlob",file);
    //response.sendRedirect("view_proof.jsp");
	
	%>
<table>
  <table border=3>
     <tr><td> <a href="cloud1_home.jsp" class="active" ><h3>Cloud server1 Home</a>
      <td><a href="cloud1_all_files.jsp" ><h3>All Files</a>
      <td><a href="index.jsp"><h3>Logout</a>
</tr>   
</table>

   </div>
  <div id="menubottom"></div>
  <div id="content">

    <!-- Normal content: Stuff that's not going to be put in the left or right column. -->
    <p><img src="images/upload.png" width="40" height="40">&nbsp;&nbsp; <strong><em><font color="#990000" size="+1" face="Verdana, Arial, Helvetica, sans-serif" style="text-decoration:underline">File 
      Verification</font></em></strong> <br/>
      <br/>
    </p>
    <!-- Primary content: Stuff that goes in the primary content column (by default, the left column) -->

        <form name="a" action="cloud3_update3.jsp" method="post">
      <table align=center>
            <tr> 
              <td ><font  size="+1"><strong>File Name</td><td><font color=red><%=fn%>
			  <tr>
                <td><font  size="+1"><strong>File Size <td><font color=red><%=fs%>&nbsp;&nbsp;KB</font>
            </tr>
            <tr> 
              <td><font size="+1"><strong>File Block 2</strong><td><textarea name="b1" cols="45" rows="5" class="b"><%=data1%></textarea></td>
            </tr>
            <tr> 
              <td></td>
              <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" name="s" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ok&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" class="b1"></td>
            </tr>
          </table>
        </form>
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


