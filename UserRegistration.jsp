<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>user Registration page</title>
<meta name="keywords" content="Book Store Template, Free CSS Template, CSS Website Layout, CSS, HTML" />
<meta name="description" content="Book Store Template, Free CSS Template, Download CSS Website" />
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
<script type="text/javaScript" src="validate_form1.js">
	</script>
</head>
<body>
<!-- Free CSS Templates from www.templatemo.com -->
<div id="templatemo_container">
<div id="templatemo_menu">
<ul>
<li><a href="index.html" class="current">Home</a></li>
<!-- <li><a href="subpage.html">Search</a></li>
<li><a href="subpage.html">Books</a></li> 
<li><a href="subpage.html">New Releases</a></li>  -->
<li><a href="#">About us</a></li> 
<li><a href="#">Contact us</a></li>
</ul>
</div> <!-- end of menu -->

<div id="templatemo_header">
    	
    </div> <!-- end of header -->

<div id="templatemo_content"><!-- end of content left -->
  
<div class="middle">
<br>
<form name="fm" action="userReg_user.jsp" method="post"  onsubmit="return validate_reg()">

    <table width="100%">
        <tr><td colspan="2"><h2>Reader Registration Form:</h2></td></tr>
        
        <tr>
            <td width="14%">First Name</td> <td width="86%"><input style="width:250px" type="text" name="fname"></td>
        </tr>
        
        <tr>
            <td valign="top">Address</td><td><textarea name="address" cols="20" rows="5" style="width:250px"></textarea></td>
        </tr>
        
       <tr><td>Mobile No</td><td><input type="text" name="phoneno" style="width:250px"></td></tr>
        <tr><td>Email Id</td><td><input type="email" name="email" style="width:250px"></td></tr>
       <tr>
            <td>User Name</td> <td><input type="text" name="uname" style="width:250px"></td> 
        </tr>
        <tr>
            <td>Password</td> <td><input type="password" name="pass1" style="width:250px"></td> 
        </tr>
        <tr>
            <td>Retype Password</td> <td><input type="password" name="pass2" style="width:250px"></td>
        </tr>
        <%-- <tr>
            <td>Enter your Favourite Publisher</td> <td><select name="pubnme"> 
              <option>Select</option>
   
   <%  try{
	
Class.forName("com.mysql.jdbc.Driver");

Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore?user=;password=","root","");

PreparedStatement pstmt;

pstmt=con.prepareStatement("select Uname from publisherreg");
pstmt.execute();
ResultSet rs=pstmt.getResultSet();
String str="";
while(rs.next())
{
	
	 str= rs.getString("Uname");
 %>
           
              <option value="<%= str %>"><%= str %></option>
       
 <% 



}
   }
catch(Exception e)
{
	e.printStackTrace();
}
 
 %>
  </select>
  </td>     </tr> --%>
        <tr>
			
			</tr>
       <tr><td colspan="2"><input colspan="2" type="submit" value="Register"></td> </tr>
       
       <tr><td colspan="2"><input colspan="2" type="reset" value="Reset"></td></tr>

    </table>

</form>

</div>
  <div id="templatemo_footer">
    <br></br>
	       <a href="subpage.html">Home</a> | <a href="subpage.html">Search</a> | <a href="subpage.html">Books</a> | <a href="#">New Releases</a> | <a href="#">FAQs</a> | <a href="#">Contact Us</a><br />
        Copyright ? 2048 <a href="#"><strong>coign technologies</strong></a> | Website Template by Santhosh	</div> 
    
 
  </html> 