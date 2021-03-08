<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="java.sql.*"%>
   <%@ page session="true"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
   

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
 </div> <!-- end of content left -->
<div id="templatemo_content_right">
<%

int idd = Integer.parseInt(request.getParameter("id"));
session.setAttribute("bid", idd);
 ResultSet rs=null;
 try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore?user=;password=","root","");
        PreparedStatement pstmt=con.prepareStatement("select * from books_tbl where bookid=?");
        pstmt.setInt(1,idd);
        pstmt.execute();
        rs =pstmt.getResultSet();
    }catch(Exception e){
        e.printStackTrace();
        } 
        %>
        
  <form name="rateform" action="feedback.jsp">
 <table width="50%">
  <% if(rs.next()){
	 
     String bname=rs.getString("bookname");
     String aname=rs.getString("authorname");
     String pric=rs.getString("price");
     String image=rs.getString("imagename");
     String pubnam=rs.getString("publishername");
     int count=rs.getInt("count");
     float avgrtng=rs.getFloat("avgratng");
     // System.out.println(image);
    session.setAttribute("bookname", bname);
    session.setAttribute("publishername", pubnam);
%>
  
  <tr width="40%">
                <td><img  width="180" height="190" src="bookimages/<%=image%>/<%=image%>"></td>
               <td> <b> Book Name: &nbsp;</b>
                <b><%=bname%></b><br>  

                <b>Author name : &nbsp;</b> <b><%=aname%></b><br>
                 <b>price: &nbsp;</b><b><%=pric%></b><br>
                 <b>Publisher Name: &nbsp;</b><b><%=pubnam%></b><br>
                 <b>Current Rating: &nbsp;</b><b><%=avgrtng%></b> <br></br>
                 
                  <!-- <label>Give Rating:</label> <select name="rate"> 
        <option value="select">Select</option>
        <option value=1>1</option>
        <option value=2>2</option>
        <option value=3>3</option>
        <option value=4>4</option>
        <option value=5>5</option>
        </select>  -->
        
        <b>Description : &nbsp;</b><textarea rows="5" cols="15" name="desc"></textarea> <br>
        <br></br><br></br>
         <input type="submit" name="rating" value="submit"/> 
                </td>
            </tr>
                       	
                <div class="cleaner">&nbsp;</div>
            </div>
 <% }  %>
 </table>
</div>
  <div> 
  
  </div>
  </form>
<jsp:include page="footer.jsp"></jsp:include>
</html> 