<%@page import="java.sql.* " %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>FeedBack form</TITLE>
<META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<META content="Microsoft FrontPage 4.0" name=GENERATOR>
<title>Result of search</title>
</head>
<BODY text=#000000  leftMargin=0 topMargin=0>
  <jsp:include page="header.jsp"></jsp:include>
<%
Connection con = null;
Statement st = null;
PreparedStatement pstmt=null;
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore?user=;password=","root","");
 String pubnm = request.getParameter("pubnme");
String bknm = request.getParameter("bknme");
System.out.println(pubnm+bknm);
if(pubnm.equalsIgnoreCase("select"))
{
	if(bknm.equalsIgnoreCase("select"))
	{
		
	}
	else
	{
		pstmt=con.prepareStatement("select * from books_tbl where bookname =?");
		pstmt.setString(1,bknm);
		pstmt.execute();
		ResultSet rs=pstmt.getResultSet();
	%>	
		<form name="searchform">

		<TABLE cellSpacing=0 cellPadding=0  border=0 align="center"> 
		  <TR>
		    <TD height=2 colspan=4></TD></TR>
		  <TR>
		    <TD vAlign=top height=161 colspan="4">
		      
		     <p align="center">
		      
		     &nbsp;
		      
		     <p align="center">
		      
		     <b><i><font color="#BE7DFF" size="4">Search Results</font></i></b>
		      
		     <p align="center">
		      
		     &nbsp;
		<table border="1" cellpadding="1" cellspacing="1" >  
		<tr>
		<td width="80" height="55"><b><p align="center">bookid</p></b></td>
		<td width="200" height="55"><b><p align="center">bookname</p></b></td>
		<td width="100" height="55"><b><p align="center">authorname</p></b></td>
		<td width="100" height="55"><b><p align="center">publishername</p></b></td>
		<td width="100" height="55"><b><p align="center">price</p></b></td>
		<td width="100" height="55"><b><p align="center">avgratng</p></b></td>
		</tr>
		    	
		       
		    <% 
		    
		    while(rs.next())
			{
	          int bid = rs.getInt("bookid");
	          String bnme = rs.getString("bookname");  
	          String anme = rs.getString("authorname");  
	          String pnme = rs.getString("publishername");  
	          String pris = rs.getString("price");  
	          String avgr = rs.getString("avgratng");  
	          %>
	          <h2><tr align="center"><td><%=bid %></td><td><%=bnme %></td><td><%= anme%></td><td><%=pnme %></td>
	          <td><%=pris %></td><td><%=avgr %></td></tr></h2>
	          <tr></tr><tr></tr><tr></tr>
	          <% }
	}
		    %>
</table>
<br> <br> <br>
  <%	}
 
else
{
	
	pstmt=con.prepareStatement("select * from books_tbl where publishername=?");
	pstmt.setString(1,pubnm);
	pstmt.execute();
	ResultSet rs=pstmt.getResultSet();
%>	
	<form name="searchform">

	<TABLE cellSpacing=0 cellPadding=0  border=0 align="center"> 
	  <TR>
	    <TD height=2 colspan=4></TD></TR>
	  <TR>
	    <TD vAlign=top height=161 colspan="4">
	      
	     <p align="center">
	      
	     &nbsp;
	      
	     <p align="center">
	      
	     <b><i><font color="#BE7DFF" size="4">Search Results</font></i></b>
	      
	     <p align="center">
	      
	     &nbsp;
	<table border="1" cellpadding="1" cellspacing="1" >  
	<tr>
	<td width="80" height="55"><b><p align="center">bookid</p></b></td>
	<td width="200" height="55"><b><p align="center">bookname</p></b></td>
	<td width="100" height="55"><b><p align="center">authorname</p></b></td>
	<td width="100" height="55"><b><p align="center">publishername</p></b></td>
	<td width="100" height="55"><b><p align="center">price</p></b></td>
	<td width="100" height="55"><b><p align="center">avgratng</p></b></td>
	</tr>
	    	
	       
	    <% 
	    
	    while(rs.next())
		{
          int bid = rs.getInt("bookid");
          String bnme = rs.getString("bookname");  
          String anme = rs.getString("authorname");  
          String pnme = rs.getString("publishername");  
          String pris = rs.getString("price");  
          String avgr = rs.getString("avgratng");  
          %>
          <h2><tr align="center"><td><%=bid %></td><td><%=bnme %></td><td><%= anme%></td><td><%=pnme %></td>
          <td><%=pris %></td><td><%=avgr %></td></tr></h2>
          <tr></tr><tr></tr><tr></tr>
          <% }
}
	    %>
 </table>

<br> <br> <br>
<jsp:include page="footer.jsp"></jsp:include>
  
</body>
</html>