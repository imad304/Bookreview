<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="header.jsp"></jsp:include>
<div id="templatemo_content">
    	
        <div id="templatemo_content_left">
        	<div class="templatemo_content_left_section">
            	<h1>Categories</h1>
                <ul>
                    <li><a href="index.html">Academic and Professional</a></li>
                    <li><a href="index.html">Biographies & Autobiographies</a></li>
                    <li><a href="Academic.jsp">Business, Investing and Management</a></li>
                    <li><a href="#">Computers & Internet</a></li>
                    <li><a href="#">Entrance Exams Preparation</a></li>
                    <li><a href="#">Science & Technology</a></li>
               
            	</ul>
            </div>
			
      
           </div>


<div id="templatemo_content_right">
<%

/* if(request.getParameter("cid")!=null){
String cid=request.getParameter("cid"); */
 ResultSet rs=null;
 try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore?user=;password=","root","");
        PreparedStatement pstmt=con.prepareStatement("select * from books_tbl");
       // pstmt.setInt(1,Integer.parseInt(cid));
        pstmt.execute();
        rs =pstmt.getResultSet();
    }catch(Exception e){
        e.printStackTrace();
        }
  while(rs.next()){


	  int id = rs.getInt("bookid");
     String bname=rs.getString("bookname");
     String aname=rs.getString("authorname");
     String pric=rs.getString("price");
     String image=rs.getString("imagename");
     String pubnam=rs.getString("publishername");
     // System.out.println(image);
    
%>
<div class="templatemo_product_box">
            	<h1><%=bname %>  <span>(by <%=aname %>)</span></h1>
   	      <img width="99" height="150" src="bookimages/<%=image%>/<%=image%>" alt="image">
                <div class="product_info">
                	<p> <h2>Published by <%=pubnam %>.</h2></p>
                  <h3>Rs <%=pric %></h3>
                    <!-- <div class="buy_now_button"><a href="subpage.html">Buy Now</a></div> -->
                    <div class="detail_button"><a href="giverating.jsp?id=<%= id%>">give rating</a></div>
                    <div class="detail_button"><a href="feedback2.jsp"<%= id%>">Give feedback</a></div>
                    <div class="detail_button"><a href="subpage.html"<%= id%>">Review</a></div>
                </div>
                <div class="cleaner">&nbsp;</div>
            </div>
 <% }  %>
</div>
  <div> 
  
  </div>
  <jsp:include page="footer.jsp"></jsp:include>





</html>