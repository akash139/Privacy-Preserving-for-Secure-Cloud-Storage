<%@ page import="java.sql.*,java.lang.*,databaseconnection.*,databaseconnection1.*,databaseconnection2.*,databaseconnection3.*,java.text.SimpleDateFormat,java.util.*,java.io.*" %>

<%

String fid=request.getQueryString();

	Blob file1= null,file2=null,file3=null;
	String uid=null,uname=null,fs=null,fn=null,fid1=null,fkey=null;
	String data1=null,data2=null,data3=null,dat=null;
	
	PreparedStatement ps = null;
	ResultSet rs = null;
		

java.util.Date now = new java.util.Date();
	 String DATE_FORMAT1 = "dd/MM/yyyy";
	 SimpleDateFormat sdf1 = new SimpleDateFormat(DATE_FORMAT1);
     String strDateNew1 = sdf1.format(now);

FileInputStream fis=null;
	String all="allow";
	try
	{
		Connection con5=databasecon.getconnection();
		ps = con5.prepareStatement("select fileid,uid,name,fname,fsize,AES_DECRYPT(b1,'key'),AES_DECRYPT(b2,'key'),AES_DECRYPT(b3,'key'),fkey,date,status from tpafile where fileid ='"+fid+"'");
		rs = ps.executeQuery();
		while(rs.next())
		{
		fid1=rs.getString(1);
		uid=rs.getString(2);
		uname=rs.getString(3);
		fn=rs.getString(4);
		fs=rs.getString(5);
		
		file1 = rs.getBlob(6);
		file2 = rs.getBlob(7);
		file3 = rs.getBlob(8);
		fkey=rs.getString(9);
		dat=rs.getString(10);
		}
		
		byte[] bdata = file1.getBytes(1, (int)file1.length());
        data1 = new String(bdata);
        
		byte[] bdata1 = file2.getBytes(1, (int)file2.length());
        data2 = new String(bdata1);
		
		byte[] bdata2 = file3.getBytes(1, (int)file3.length());
        data3 = new String(bdata2);
	
	
	BufferedWriter bout = new BufferedWriter(new FileWriter("C:\\Program Files\\Apache Software Foundation\\Tomcat 6.0\\webapps\\PrivacyPreserving\\tpa_verify\\block1.txt"));
    bout.write(data1); 
	
	BufferedWriter bout1 = new BufferedWriter(new FileWriter("C:\\Program Files\\Apache Software Foundation\\Tomcat 6.0\\webapps\\PrivacyPreserving\\tpa_verify\\block2.txt"));
    bout1.write(data2); 
	
	
	
	BufferedWriter bout2 = new BufferedWriter(new FileWriter("C:\\Program Files\\Apache Software Foundation\\Tomcat 6.0\\webapps\\PrivacyPreserving\\tpa_verify\\block3.txt"));
    bout2.write(data3); 
	
	
	bout.close();
	bout1.close();
	bout2.close();

	
		try{
Connection con=databasecon1.getconnection();

String l = "C:\\Program Files\\Apache Software Foundation\\Tomcat 6.0\\webapps\\PrivacyPreserving\\tpa_verify\\block1.txt";

File image=new File(l);
PreparedStatement psmt1=con.prepareStatement("insert into filestore(uid,name,fid,fname,fsize,b1,date,status) values(?,?,?,?,?,AES_ENCRYPT(?, 'key'),?,?)");
psmt1.setString(1,uid);
psmt1.setString(2,uname);
psmt1.setString(3,fid);
psmt1.setString(4,fn);
psmt1.setString(5,fs);

fis=new FileInputStream(image);
psmt1.setBinaryStream(6, (InputStream)fis, (int)(image.length()));

psmt1.setString(7,strDateNew1);
psmt1.setString(8,all);
psmt1.executeUpdate();

}
catch(Exception ex)
{

out.println("Error in connection : "+ex);

}


try{
Connection con1=databasecon2.getconnection();

String m = "C:\\Program Files\\Apache Software Foundation\\Tomcat 6.0\\webapps\\PrivacyPreserving\\tpa_verify\\block2.txt";
File image1=new File(m);

PreparedStatement psmt2=con1.prepareStatement("insert into filestore(uid,name,fid,fname,fsize,b2,date,status) values(?,?,?,?,?,AES_ENCRYPT(?, 'key'),?,?)");
psmt2.setString(1,uid);
psmt2.setString(2,uname);
psmt2.setString(3,fid);
psmt2.setString(4,fn);
psmt2.setString(5,fs);

fis=new FileInputStream(image1);
psmt2.setBinaryStream(6, (InputStream)fis, (int)(image1.length()));

psmt2.setString(7,strDateNew1);
psmt2.setString(8,all);
psmt2.executeUpdate();

}
catch(Exception ey)
{

out.println("Error in connection : "+ey);

}




try{
Connection con2=databasecon3.getconnection();

String n = "C:\\Program Files\\Apache Software Foundation\\Tomcat 6.0\\webapps\\PrivacyPreserving\\tpa_verify\\block3.txt";

File image2=new File(n);

PreparedStatement psmt3=con2.prepareStatement("insert into filestore(uid,name,fid,fname,fsize,b3,date,status) values(?,?,?,?,?,AES_ENCRYPT(?, 'key'),?,?)");
psmt3.setString(1,uid);
psmt3.setString(2,uname);
psmt3.setString(3,fid);
psmt3.setString(4,fn);
psmt3.setString(5,fs);

fis=new FileInputStream(image2);
psmt3.setBinaryStream(6, (InputStream)fis, (int)(image2.length()));

psmt3.setString(7,strDateNew1);
psmt3.setString(8,all);
psmt3.executeUpdate();

}
catch(Exception ez)
{

out.println("Error in connection : "+ez);

}
	
		
		}
catch(Exception e1)
{
out.println(e1.getMessage());
}

String a="uploaded";
try
{
Connection con6=databasecon.getconnection();
PreparedStatement ps6=con6.prepareStatement("update tpafile set status='"+a+"' where fileid='"+fid+"'");
ps6.executeUpdate();
response.sendRedirect("tpa_home.jsp");
}
catch(Exception ee)
{
out.println(ee.getMessage());
}

%>