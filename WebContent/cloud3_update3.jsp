<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,databaseconnection1.*,databaseconnection2.*,databaseconnection3.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*" %>
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*" %>
<%
String b1=request.getParameter("b1");
String fid=(String)session.getAttribute("fid");



java.util.Date now = new java.util.Date();
	 String DATE_FORMAT1 = "dd/MM/yyyy hh:mm:ss a";
	 SimpleDateFormat sdf1 = new SimpleDateFormat(DATE_FORMAT1);
     String strDateNew1 = sdf1.format(now);
	
Blob file1= null;
	String data1=null,fs=null,fn=null,uid=null,name=null;
	Connection con = null,con1=null;
	PreparedStatement ps = null,ps1=null;
	ResultSet rs = null;
	String sql=null,sql1=null;
String mb="File block3";
String mby="cloud server3";
String sta="new";
try
	{
		con=databasecon3.getconnection();
		ps = con.prepareStatement("select uid,name,fid,fname,fsize,AES_DECRYPT(b3,'key'),date,status from filestore where fid ='"+fid+"'");
		rs = ps.executeQuery();
		while(rs.next())
		{      
		        uid=rs.getString(1);
				name=rs.getString(2);
				
				fn=rs.getString(4);
				fs=rs.getString(5);
				file1 = rs.getBlob(6);
				
		}
		byte[] bdata = file1.getBytes(1, (int)file1.length());
        data1 = new String(bdata);
       }
	   catch(Exception e1)
	   {
	   out.println(e1.getMessage());
	   }
	   if(b1.equals(data1))
	   {
		 response.sendRedirect("cloud3_all_files.jsp");
		   
	   }
	   else
	   {
	        try
            	{
		       con1=databasecon.getconnection();
		       ps1 = con1.prepareStatement("insert into tpa_alert (fid,uid,name,fname,fsize,mblock,mby,date,status) values (?,?,?,?,?,?,?,?,?)");
               ps1.setString(1,fid);
			   ps1.setString(2,uid);
			   ps1.setString(3,name);
			   ps1.setString(4,fn);
			   ps1.setString(5,fs);
			   ps1.setString(6,mb);
			   ps1.setString(7,mby);
			   ps1.setString(8,strDateNew1);
			   ps1.setString(9,sta);
			   
        		ps1.executeUpdate();
				
				response.sendRedirect("cloud3_all_files.jsp?message=fail");
		     }
               catch(Exception e2)
	            {
	            out.println(e2.getMessage());
	             }
		   
	   }
	   
	%>   