<%@ page  import="java.sql.*" import="databaseconnection.*"%>
<%
String aid=request.getQueryString();


String o="old";

try
{
Connection con=databasecon.getconnection();

PreparedStatement ps=con.prepareStatement("update tpa_alert set status='"+o+"' where aid='"+aid+"'");
ps.executeUpdate();
response.sendRedirect("tpa_alert.jsp");

}
catch(Exception e1)
{
out.println(e1.getMessage());
}


%>