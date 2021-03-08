<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home Page</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<%
 String utpe = session.getAttribute("utype").toString();


 if(utpe.equalsIgnoreCase("admin"))
 {

if(request.getAttribute("reg")!=null){
    %>
    <font color="green"> <b>Publisher Registration Successful! </b></font> <br><br>
<%}%>

<h2>
 <%session.getAttribute("user").toString();%>
<br> <br>
<a href="Publisher_Register.jsp"> <h2>Add Publisher Details</h2> </a>
<a href="viewpublisherdetails.jsp"> <h2>View Publisher Details</h2> </a>
<a href="viewuserdetails.jsp"> <h2>View Users</h2> </a>
<a href="view_book_admin.jsp"> <h2>View books</h2> </a>
<!-- <a href="Reports_view.html"> <h2>View Reports</h2> </a> -->
</h2>
<% } 
 
 if(utpe.equalsIgnoreCase("publisher"))
 { 
	 if(request.getAttribute("buy")!=null){
		    %>
		   <font color="green"> <b>Book Uploaded Successfully.</b></font><br><br>
		    
		<%}
	 
	 %>
	<h2>	
	
<br> <br>
	
	<a href="Add_book_Review.jsp"> <h2>Upload new book </h2> </a>
            <!-- <a href="#"> <h2>Delete book review</h2> </a> -->
            <a href="viewbooks1.jsp?usr=<%=session.getAttribute("user").toString() %>"> <h2>View books</h2> </a>
            <a href="viewfeedback.jsp"> <h2>View Feedback</h2> </a>
	</h2>	
 <% } 
 if(utpe.equalsIgnoreCase("user"))
 { 
	/*  if(request.getAttribute("reg")!=null){ */
		 //   %>
		  <!--  <font color="green"> <b>Supplier Registration Successful! You can login now</b></font><br><br>
		   -->  
		<%//} 
		
	 %> 
	
		<h2>
<br> <br><br><br>
 
 <div id="templatemo_content"> 
  <div id="templatemo_content_left">
        
        	<div class="templatemo_content_left_section">
            <h1>Categories</h1>	
             <h3> <b>  <ul>
                    <li><a href="view_books.jsp?id=1">Computer and Internet</a></li>
                    <li><a href="view_books.jsp?id=2">Management</a></li>
                    <li><a href="view_books.jsp?id=3">Science and Technology</a></li>
                    <li><a href="view_books.jsp?id=4">Entrance Exams</a></li>
                    <li><a href="view_books.jsp?id=5">Science & Technology</a></li>
               
            	</ul> </b> </h3>
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
  while(rs.next())
  {
     int id = rs.getInt("bookid");
     String bname=rs.getString("bookname");
     String aname=rs.getString("authorname");
     String pric=rs.getString("price");
     String image=rs.getString("imagename");
     String pubnam=rs.getString("publishername");
     float currate = rs.getFloat("avgratng");
     String r1 = rs.getString("review1");
     String r2 = rs.getString("review2");
     String r3 = rs.getString("review3");
     // System.out.println(image);
    
%>
<div class="templatemo_product_box">
            	<h1><%=bname %>  <span>(by <%=aname %>)</span></h1>
   	      <img width="99" height="150" src="bookimages/<%=image%>/<%=image%>" alt="image">
                <div class="product_info">
                	<h2>Published by <%=pubnam %>.</h2>
                	<h2 i style="color: pink">Reviews</h2>
                	<h2 i style="color: white">Review 1: <%=r1 %></h2>
                	<h2 i style="color: white">Review 2: <%=r2 %></h2>
                	<h2 i style="color: white">Review 3: <%=r3 %></h2>
                  <h2 i style="color: cyan">Price : Rs <%=pric %>/-</h2>
                  <h2 i style="color: orange;">Current Rating <%=currate %></h2>
                  <a href="giverating.jsp?id=<%= id%>">Give Rating</a> </br>
                  <a href="feedback2.jsp?id=<%= id%>">Give Feedback</a></br>
                   
                </div>
                <div class="cleaner">&nbsp;</div>
            </div>
 <% }  %>
</div>
  <div> 
  
  </div>
		</h2>
 <% }  
%>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>