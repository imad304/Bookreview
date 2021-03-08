<%-- 
    Document   : userReg
    Author     : santhosh
--%>
<%@page import="com.sun.mail.handlers.message_rfc822"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*" %>  
<%@page import="java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <%
       
        String ufname=request.getParameter("fname");
        String uuname=request.getParameter("uname");
        String upass1=request.getParameter("pass1");
        String uaddress=request.getParameter("address");
        String uphoneno=request.getParameter("phoneno");
        String email=request.getParameter("email");
        //String pubname= request.getParameter("pubnme");
      //System.out.println("...."+ufname+"...."+ulname+"...."+uuname+"...."+usex+"...."+uaddress+"...."+uphoneno+"...."+uemail+"...."+upass1+"....");
        try{
        	
        Class.forName("com.mysql.jdbc.Driver");
        
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore?user=;password=","root","");
       
        PreparedStatement pstmt;
       
        pstmt=con.prepareStatement("insert into userreg(ufname,uuname,upass1,uaddress,uphoneno,email) values(?,?,?,?,?,?)");
   
         
        pstmt.setString(1,ufname);
       
        pstmt.setString(2,uuname);
        pstmt.setString(3,upass1);
       
        pstmt.setString(4,uaddress);
        
        pstmt.setString(5,uphoneno);
        pstmt.setString(6,email);  
        
        int i=pstmt.executeUpdate();
        
        if(i>0)
            {
            request.setAttribute("reg", "success");
           
        %>     
         	  <jsp:forward page="index.html"></jsp:forward>
          <%
          	  }
            }catch(Exception e){
        	     out.println("Error :Connection Unavailable!"+ e.getMessage()  );
            }
    %> 

</html>
