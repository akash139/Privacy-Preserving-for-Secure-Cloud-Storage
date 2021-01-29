
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



String a="./temp/file1.txt";
String b="./temp/file2.txt";
String c="./temp/file3.txt";

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

String m="notverified";

String x="s1";
String y="s2";
String z="s3";


Connection con=null,con1=null,con2=null;
PreparedStatement psmt1=null,psmt2=null,psmt3=null;



if(ser.equals(x))
{

try{
con=databasecon1.getconnection();

psmt1=con.prepareStatement("insert into filestore(uid,name,fname,fsize,b1,b2,b3,date) values(?,?,?,?,?,?,?,?)");
psmt1.setString(1,u);
psmt1.setString(2,name);
psmt1.setString(3,f);
psmt1.setString(4,kbs);
fis=new FileInputStream(image);
psmt1.setBinaryStream(5, (InputStream)fis, (int)(image.length()));

fis=new FileInputStream(image1);
psmt1.setBinaryStream(6, (InputStream)fis, (int)(image1.length()));

fis=new FileInputStream(image2);
psmt1.setBinaryStream(7, (InputStream)fis, (int)(image2.length()));


psmt1.setString(8,strDateNew1);


psmt1.executeUpdate();


}
catch(Exception ex)
{

out.println("Error in connection : "+ex);

}


}
else if(ser.equals(y))
{

try{
con1=databasecon2.getconnection();

psmt2=con1.prepareStatement("insert into filestore(uid,name,fname,fsize,b1,b2,b3,date) values(?,?,?,?,?,?,?,?)");
psmt2.setString(1,u);
psmt2.setString(2,name);
psmt2.setString(3,f);
psmt2.setString(4,kbs);
fis=new FileInputStream(image);
psmt2.setBinaryStream(5, (InputStream)fis, (int)(image.length()));

fis=new FileInputStream(image1);
psmt2.setBinaryStream(6, (InputStream)fis, (int)(image1.length()));

fis=new FileInputStream(image2);
psmt2.setBinaryStream(7, (InputStream)fis, (int)(image2.length()));

psmt2.setString(8,strDateNew1);


psmt2.executeUpdate();


}
catch(Exception ey)
{

out.println("Error in connection : "+ey);

}

}
else if(ser.equals(z))
{

try{
con2=databasecon3.getconnection();

psmt3=con2.prepareStatement("insert into filestore(uid,name,fname,fsize,b1,b2,b3,date) values(?,?,?,?,?,?,?,?)");
psmt3.setString(1,u);
psmt3.setString(2,name);
psmt3.setString(3,f);
psmt3.setString(4,kbs);

fis=new FileInputStream(image);
psmt3.setBinaryStream(5, (InputStream)fis, (int)(image.length()));

fis=new FileInputStream(image1);
psmt3.setBinaryStream(6, (InputStream)fis, (int)(image1.length()));

fis=new FileInputStream(image2);
psmt3.setBinaryStream(7, (InputStream)fis, (int)(image2.length()));

psmt3.setString(8,strDateNew1);


psmt3.executeUpdate();


}
catch(Exception ez)
{

out.println("Error in connection : "+ez);

}
}

try
    {
	 Connection con4 = databasecon.getconnection();
	PreparedStatement ps=con4.prepareStatement("delete from temp where uid='"+u+"'");
    
	ps.executeUpdate();
	response.sendRedirect("upload_success.jsp");
	}
	catch(Exception e1)
	{
	out.println(e1.getMessage());
	}

%>

</body>
</html>