<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,databaseconnection1.*,databaseconnection2.*,databaseconnection3.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>multi cloud</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script type="text/javascript">

</script>
</head>

<body>

<%

java.util.Date now = new java.util.Date();
	 String DATE_FORMAT1 = "dd/MM/yyyy";
	 SimpleDateFormat sdf1 = new SimpleDateFormat(DATE_FORMAT1);
     String strDateNew1 = sdf1.format(now);



String a="C:\\Program Files\\Apache Software Foundation\\Tomcat 6.0\\webapps\\PrivacyPreserving\\temp\\file1.txt";
String b="C:\\Program Files\\Apache Software Foundation\\Tomcat 6.0\\webapps\\PrivacyPreserving\\temp\\file2.txt";
String c="C:\\Program Files\\Apache Software Foundation\\Tomcat 6.0\\webapps\\PrivacyPreserving\\temp\\file3.txt";

FileInputStream fis=null;

File image=new File(a);
File image1=new File(b);
File image2=new File(c);


//String m="on process";
String ser=(String)session.getAttribute("ser");


String u=(String)session.getAttribute("u");
String name=(String)session.getAttribute("name");
String f=(String)session.getAttribute("f");
String kbs=(String)session.getAttribute("kbs");

String tfid=(String)session.getAttribute("tfid");
String fkey=(String)session.getAttribute("fkey");
String m="not_verified";

String x="s1";
String y="s2";
String z="s3";


Connection con=null,con1=null,con2=null;
PreparedStatement psmt1=null,psmt2=null,psmt3=null;





try{
con=databasecon.getconnection();

psmt1=con.prepareStatement("insert into tpafile(fileid,uid,name,fname,fsize,b1,b2,b3,fkey,date,status) values(?,?,?,?,?,AES_ENCRYPT(?, 'key'),AES_ENCRYPT(?, 'key'),AES_ENCRYPT(?, 'key'),?,?,?)");
psmt1.setString(1,tfid);
psmt1.setString(2,u);
psmt1.setString(3,name);
psmt1.setString(4,f);
psmt1.setString(5,kbs);
fis=new FileInputStream(image);
psmt1.setBinaryStream(6, (InputStream)fis, (int)(image.length()));

fis=new FileInputStream(image1);
psmt1.setBinaryStream(7, (InputStream)fis, (int)(image1.length()));

fis=new FileInputStream(image2);
psmt1.setBinaryStream(8, (InputStream)fis, (int)(image2.length()));

psmt1.setString(9,fkey);
psmt1.setString(10,strDateNew1);

psmt1.setString(11,m);



psmt1.executeUpdate();

}
catch(Exception ex)
{

out.println("Error in connection : "+ex);

}

	response.sendRedirect("file_upload.jsp?message=success");

	
%>

</body>
</html>