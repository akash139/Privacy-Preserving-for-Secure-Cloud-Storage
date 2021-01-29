<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,databaseconnection1.*,databaseconnection2.*,databaseconnection3.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*" %>
<%
String b3=(String)session.getAttribute("b3");

String fid=(String)session.getAttribute("fid1");



	String name=(String)session.getAttribute("name");
	//System.out.println(fid);
	Blob file1= null,file2=null,file3=null;
	String data1=null,data2=null,data3=null,fn=null,fs=null;
	Connection con = null,con1 = null,con2 = null;
	PreparedStatement ps = null,ps1 = null,ps2 = null;
	ResultSet rs = null,rs1 = null,rs2 = null;
		

	
	try
	{
		 con=databasecon3.getconnection();

		ps = con.prepareStatement("select uid,name,fid,fname,fsize,AES_DECRYPT(b3,'key'),date from filestore where fid ='"+fid+"'");
		rs = ps.executeQuery();
		while(rs.next())
		{
		fn=rs.getString(4);
		fs=rs.getString(5);
		
		file1=rs.getBlob(6);
		}
			
		byte[] bdata = file1.getBytes(1, (int)file1.length());
        data1 = new String(bdata);
        
		if(b3.equals(data1))
		{
		String g = "C:\\Program Files\\Apache Software Foundation\\Tomcat 6.0\\webapps\\PrivacyPreserving\\tpa_verify\\bk3.txt";
		BufferedWriter bout1 = new BufferedWriter(new FileWriter(g));
        bout1.write(b3); 
	    bout1.close();
		
		File ima1=new File(g);
		  double by1=ima1.length();
		  double k1=by1/1024;
		  String kb3=Double.toString(k1);
		  session.setAttribute("kbs3",kb3);
		System.out.println(kb3);
		
		response.sendRedirect("file_update6.jsp?message=success");
		
		}
		else
		{
		
		String n = "C:\\Program Files\\Apache Software Foundation\\Tomcat 6.0\\webapps\\PrivacyPreserving\\tpa_verify\\blk3.txt";	
		BufferedWriter bout = new BufferedWriter(new FileWriter(n));
        bout.write(b3); 
	    bout.close();
		FileInputStream fis=null;
		
		try
		{
         con1=databasecon3.getconnection();
          File image=new File(n);
		  
		  
		  double bytes=image.length();
		  double kb=bytes/1024;
		  String kbs2=Double.toString(kb);
		  session.setAttribute("kbs3",kbs2);
		  
		  System.out.println(kbs2);
		  

          PreparedStatement psmt1=con1.prepareStatement("update filestore set b3=AES_ENCRYPT(?, 'key') where fid='"+fid+"'");

              fis=new FileInputStream(image);
              psmt1.setBinaryStream(1, (InputStream)fis, (int)(image.length()));

             psmt1.executeUpdate();
            
               }
           catch(Exception ex)
               {
  
              out.println("Error in connection : "+ex);
             }
		
	
	 try
		    {
            con2=databasecon.getconnection();
            File image1=new File(n);

           ps2=con2.prepareStatement("update tpafile set b3=AES_ENCRYPT(?, 'key') where fileid='"+fid+"'");

              fis=new FileInputStream(image1);
              ps2.setBinaryStream(1, (InputStream)fis, (int)(image1.length()));

             ps2.executeUpdate();
             response.sendRedirect("file_update6.jsp?message=success");
               }
           catch(Exception en)
               {
  
              out.println("Error in connection : "+en);
             }
		
	
	
	
	
	
	
	
				
		}
		
		}
		catch(Exception e)
	{
	System.out.println("Exception :"+e);
	}
	%>
	