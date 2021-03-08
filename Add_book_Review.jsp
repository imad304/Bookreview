<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>upload book page</title>
<meta name="keywords" content="Book Store Template, Free CSS Template, CSS Website Layout, CSS, HTML" />
<meta name="description" content="Book Store Template, Free CSS Template, Download CSS Website" />
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript">

function addProduct(){
    if(document.pform.bname.value=="" || document.pform.price.value=="" || document.pform.aname.value=="" || document.pform.imagefile.value=="")
        {
            alert("Enter details properly");
            return false;
        }else{
            document.pform.fname.value=document.pform.imagefile.value;
            document.pform.action="addProduct";
            document.pform.submit();
            return true;
        }
}
</script>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>
<div id="templatemo_content"><!-- end of content left -->
  
<div class="middle">
<br>
<form name="pform" method="post" onsubmit="return addProduct()"  enctype="multipart/form-data">

    <table width="100%">
        <tr><td colspan="2"><h2>Add Book Review</h2></td></tr>
        <tr>
       <td> <label>Category</label> </td> <td> <select name="Category"> 
        <option>Select</option>
        <option value="1">Computer and Internet</option>
        <option value="2">Management</option>
        <option value="3">Science and Technology</option>
        <option value="4">Entrance Exam</option>
        <option value="5">Academic and Professional</option>
        </td>
        </tr>
        
        <tr>
            <td width="14%">Publisher Name</td> <td width="86%"><input style="width:250px" type="text" name="pname"></td>
        </tr>
        <tr>
            <td>Book Image</td> <td><input style="width:250px" type="file" name="imagefile"></td>
        </tr>
        <tr>
            <td>Book Name</td>
			
            <td><input style="width:250px" type="text" name="bname"></td>

    	</tr>
        
        <tr>
          <td>Author Name</td><td><input type="text" name="aname" style="width:250px"></td></tr>
        <tr>
          <td>Price</td><td><input type="text" name="price" style="width:250px"></td></tr>
          
          <tr>
          <td>Description :</td><td>
          <textarea rows="3" cols="30" name="discrip"></textarea></td></tr>
          
          <tr>
          <td>Review1 :</td><td>
          <textarea rows="3" cols="30" name="review1"></textarea></td></tr>
                  
          <tr>
          <td>Review2 :</td><td>
          <textarea rows="3" cols="30" name="review2"></textarea></td></tr>
          
          <tr>
          <td>Review3 :</td><td>
          <textarea rows="3" cols="30" name="review3"></textarea></td></tr>
          
       <tr><td colspan="2"><input colspan="2" type="submit" value="INSERT"></td></tr>

    </table>
<input type="hidden" name="fname">
</form>

</div>

<jsp:include page="footer.jsp"></jsp:include>
</html> 