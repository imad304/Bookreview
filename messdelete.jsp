<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>Untitled Document</TITLE>
<META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<META content="Microsoft FrontPage 4.0" name=GENERATOR></HEAD>
<BODY text=#000000  leftMargin=0 topMargin=0>

<%@ page import="java.sql.*" %>


<%
Connection con = null;
Statement st = null;
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore?user=;password=","root","");

try{%>
<%!
	ResultSet rs=null;
%>
<%! String msgid;
String[] msgids; 
    %>
<% System.out.println("welcome");%>
<% msgid=request.getParameter("selected");
   if(msgid.contains(",")){
	    msgids=msgid.split(",");
	   
   }
   System.out.println("message issssssss"+msgid);
  PreparedStatement ps=con.prepareStatement("delete from feedback where f_code=?");
                   for(int j=0;j<msgids.length;j++) {   
                       ps.setInt(1,Integer.parseInt(msgids[j]));
                       ps.addBatch();
                   }
                       int k[]=ps.executeBatch();
    if(k.length==msgids.length){%>
     <table align="center"><tr height="100"><td></td></tr>
      <tr><td align="center"><font color="blue" size="4">Feed Back Messages were deleted successfully</font></td> <td>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href ="viewfeedback.jsp">Go back</a></tr>
      </table>
<%}else{%>
 <table align="center"><tr height="100"><td></td></tr>
<tr><td align="center">Deletion failed try again</td>
<td>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href ="viewfeedback.jsp">Go back</a></tr>
  </table> 
<%}%>
<%}catch(Exception e){
	e.printStackTrace();
}%>
</body>
</html>