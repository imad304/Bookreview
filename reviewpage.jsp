<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Book Store page</title>
<meta name="keywords" content="Book Store Template, Free CSS Template, CSS Website Layout, CSS, HTML" />
<meta name="description" content="Book Store Template, Free CSS Template, Download CSS Website" />
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
function showData(){ 
xmlHttp=GetXmlHttpObject()
    var url="ajax1.jsp";
xmlHttp.onreadystatechange=stateChanged
xmlHttp.open("GET",url,true)
xmlHttp.send(null)
}
function stateChanged(){ 
if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){ 
     document.getElementById("tab").innerHTML=xmlHttp.responseText;   
    } 
}
function GetXmlHttpObject(){
var xmlHttp=null;
try{
  xmlHttp=new XMLHttpRequest();
 }
catch(e){
 try{
  xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
  }
 catch(e){
  xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
 }
return xmlHttp;
}
</script>
</head>
<body onload="showData();">

<jsp:include page="header.jsp"></jsp:include>
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

 if(request.getParameter("id")!=null){
String cid=request.getParameter("id"); 
 ResultSet rs=null;
 try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore?user=;password=","root","");
        PreparedStatement pstmt=con.prepareStatement("select * from books_tbl where bookid=?");
        pstmt.setInt(1,Integer.parseInt(cid));
        pstmt.execute();
        rs =pstmt.getResultSet();
    }catch(Exception e){
        e.printStackTrace();
        }
 while(rs.next()){

    String bname=rs.getString("bookname");
    String aname=rs.getString("authorname");
    String pric=rs.getString("price");
    String image=rs.getString("imagename");
    String pubnam=rs.getString("publishername");
    String desc = rs.getString("description");
    float currate = rs.getFloat("avgratng");
     // System.out.println(image);
    
%>

<h1><%=bname %>  <span> (by <%=aname %>)</span></h1>
           <div>   <img width="150" height="180" src="bookimages/<%=image%>/<%=image%>" alt="image"> </div>
        
            <ul>
            <li><h2>Published by <%=pubnam %>.</li>
	            <li>Price <%=pric %></li>
            </ul>
            
            <p>Description about the book  </p>
             <p> <%= desc %></p>
        </h2>
    
    	<div class="cleaner_with_height">&nbsp;</div>
    </div> <!-- end of content -->
 
 <%} }  %>
</div>
  <div> 
  
  </div>
<jsp:include page="footer.jsp"></jsp:include>
</html>    
    