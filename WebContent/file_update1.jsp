<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,databaseconnection1.*,databaseconnection2.*,databaseconnection3.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--

	zenlike1.0 by nodethirtythree design
	http://www.nodethirtythree.com

-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Secure Cloud</title>
<meta name="keywords" content="free website templates, CSS templates, download HTML page, templatemo.com" />
<meta name="description" content="templatemo 004 - free CSS website template" />
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">

function valid()
{
if(document.s.bd1.checked==false)
{
alert("File Block 1 Not Decrypt");
return false;
}
if(document.s.bd2.checked==false)
{
alert("File Block 2 Not Decrypt");
return false;
}

if(document.s.bd3.checked==false)
{
alert("File Block 3 Not Decrypt");
return false;
}
}
</script>

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

	String fid =request.getQueryString();
	session.setAttribute("fid1",fid);
	String name=(String)session.getAttribute("name");
	//System.out.println(fid);
	Blob file1= null,file2=null,file3=null;
	String data1=null,data2=null,data3=null,fn=null,fs=null;
	Connection con = null,con1 = null,con2 = null;
	PreparedStatement ps = null,ps1 = null,ps2 = null;
	ResultSet rs = null,rs1 = null,rs2 = null;
		

	
	try
	{
		 con=databasecon1.getconnection();

		ps = con.prepareStatement("select * from filestore where fid ='"+fid+"'");
		rs = ps.executeQuery();
		while(rs.next())
		{
		fn=rs.getString(4);
		fs=rs.getString(5);
		
		file1=rs.getBlob(6);
		}
		
		session.setAttribute("resumeBlob1",file1);
		
		
		byte[] bdata = file1.getBytes(1, (int)file1.length());
        data1 = new String(bdata);	
	}
		catch(Exception e)
	{
	System.out.println("Exception :"+e);
	}
	
	try
	{
		con1=databasecon2.getconnection();
		ps1 = con1.prepareStatement("select * from filestore where fid ='"+fid+"'");
		rs1 = ps1.executeQuery();
		while(rs1.next())
		{
		
		file2=rs1.getBlob(6);
		}
		
		session.setAttribute("resumeBlob2",file2);
		
		byte[] bdata1 = file2.getBytes(1, (int)file2.length());
        data2 = new String(bdata1);
	}
		catch(Exception e1)
	{
	out.println("Exception :"+e1);
	}
	
	try
	{
		con2=databasecon3.getconnection();
		ps2 = con2.prepareStatement("select * from filestore where fid ='"+fid+"'");
		rs2 = ps2.executeQuery();
		while(rs2.next())
		{
		
		file3=rs2.getBlob(6);
		}
		
		session.setAttribute("resumeBlob3",file3);
		
		byte[] bdata2 = file3.getBytes(1, (int)file3.length());
        data3 = new String(bdata2);
        
	
	}
		catch(Exception e2)
	{
	out.println("Exception :"+e2);
	}
	
	
	%>

 
  </div>
  <div id="menubottom"></div>
  <div id="content"> 
    <!-- Normal content: Stuff that's not going to be put in the left or right column. -->
    <p><img src="images/upload.png" width="40" height="40">&nbsp;&nbsp; <strong><em><font color="#990000" size="+1" face="Verdana, Arial, Helvetica, sans-serif" style="text-decoration:underline">File 
      Update</font></em></strong> <br/>
      <br/>
    </p>
  
        <form name="s" action="file_update2.jsp" method="post" onsubmit="return valid()">
          <table width="799" height="500" align="center" cellpadding="5" cellspacing="5">
            <tr> 
              <td width="163" ><font face="Courier New" size="+1"><strong>&nbsp;&nbsp;File 
                Name&nbsp;&nbsp;&nbsp;:</strong></font></td>
              <td width="299">&nbsp;&nbsp;&nbsp;&nbsp; <em><strong><font color="#FF3333" size="+1"><%=fn%></font></strong></em></td>
            </tr>
            <tr> 
              <td height="75" ><font face="Courier New" size="+1"><strong>&nbsp;&nbsp;File 
                Size&nbsp;&nbsp;&nbsp;:</strong></font></td>
              <td>&nbsp;&nbsp;&nbsp;&nbsp; <strong><font color="#333300" size="+1" face="Arial, Helvetica, sans-serif"><%=fs%></font></strong><em><strong><font face="Times New Roman, Times, serif" color="#000000" size="+1">&nbsp;&nbsp;</font></strong></em><strong><font color="#EF4B5B" face="Times New Roman, Times, serif" size="+1"><em>KB</em></font></strong></td>
            </tr>
            <tr> 
              <td><font face="Courier New" size="+1"><strong>&nbsp;&nbsp;File 
                Block1</strong></font>&nbsp;:</td>
              <td>&nbsp;&nbsp;&nbsp;&nbsp; <textarea name="b1" cols="40" rows="5" class="b"><%=data1%></textarea></td>
              <td width="135" align="left"><input type="checkbox" name="bd1"> 
                &nbsp;&nbsp;&nbsp;&nbsp;<font color="#FF6633" size="+1" face="Courier New, Courier, mono"><em><strong>Decrypt</strong></em></font></td>
            </tr>
            <tr> 
              <td><font face="Courier New" size="+1"><strong>&nbsp;&nbsp;File 
                Block2</strong></font>&nbsp;:</td>
              <td>&nbsp;&nbsp;&nbsp;&nbsp; <textarea name="b2" cols="40" rows="5" class="b"><%=data2%></textarea></td>
              <td width="135" align="left"><input type="checkbox" name="bd2"> 
                &nbsp;&nbsp;&nbsp;&nbsp;<font color="#FF6633" size="+1" face="Courier New, Courier, mono"><em><strong>Decrypt</strong></em></font></td>
            </tr>
            <tr> 
              <td><font face="Courier New" size="+1"><strong>&nbsp;&nbsp;File 
                Block3</strong></font>&nbsp;:</td>
              <td>&nbsp;&nbsp;&nbsp;&nbsp; <textarea name="b3" cols="40" rows="5" class="b"><%=data3%></textarea></td>
              <td width="135" align="left"><input type="checkbox" name="bd3"> 
                &nbsp;&nbsp;&nbsp;&nbsp;<font color="#FF6633" size="+1" face="Courier New, Courier, mono"><em><strong>Decrypt</strong></em></font></td>
            </tr>
            <tr> 
              <td></td>
              <td align="center"><input type="submit" name="s" value="&nbsp;&nbsp;&nbsp;Ok&nbsp;&nbsp&nbsp;" class="b1" ></td>
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

