<%-- 
    Document   : signout
    Author     : Santhosh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>logout page</title>
</head>
<html>
    <SCRIPT LANGUAGE="javaScript">
history.go(1);
</SCRIPT>
    <%
response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
response.addHeader("Cache-Control", "post-check=0, pre-check=0");
response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);
%>
 

    <%
    session.invalidate();
    %>
    <jsp:forward page="index.html"></jsp:forward>
</html>
