<%@ page  import="java.sql.*" import="databaseconnection.*"%>
<%
String pass=null,uid=null;
try
{
String a = request.getParameter("tid");
String b= request.getParameter("pass");
String name=null;

Connection con = databasecon.getconnection();
Statement st = con.createStatement();

String sss = "select * from tpa where userid='"+a+"' && pass='"+b+"'";

ResultSet rs=st.executeQuery(sss);
if(rs.next())
{
try
{
Connection con1 = databasecon.getconnection();
Statement st1 = con1.createStatement();

String sss1 = "select * from tpa where userid='"+a+"' && pass='"+b+"'";

ResultSet rs1=st1.executeQuery(sss1);
while(rs1.next())
{
name=rs1.getString("name");

}
session.setAttribute("tname",name);

}
catch(Exception e2)
{
out.println(e2.getMessage());
}
response.sendRedirect("tpa_home.jsp");
}
else
{
response.sendRedirect("tpa_log.jsp?message=fail");
}
}
catch(Exception e1)
{
out.println(e1.getMessage());
}

%>