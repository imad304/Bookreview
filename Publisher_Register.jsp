<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Publisher Registration</title>
<meta name="keywords" content="Book Store Template, Free CSS Template, CSS Website Layout, CSS, HTML" />
<meta name="description" content="Book Store Template, Free CSS Template, Download CSS Website" />
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
<script type="text/javaScript" src="validate_form.js">
	</script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div id="templatemo_content"><!-- end of content left -->
  
<div class="middle">
<br>
<form name="fm" method="post" action="userReg.jsp" onsubmit="return validate_reg()">

    <table width="100%">
        <tr><td colspan="2"><h2>Publisher Registration Form:</h2></td></tr>
        
        <tr>
            <td width="14%">First Name</td> <td width="86%"><input style="width:250px" type="text" name="fname"></td>
        </tr>
        <tr>
            <td>Last Name</td> <td><input style="width:250px" type="text" name="lname"></td>
        </tr>
        <tr>
            <td>Gender: </td>
			
            <td> <input type="radio" name="sex" value="male">Male </input> &nbsp&nbsp
            <input type="radio" name="sex" value="female"> Female</input>
                  </td>

    	</tr>
        <tr>
            <td valign="top">Address</td><td><textarea name="address" cols="20" rows="5" style="width:250px"></textarea></td>
        </tr>
        
        <tr><td>Mobile No</td><td><input type="text" name="phoneno" style="width:250px"></td></tr>
        <tr><td>Email</td><td><input type="text" name="email" style="width:250px"></td></tr>
        <!-- <tr><td>Date of Birth</td><td><input type="text" name="date" style="width:250px"/></td></tr> -->
        <tr bgColor=#e4f3f9></tr>
       <tr>
            <td>User Name</td> <td><input type="text" name="uname" style="width:250px"></td> 
        </tr>
        <tr>
            <td>Password</td> <td><input type="password" name="pass1" style="width:250px"></td> 
        </tr>
        <tr>
            <td>Retype Password</td> <td><input type="password" name="pass2" style="width:250px"></td>
        </tr>
        <tr>
			
			</tr>
       <tr><td colspan="2"><input colspan="2" type="submit" value="Register"></td></tr>
       
       <tr><td colspan="2"><input colspan="2" type="reset" value="Reset"></td></tr>

    </table>

</form>

</div>
  <jsp:include page="footer.jsp"></jsp:include>
  
  </html> 