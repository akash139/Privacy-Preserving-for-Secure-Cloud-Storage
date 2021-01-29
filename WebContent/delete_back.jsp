<%@ page import="java.sql.*" import="databaseconnection.*" errorPage="" %>
<html>
<head>
<title>transport management</title>
</head>

<body>
<%
String u =(String)session.getAttribute("u");
String tfid =(String)session.getAttribute("tfid");

try
    {
	 Connection con = databasecon.getconnection();
	PreparedStatement ps=con.prepareStatement("delete from temp where uid='"+u+"' && fileid='"+tfid+"'");
    
	ps.executeUpdate();
	response.sendRedirect("file_upload.jsp");
	}
	catch(Exception e1)
	{
	out.println(e1.getMessage());
	}

%>
</body>
</html>
