<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<meta name="keywords" content="Book Store Template, Free CSS Template, CSS Website Layout, CSS, HTML" />
<meta name="description" content="Book Store Template, Free CSS Template, Download CSS Website" />
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />

</head>
<body>
<!--  Free CSS Templates from www.templatemo.com -->
<div id="templatemo_container">
	<div id="templatemo_menu">
    	<ul>
    	<%if(session.getAttribute("user")!=null){%>
<li><a href="homepage.jsp">Home</a></li>
<% } else {%>
<li><a href="index.html">Home</a></li>
<% } %>
<li><a href="aboutus.jsp">About us</a></li>
            <%if(session.getAttribute("user")!=null){%>
<li><a href="#">Welcome, <%=session.getAttribute("user")%></a></li>
<li><a href = "signout.jsp">logout</a></li>
<% } %>
<li><a href="contactus.jsp">Contact us</a></li>
    	</ul>
    </div> <!-- end of menu -->
    
    <div id="templatemo_header">
    	
    	
    	  
    </div> <!-- end of header -->
</body>
</html>