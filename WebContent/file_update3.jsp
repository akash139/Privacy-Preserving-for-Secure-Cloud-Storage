<%@ page import="java.sql.*,java.lang.*,databaseconnection.*,databaseconnection1.*,databaseconnection2.*,databaseconnection3.*,java.text.SimpleDateFormat,java.util.*,java.io.*" %>
<%

String b1=request.getParameter("b1");

String b2=request.getParameter("b2");
session.setAttribute("b2",b2);
String b3=request.getParameter("b3");
session.setAttribute("b3",b3);
String fid=(String)session.getAttribute("fid1");



	String name=(String)session.getAttribute("name");
	System.out.println(b1);
	Blob file1= null,file2=null,file3=null;
	String data1=null,data2=null,data3=null,fn=null,fs=null;
	Connection con = null,con1 = null,con2 = null;
	PreparedStatement ps = null,ps1 = null,ps2 = null;
	ResultSet rs = null,rs1 = null,rs2 = null;
		

	
	try
	{
		 con=databasecon1.getconnection();

		ps = con.prepareStatement("select uid,name,fid,fname,fsize,AES_DECRYPT(b1,'key'),date from filestore where fid ='"+fid+"'");
		rs = ps.executeQuery();
		while(rs.next())
		{
		fn=rs.getString(4);
		fs=rs.getString(5);
		
		file1=rs.getBlob(6);
		}
			
		byte[] bdata = file1.getBytes(1, (int)file1.length());
        data1 = new String(bdata);
        
		
		
		if(b1.equals(data1))
		{
		String g = "C:\\Program Files\\Apache Software Foundation\\Tomcat 9.0\\webapps\\PrivacyPreserving\\tpa_verify\\bk1.txt";
		BufferedWriter bout1 = new BufferedWriter(new FileWriter(g));
        bout1.write(b1); 
	    bout1.close();
		
		File ima=new File(g);
		  double by=ima.length();
		  double k=by/1024;
		  String kb=Double.toString(k);
		  session.setAttribute("kbs1",kb);
		System.out.println(kb);
		response.sendRedirect("file_update4.jsp");
		
		}
		else
		{
		
		String l = "C:\\Program Files\\Apache Software Foundation\\Tomcat 9.0\\webapps\\PrivacyPreserving\\tpa_verify\\blk1.txt";	
		BufferedWriter bout = new BufferedWriter(new FileWriter(l));
        bout.write(b1); 
	    bout.close();
		FileInputStream fis=null;
		//for cloud1 update
		try
		{
          con1=databasecon1.getconnection();
          File image=new File(l);
		  double bytes=image.length();
		  double kb=bytes/1024;
		  String kbs1=Double.toString(kb);
		  session.setAttribute("kbs1",kbs1);
		System.out.println(kbs1);

          PreparedStatement psmt1=con1.prepareStatement("update filestore set b1=AES_ENCRYPT(?, 'key') where fid='"+fid+"'");

              fis=new FileInputStream(image);
              psmt1.setBinaryStream(1, (InputStream)fis, (int)(image.length()));

             psmt1.executeUpdate();
             
               }
           catch(Exception ex)
               {
  
              out.println("Error in connection : "+ex);
             }
		
		//for tpa Update
		try
		{
          con2=databasecon.getconnection();
          File image1=new File(l);

        ps2=con2.prepareStatement("update tpafile set b1=AES_ENCRYPT(?, 'key') where fileid='"+fid+"'");

              fis=new FileInputStream(image1);
              ps2.setBinaryStream(1, (InputStream)fis, (int)(image1.length()));

             ps2.executeUpdate();
              response.sendRedirect("file_update4.jsp");
               }
           catch(Exception em)
               {
  
              out.println("Error in connection : "+em);
             }
		
		
		}
		}
		catch(Exception e)
	{
	System.out.println("Exception :"+e);
	}
	%>
	

