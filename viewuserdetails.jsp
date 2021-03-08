<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>User details Page</title>
<meta name="keywords" content="Book Store Template, Free CSS Template, CSS Website Layout, CSS, HTML" />
<meta name="description" content="Book Store Template, Free CSS Template, Download CSS Website" />
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<div id="templatemo_content"><!-- end of content left -->
  
<div class="middle">
<br>
<table border="1" height="100" width="100" align="center">
<tr bgColor=#000000 ><td width="100%" colspan="7"><center><b> User details </b></center></td></tr>
<tr align="center"><td >uid	</td><td>Fname	</td><td>Uname</td><td>address</td>
<td>phoneno</td>
</tr>
<%
  
  ResultSet rs= null;
  PreparedStatement pstmt=null;
try{
	
	 Class.forName("com.mysql.jdbc.Driver");
     
     Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore?user=;password=","root","");
     	pstmt = con.prepareStatement("select * from  userreg");
    
    pstmt.execute();
   rs= pstmt.getResultSet();
   System.out.println(rs);
}
catch(Exception e)
{
	e.printStackTrace();
}

while(rs.next()){

	String uid = rs.getString("uid");
	String ufname = rs.getString("ufname");
	String uuname = rs.getString("uuname");
	String uaddress = rs.getString("uaddress");
	String uphoneno = rs.getString("uphoneno");
	
			
%>
<h2><tr align="center"><td><%=uid %></td><td><%=ufname %></td><td><%= uuname%></td><td><%=uaddress %></td>
<td><%=uphoneno %></td></tr></h2>
<% } %>
<tr></tr>
<tr></tr>
</table>

</div>

<jsp:include page="footer.jsp"></jsp:include>

</html> 