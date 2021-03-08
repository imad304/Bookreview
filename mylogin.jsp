<%-- 
    Document   : userLogin
    Author     : Santhosh
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>

   <%   
        String utype=request.getParameter("user");
        String uname=request.getParameter("uname");
        String password=request.getParameter("password");
        int uid=-1;
        String contct;
       // String type="";
       PreparedStatement pstmt=null;
         try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore","root","");
        if(utype.equals("publisher"))
        {
          pstmt=con.prepareStatement("select * from publisherreg where uname=? and password=?");
        }
        else
        {
          pstmt=con.prepareStatement("select * from userreg where uname=? and password=? and utype=?");
          pstmt.setString(3, utype);
        }
         pstmt.setString(1,uname);
         pstmt.setString(2, password);
         
         pstmt.execute();
         ResultSet rs=pstmt.getResultSet();
        if(rs.next()){
        uid=rs.getInt("uid");
        contct=rs.getString("contact");
        /* type=rs.getInt("type"); */
        session.setAttribute("user", uname);
        session.setAttribute("uid", uid);
        session.setAttribute("utype",utype);
       // System.out.println("((((((((((((((^^^^^^^^^^^))))))))))))))"+contct);
        session.setAttribute("phon", contct);
        %>
        <jsp:forward page="index.jsp"></jsp:forward>
        <%
              }else{
            request.setAttribute("loginfail", "yes"); %>
            <jsp:forward page="index.jsp"></jsp:forward>
           <% }

        }catch(Exception e){
            e.printStackTrace();
            }
        %>
</html>
