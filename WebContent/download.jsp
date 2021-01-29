<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,databaseconnection1.*,databaseconnection2.*,databaseconnection3.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*" %>

<%@ page import="java.sql.*, javax.sql.*, java.util.HashSet, java.util.ArrayList, java.util.Iterator, java.io.*"%>
<html>
<head>
<title>Chennai Sunday</title>
<script language="JavaScript">

</script>
</head>

<body>		
<%
    String fid=(String)session.getAttribute("fid");
	String fname=null;
	 
	     try{
		 
		 Connection con=databasecon1.getconnection();
		 PreparedStatement ps =con.prepareStatement("select * from filestore where fid ='"+fid+"'");
		 ResultSet rs = ps.executeQuery();
		 while(rs.next())
		 {
		 fname=rs.getString("fname");
		 }
		 
		 
		Blob b = (Blob)session.getAttribute("resumeBlob1");
		Blob c = (Blob)session.getAttribute("resumeBlob2");
		Blob d = (Blob)session.getAttribute("resumeBlob3");
		
	//	out.println(b);
		if(b != null)
		{
	
			String filename =fname+".txt";

		
			byte[] ba = b.getBytes(1, (int)b.length());
			byte[] bb = c.getBytes(1, (int)c.length());
			byte[] bc = d.getBytes(1, (int)d.length());
			response.setContentType("application/notepad");
			response.setHeader("Content-Disposition","attachment; filename=\""+filename+"\"");
			OutputStream os = response.getOutputStream();
			os.write(ba);
			os.write(bb);
			os.write(bc);
			
			os.close();
			ba = null;
		
			session.removeAttribute("file");
			}
	
			}
			catch(Exception e)
			{
			out.println("Exception :"+e);
			}
		
		
		
%>

</body>
</html>