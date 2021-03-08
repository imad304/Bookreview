<%-- 
    Document   : userReg
    Author     : santhosh
--%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*" %>  
<%@page import="javax.mail.*"%>    
<%@page import="javax.mail.internet.*"%> 
<%@page import="java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <%
       
        String fnam=request.getParameter("fname");
        String lnam=request.getParameter("lname");
        String unam=request.getParameter("uname");
        String gender=request.getParameter("sex");
        String addr=request.getParameter("address");
        String phno=request.getParameter("phoneno");
        String email=request.getParameter("email");
        String password=request.getParameter("pass1");
        
        
        try{
        	
        Class.forName("com.mysql.jdbc.Driver");
        
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore?user=;password=","root","");
       
        PreparedStatement pstmt;
       
        pstmt=con.prepareStatement("insert into publisherreg(Fname,Lname,Uname,password,gender,address,email,phoneno) values(?,?,?,?,?,?,?,?)");
        
        pstmt.setString(1,fnam);
        pstmt.setString(2,lnam);
        pstmt.setString(3,unam);
        pstmt.setString(4,password);
        pstmt.setString(5,gender);
        pstmt.setString(6,addr);
        pstmt.setString(7,email);
        pstmt.setString(8,phno);
          
        
        int i=pstmt.executeUpdate();
        
        if(i>0)
            {
            request.setAttribute("reg", "success");
            
            String SMTP_HOST_NAME = "smtp.gmail.com";
        	  String SMTP_PORT = "465";
        	  String emailMsgTxt = "Test Message Contents";
        	   String emailSubjectTxt = "A test from gmail";
        	   String emailFromAddress = "santhoshkondapaka@gmail.com"; 
        	   String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
        	  // String   to=email;
        	   boolean debug = true;
        	   Properties props = new Properties();
        	   props.put("mail.smtp.host", SMTP_HOST_NAME);
        	   props.put("mail.smtp.auth", "true");
        	   props.put("mail.debug", "true");
        	   props.put("mail.smtp.port", SMTP_PORT);
        	   props.put("mail.smtp.socketFactory.port", SMTP_PORT);
        	   props.put("mail.smtp.socketFactory.class", SSL_FACTORY);
        	   props.put("mail.smtp.socketFactory.fallback", "false");

        	   javax.mail.Session session1 = javax.mail.Session.getDefaultInstance(props,new javax.mail.Authenticator() {

        	   protected PasswordAuthentication getPasswordAuthentication() {
        	   return new PasswordAuthentication("v.rameshreddi@gmail.com", "r@me$hredd!");
        	   }
        	   });

        	   session1.setDebug(debug);

        	   Message msg = new MimeMessage(session1);
        	   InternetAddress addressFrom = new InternetAddress(emailFromAddress); 
        	   msg.setFrom(addressFrom);

        	   InternetAddress addressTo =new InternetAddress(email);
        	   msg.setRecipient(Message.RecipientType.TO, addressTo);

        	   // Setting the Subject and Content Type
        	   msg.setSubject("Message From Online Book Review Management");
        	   msg.setContent("Congratulations! Your loginId : " + unam +" and Your Login password : " +password , "text/plain");
        	   Transport.send(msg);


        	    System.out.println("Message Send.....");
           
        %>     
         	  <jsp:forward page="homepage.jsp"></jsp:forward>
          <%
          	  }
        else
        {
            %>     
       	  <jsp:forward page="Publisher_Register.jsp"></jsp:forward>
        <%
        }
        	
            }catch(Exception e){
        	     out.println("Error :Connection Unavailable!"+ e.getMessage()  );
            }
    %> 
    
</html>
