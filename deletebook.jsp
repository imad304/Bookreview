<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>delete book</title>
</head>
<body>
<%@ page import="java.sql.*" %>


<%
int bid = Integer.parseInt(request.getParameter("id"));
try{
Connection con = null;
Statement st = null;
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore?user=;password=","root","");
PreparedStatement ps=con.prepareStatement("delete from  books_tbl where bookid=?");
ps.setInt(1,bid);
int i =ps.executeUpdate();
if(i>0)
{ %>
	<table align="center"><tr height="100"><td></td></tr>
    <tr><td align="center"><font color="blue" size="4">Book deleted successfully</font></td> <td>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href ="viewbooks1.jsp">Go back</a></tr>
    </table>
<%}else{%>
<table align="center"><tr height="100"><td></td></tr>
<tr><td align="center">Deletion failed try again</td>
<td>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href ="viewbooks1.jsp">Go back</a></tr>
</table>
<%}
}
catch(Exception e)
{
	e.printStackTrace();
}
%>

</body>
</html>