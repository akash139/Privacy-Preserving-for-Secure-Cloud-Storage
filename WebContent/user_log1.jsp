<%@ page  import="java.sql.*" import="databaseconnection.*"%>
<%
String pass=null,uid=null;
try
{
String a = request.getParameter("uid");
String b= request.getParameter("pass");
String name=null,u=null;

Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/multicloud","root","adikash");
Statement st = con.createStatement();

String sss = "select * from user where userid='"+a+"' && pass='"+b+"'";

ResultSet rs=st.executeQuery(sss);
if(rs.next())
{
try
{
Connection con1 = databasecon.getconnection();
Statement st1 = con1.createStatement();

String sss1 = "select * from user where userid='"+a+"' && pass='"+b+"'";

ResultSet rs1=st1.executeQuery(sss1);
while(rs1.next())
{
u=rs1.getString("uid");
name=rs1.getString("name");

//pass=rs1.getString("password");
//uid=rs1.getString("uid");
}
session.setAttribute("name",name);
session.setAttribute("u",u);
//session.setAttribute("pass",pass);
//session.setAttribute("uid",uid);
}
catch(Exception e2)
{
out.println(e2.getMessage());
}
response.sendRedirect("user_home.jsp");
}
else
{
response.sendRedirect("user_log.jsp?message=fail");
}
}
catch(Exception e1)
{
out.println(e1.getMessage());
}

%>