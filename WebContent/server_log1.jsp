<%@ page  import="java.sql.*" import="databaseconnection.*"%>
<%
String a = request.getParameter("uid");
String b= request.getParameter("pass");
String c= request.getParameter("ser");
String n1="CLOUD1";
String n2="CLOUD2";
String n3="CLOUD3";
try
{

String name=null;

Connection con = databasecon.getconnection();
Statement st = con.createStatement();

String sss = "select * from ser_log where userid='"+a+"' && pass='"+b+"' && ser='"+c+"' ";

ResultSet rs=st.executeQuery(sss);
if(rs.next())
{
try
{
Connection con1 = databasecon.getconnection();
Statement st1 = con1.createStatement();

String sss1 = "select * from ser_log where userid='"+a+"' && pass='"+b+"' && ser='"+c+"'";

ResultSet rs1=st1.executeQuery(sss1);
while(rs1.next())
{
name=rs1.getString("name");

}
session.setAttribute("sname",name);

if(name.equals(n1))
{
response.sendRedirect("cloud1_home.jsp");
}
else if(name.equals(n2))
{
response.sendRedirect("cloud2_home.jsp");
}
else if(name.equals(n3))
{
response.sendRedirect("cloud3_home.jsp");
}



}
catch(Exception e2)
{
out.println(e2.getMessage());
}
}
else
{
response.sendRedirect("server_log.jsp?message=fail");
}
}
catch(Exception e1)
{
out.println(e1.getMessage());
}

%>