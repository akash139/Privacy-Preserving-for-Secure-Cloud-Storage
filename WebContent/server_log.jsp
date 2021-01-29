<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Secure Cloud</title>
<meta name="keywords" content="free website templates, CSS templates, download HTML page, templatemo.com" />
<meta name="description" content="templatemo 004 - free CSS website template" />
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />


<script type="text/javascript">

function valid()
{
var a=document.s.uid.value;
if(a=="")
{
alert("Enter User ID");
document.s.uid.focus();
return false;
}
var b=document.s.pass.value;
if(b=="")
{
alert("Enter Password");
document.s.pass.focus();
return false;
}
if(document.s.ser.selectedIndex==0)
{
alert("Select a Server");
document.s.ser.focus();
return false;
}


}

</script>

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


          <form name="s" action="server_log1.jsp" method="get" onsubmit="return valid()">
            <table align="center" cellpadding="7" cellspacing="7" width="500">
              <tr><td> <font color="#3399ff" size=5>Cloud Server Login
			  <tr>
                <td><font face="Courier New" size="+1"><strong><img src="images/login1.png">&nbsp;&nbsp;User 
                  ID</strong></font></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="uid" class="b"></td>
              </tr>
              <tr> 
                <td><font face="Courier New" size="+1"><strong><img src="images/login.png">&nbsp;&nbsp;Password</strong></font></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp; <input type="password" name="pass" class="b"></td>
              </tr>
              <tr> 
                <td><font face="Courier New" size="+1"><strong><img src="images/ser.png" height="30" width="25">&nbsp;&nbsp;Server</strong></font></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp; <select name="ser" class="b">
                    <option value="0" >--select--</option>
                    <option value="cloudserver1">Cloud Server 1   </option>
                    <option value="cloudserver2">Cloud Server 2</option>
                    <option value="cloudserver3">Cloud Server 3</option>
                  </select></td>
              </tr>
              <tr> 
                <td></td>

                <td><input type="submit" name="s" value="submit" > 

                 <td> <input type="reset" name="r" value="clear" class="b1"></td>
              </tr></tr>
              <tr> 
                <td colspan="2" align="center"><font size="2"><b> 
                  <%
                                                       String message=request.getParameter("message");
                                                       if(message!=null && message.equalsIgnoreCase("fail"))
                                                       {
                                                               out.println("<font color='red'><blink>You are not valid user !</blink></font>");
                                                       }
                                               %>
                  </b></font></td>
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