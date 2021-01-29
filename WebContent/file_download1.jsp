<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,databaseconnection1.*,databaseconnection2.*,databaseconnection3.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*" %>



<%
	String fid=(String)session.getAttribute("fid");
	String name=(String)session.getAttribute("name");
	//System.out.println(fid);
	Blob file1= null,file2=null,file3=null;
	String data1=null,data2=null,data3=null,fn=null,fs=null;
	Connection con = null,con1 = null,con2 = null;
	PreparedStatement ps = null,ps1 = null,ps2 = null;
	ResultSet rs = null,rs1 = null,rs2 = null;
		

	
	try
	{
		 con=databasecon1.getconnection();

		ps = con.prepareStatement("select uid,name,fid,fname,fsize,AES_DECRYPT(b1,'key'),date,status from filestore where fid ='"+fid+"'");
		rs = ps.executeQuery();
		while(rs.next())
		{
		fn=rs.getString(4);
		fs=rs.getString(5);
		
		file1=rs.getBlob(6);
		}
		
		session.setAttribute("resumeBlob1",file1);
		
		
		byte[] bdata = file1.getBytes(1, (int)file1.length());
        data1 = new String(bdata);
        
	
	}
		catch(Exception e)
	{
	System.out.println("Exception :"+e);
	}
	
	try
	{
		con1=databasecon2.getconnection();
		ps1 = con1.prepareStatement("select uid,name,fid,fname,fsize,AES_DECRYPT(b2,'key'),date,status from filestore where fid ='"+fid+"'");
		rs1 = ps1.executeQuery();
		while(rs1.next())
		{
		
		file2=rs1.getBlob(6);
		}
		
	session.setAttribute("resumeBlob2",file2);
		
		byte[] bdata1 = file2.getBytes(1, (int)file2.length());
        data2 = new String(bdata1);
        
	
	}
		catch(Exception e1)
	{
	out.println("Exception :"+e1);
	}
	
	try
	{
		con2=databasecon3.getconnection();
		ps2 = con2.prepareStatement("select uid,name,fid,fname,fsize,AES_DECRYPT(b3,'key'),date,status from filestore where fid ='"+fid+"'");
		rs2 = ps2.executeQuery();
		while(rs2.next())
		{
		
		file3=rs2.getBlob(6);
		}
		
		session.setAttribute("resumeBlob3",file3);
		
		byte[] bdata2 = file3.getBytes(1, (int)file3.length());
        data3 = new String(bdata2);
        
	
	}
		catch(Exception e2)
	{
	out.println("Exception :"+e2);
	}
	response.sendRedirect("download.jsp");
	
	%>