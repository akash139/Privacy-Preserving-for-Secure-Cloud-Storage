<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,databaseconnection1.*,databaseconnection2.*,databaseconnection3.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*" %>
<%
String fid=request.getQueryString();
String a="allowed";
try
{
	Connection con = databasecon2.getconnection();
	Statement st = con.createStatement();	

    String qry="update filestore set status='"+a+"' where fid='"+fid+"'";
		st.executeUpdate(qry);
response.sendRedirect("cloud2_home.jsp");
}
catch(Exception e1)
{
out.println(e1.getMessage());
}


%>