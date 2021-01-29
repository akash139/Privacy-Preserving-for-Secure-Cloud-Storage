<%@ page  import="java.sql.*" import="databaseconnection.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Secure Cloud</title>
<meta name="keywords" content="free website templates, CSS templates, download HTML page, templatemo.com" />
<meta name="description" content="templatemo 004 - free CSS website template" />
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">

function valid()
{
var a=document.s.fn.value;
if(a=="")
{
alert("Enter File Name");
document.s.fn.focus();
return false;
}
var b=document.s.file.value;
if(b=="")
{
alert("Browse a File");
document.s.file.focus();
return false;
}
if(document.s.server.selectedIndex==0)
{
alert("Select a Cloud Server");
document.s.server.focus();
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

<style type="text/css">
.b:hover{
border-size:3px;
border-color:red;
}
.b1
{
background-color: #color;
border-bottom:solid;
border-left: #FFEEEE;
border-right:solid;
border-top: #EEEEEE;
color: brown;
font-family: Verdana, Arial

}
</style>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link rel="stylesheet" type="text/css" href="default.css" />
</head>
<body>
<%
String name=(String)session.getAttribute("name");
%>
   <h3>
      <a href="user_home.jsp" class="active" >User Home</a> &para; <a href="file_upload.jsp" >File Upload</a> &para; <a href="file_update.jsp" >File Update</a> &para;
       <a href="index.jsp">Logout</a> 
    </h3><br><br><br>
 
 <h2>File 
      Upload</font></em></strong> <br/>
      <br/>
    </p>
    <!-- Primary content: Stuff that goes in the primary content column (by default, the left column) -->
   
          <form name="s" action="file_upload1.jsp" method="get" onsubmit="return valid()">
            <table align="center" cellpadding="5" cellspacing="5" width="500">
              <tr> 
                <td colspan="2" align="center"><font size="2"><b> 
                  <%
                                                       String message=request.getParameter("message");
                                                       if(message!=null && message.equalsIgnoreCase("success"))
                                                       {
                                                               out.println("<font color='red'>File Successfully Uploaded !</font>");
                                                       }
                                               %>
                  </b></font></td>
              </tr>
              <tr> 
                <td><font face="Courier New" size="+1"><strong>&nbsp;&nbsp;User 
                  Name</strong></font></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp; <em><strong><font color="#336633" size="+1"><%=name%></font></strong></em></td>
              </tr>
              <tr> 
                <td><font face="Courier New" size="+1"><strong>&nbsp;&nbsp;File 
                  Name</strong></font></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="fn" class="b"></td>
              </tr>
              <tr> 
                <td><font face="Courier New" size="+1"><strong>&nbsp;&nbsp;Upload 
                  File</strong></font></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp; <input type="file" name="file" class="b"></td>
              </tr>
              <tr> 
                <td><font face="Courier New" size="+1"><strong>&nbsp;&nbsp;File 
                  Key</strong></font></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="fkey" class="b" ></td>
              </tr>
              <tr> 
                <td></td>
                <td><input type="submit" name="s" value="submit" class="b1" > 
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                  <input type="reset" name="r" value="clear" class="b1"></td>
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