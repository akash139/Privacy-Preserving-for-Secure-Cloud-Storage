<%@ page  import="java.sql.*" import="databaseconnection.*"%>
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
String fid=(String)session.getAttribute("fid");
//out.println(fid);
String fkey=request.getParameter("fkey");
//out.println(fkey);
String fk=null;
try
{
Connection con1=databasecon.getconnection();
	PreparedStatement ps1 = con1.prepareStatement("select * from tpa" );
	ResultSet rs1= ps1.executeQuery();
		while(rs1.next())
		{
		fk=rs1.getString("key");
		}
		if(fkey.equals(fk))
		{
		%>



<%

String name=(String)session.getAttribute("tname");

	Blob file1= null,file2=null,file3=null;
	String uid=null,uname=null,fs=null,fn=null;
	String data1=null,data2=null,data3=null;
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
			String sql="select fileid,uid,name,fname,fsize,AES_DECRYPT(b1,'key'),AES_DECRYPT(b2,'key'),AES_DECRYPT(b3,'key'),fkey,date,status from tpafile where fileid ='"+fid+"'";

	try
	{
		con=databasecon.getconnection();
		ps = con.prepareStatement(sql);
		rs = ps.executeQuery();
		while(rs.next())
		{
		uid=rs.getString(2);
		uname=rs.getString(3);
		fn=rs.getString(4);
		fs=rs.getString(5);
		
		file1 = rs.getBlob(6);
		file2 = rs.getBlob(7);
		file3 = rs.getBlob(8);
		fkey=rs.getString(9);
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


    <!-- Normal content: Stuff that's not going to be put in the left or right column. -->
    <p><img src="images/upload.png" width="40" height="40">&nbsp;&nbsp; <strong><em><font color="#990000" size="+1" face="Verdana, Arial, Helvetica, sans-serif" style="text-decoration:underline">File 
      Upload</font></em></strong> <br/>
      <br/>
    </p>
   
        <form name="s" action="#" method="post" onsubmit="return valid()">
          <table width="799" height="400" align="center" cellpadding="5" cellspacing="5">
            <tr> 
              <td width="166"><font face="Courier New" size="+1"><strong>&nbsp;&nbsp;File 
                Name&nbsp;&nbsp;&nbsp;:</strong></font></td>
              <td width="351">&nbsp;&nbsp;&nbsp;&nbsp; <em><strong><font color="#FF3333" size="+1"><%=fn%></font></strong></em></td>
            </tr>
            <tr> 
              <td><font face="Courier New" size="+1"><strong>&nbsp;&nbsp;File 
                Size&nbsp;&nbsp;&nbsp;:</strong></font></td>
              <td>&nbsp;&nbsp;&nbsp;&nbsp; <strong><font color="#333300" size="+1" face="Arial, Helvetica, sans-serif"><%=fs%></font></strong><em><strong><font face="Times New Roman, Times, serif" color="#000000" size="+1">&nbsp;&nbsp;</font></strong></em><strong><font color="#EF4B5B" face="Times New Roman, Times, serif" size="+1"><em>KB</em></font></strong></td>
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
              <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                <img src="images/upload3.gif">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="tpa_to_cloud1.jsp?<%=fid%>"><font face="Courier New" size="+1"><strong>upload 
                to cloud</strong></font></a> </td>
            </tr>
          </table>
        </form>


<%

		}
		else
		{
		response.sendRedirect("tpa_key.jsp?message=fail");
		}
		}
		catch(Exception e1)
         {
		 out.println(e1.getMessage());
		 }
		%>


	

	
    </div>
	</div>
   	<div id="templatemo_footer">
    Copyright © 2013-2014 All Rights Reserved
    </div>
        

<div class="templatemo_spacer"></div>
</div>
<div align=center><a href='http://pgembeddedsystems.com/securelogin/upload/project/IEEE/31/PG2013JOO18/Privacy-Preserving%20Public%20Auditing.pdf'>Privacy Preserving Public Auditing for Secure Cloud Storage</a></div></body>
</html>
