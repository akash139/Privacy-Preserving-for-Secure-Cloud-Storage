<%@ page import="java.sql.*" %>
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,databaseconnection1.*,databaseconnection2.*,databaseconnection3.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*" %>

<%
String kb1=(String)session.getAttribute("kbs1");

String kb2=(String)session.getAttribute("kbs2");

String kb3=(String)session.getAttribute("kbs3");
String fid=(String)session.getAttribute("fid1");
  double a=Double.parseDouble(kb1);
  double b=Double.parseDouble(kb2);
   double c=Double.parseDouble(kb3);
   double sum=a+b+c;
   String sum1=Double.toString(sum);
   
   
  Connection con=null,con1=null,con2=null,con3=null;
  PreparedStatement ps=null,ps1=null,ps2=null,ps3=null;
  
  try
  {
  con=databasecon.getconnection();
  ps=con.prepareStatement("update tpafile set fsize='"+sum1+"' where fileid='"+fid+"'");
  ps.executeUpdate();
  }
  catch(Exception e1)
  {
  out.println(e1.getMessage());
  }
  
  try
  {
  con1=databasecon1.getconnection();
  ps1=con1.prepareStatement("update filestore set fsize='"+sum1+"' where fid='"+fid+"'");
  ps1.executeUpdate();
  }
  catch(Exception e2)
  {
  out.println(e2.getMessage());
  }
  
  
  try
  {
  con2=databasecon2.getconnection();
  ps2=con2.prepareStatement("update filestore set fsize='"+sum1+"' where fid='"+fid+"'");
  ps2.executeUpdate();
  }
  catch(Exception e3)
  {
  out.println(e3.getMessage());
  }
  
  
  
    
  try
  {
  con3=databasecon3.getconnection();
  ps3=con3.prepareStatement("update filestore set fsize='"+sum1+"' where fid='"+fid+"'");
  ps3.executeUpdate();
  }
  catch(Exception e4)
  {
  out.println(e4.getMessage());
  }
  
  
  response.sendRedirect("file_update.jsp?message=success");
   
 

%>
	