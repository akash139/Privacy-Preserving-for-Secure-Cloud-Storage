<%@ page import="java.util.Date.*,java.text.DateFormat.*,java.text.ParseException.*"%>
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*" %>
<%@ page import = "java.util.Date,java.text.SimpleDateFormat,java.text.ParseException"%>	 


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


<%
String u=(String)session.getAttribute("u");
String name=(String)session.getAttribute("name");
String f=(String)session.getAttribute("f");
String kbs=(String)session.getAttribute("kbs");
String tfid=(String)session.getAttribute("tfid");
	
	//System.out.println(a);
	Blob file1= null,file2=null,file3=null;
	String data1=null,data2=null,data3=null;
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
		String sql=null;
	 sql = "select * from temp where fileid ='"+tfid+"'";
	
	try
	{
		con=databasecon.getconnection();
		ps = con.prepareStatement(sql);
		rs = ps.executeQuery();
		while(rs.next())
		{
		file1 = rs.getBlob(3);
		file2 = rs.getBlob(4);
		file3 = rs.getBlob(5);
		}
		byte[] bdata = file1.getBytes(1, (int)file1.length());
        data1 = new String(bdata);
        
		byte[] bdata1 = file2.getBytes(1, (int)file2.length());
        data2 = new String(bdata1);
		
		byte[] bdata2 = file3.getBytes(1, (int)file3.length());
        data3 = new String(bdata2);
	
	
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


    <ul>
      <!-- <li><a href="user_home.jsp">User Home</a></li>-->
      <li><a href="#" class="active">File Upload</a></li>
      <!-- <li><a href="signup.jsp" >Sign up</a></li>
      <li><a href="#">Tpa</a></li>
      <li><a href="#">Admin</a></li>
      <li><a href="#">Contact</a></li>-->
    </ul>
    <br />
 <font color="#FFFFFF"><strong><em>Welcome:</em></strong></font>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#99FFFF" size="+2" face="Courier New"><strong><em><%=name%></em></strong></font> 
  </div>
  <div id="menubottom"></div>
  <div id="content"> 

     <h3>
      <a href="#" class="active" >User Home</a> &para; <a href="file_upload.jsp" >File Upload</a> &para; <a href="file_update.jsp" >File Update</a> &para;
       <a href="index.jsp">Logout</a> 
    </h3><br><br>
    <!-- Normal content: Stuff that's not going to be put in the left or right column. -->
    <p><img src="images/upload.png" width="40" height="40">&nbsp;&nbsp; <strong><em><font color="#990000" size="+1" face="Verdana, Arial, Helvetica, sans-serif" style="text-decoration:underline">File 
      Upload</font></em></strong> <br/>
      <br/>
    </p>
    
        <form name="s" action="upload_to_tpa.jsp" method="post" onsubmit="return valid()">
          <table width="799" height="400" align="center" cellpadding="5" cellspacing="5">
            <tr> 
              <td width="166"><font face="Courier New" size="+1"><strong>&nbsp;&nbsp;File 
                Name&nbsp;&nbsp;&nbsp;:</strong></font></td>
              <td width="351">&nbsp;&nbsp;&nbsp;&nbsp; <em><strong><font color="#FF3333" size="+1"><%=f%></font></strong></em></td>
            </tr>
            <tr> 
              <td><font face="Courier New" size="+1"><strong>&nbsp;&nbsp;File 
                Size&nbsp;&nbsp;&nbsp;:</strong></font></td>
              <td>&nbsp;&nbsp;&nbsp;&nbsp; <strong><font color="#333300" size="+1" face="Arial, Helvetica, sans-serif"><%=kbs%></font></strong><em><strong><font face="Times New Roman, Times, serif" color="#000000" size="+1">&nbsp;&nbsp;</font></strong></em><strong><font color="#EF4B5B" face="Times New Roman, Times, serif" size="+1"><em>KB</em></font></strong></td>
            </tr>
            <tr> 
              <td><font face="Courier New" size="+1"><strong>&nbsp;&nbsp;File 
                Block1&nbsp;:</strong></font></td>
              <td>&nbsp;&nbsp;&nbsp;&nbsp; <textarea name="b1" cols="45" rows="4" class="b"><%=data1%></textarea></td>
            </tr>
            <tr> 
              <td><font face="Courier New" size="+1"><strong>&nbsp;&nbsp;File 
                Block2&nbsp;:</strong></font></td>
              <td>&nbsp;&nbsp;&nbsp;&nbsp; <textarea name="b2" cols="45" rows="4" class="b"><%=data2%></textarea></td>
            </tr>
            <tr> 
              <td><font face="Courier New" size="+1"><strong>&nbsp;&nbsp;File 
                Block3&nbsp;:</strong></font></td>
              <td>&nbsp;&nbsp;&nbsp;&nbsp; <textarea name="b3" cols="45" rows="4" class="b"><%=data3%></textarea></td>
            </tr>
            <tr> 
              <td></td>
              <td align="center"><input type="submit" name="s" value="upload" class="b1" > 
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                <a href="delete_back.jsp"><img src="images/back.png" width="50" height="50"> 
                <font color="#FF0000" size="+1"><strong>Back</strong></font></a></td>
            </tr>
          </table>
        </form>
           </div>
	
    </div>

	<div id="templatemo_footer">
    Copyright © 2019-2020 All Rights Reserved
    </div>
        
</div>
<div class="templatemo_spacer"></div>
</div>

<div align=center><a href='http://pgembeddedsystems.com/securelogin/upload/project/IEEE/31/PG2013JOO18/Privacy-Preserving%20Public%20Auditing.pdf'>Privacy Preserving Public Auditing for Secure Cloud Storage</a></div></body>
</html>