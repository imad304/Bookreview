<%@page import="java.sql.* " %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>FeedBack form</TITLE>
<META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<META content="Microsoft FrontPage 4.0" name=GENERATOR>
<script language="javascript">
function formvalidate(){	
	if(document.fform.S1.value==""){
		alert("Enter your feedback");
		return (false);
	}else{
		document.fform.action="feedback.jsp";
		document.fform.submit(); 
		
	}
}
</script> 
</HEAD>
<BODY text=#000000  leftMargin=0 topMargin=0>
  <jsp:include page="header.jsp"></jsp:include>

  <form name="fform" method="post" onSubmit="javascript:formvalidate(this)">

      <TABLE cellSpacing=0 cellPadding=0 width="784" border=0>
        <TBODY>
        <TR>
          <TD vAlign=top width=1 
    bgColor=#ffffff>&nbsp;</TD>
          <TD vAlign=top width=767 
    bgColor=#ffffff>&nbsp;
            <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <b><font color="#6699CC"> Feed Back Form&nbsp; for
            Users&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </font></b></p>
            <p><b><font color="#6699CC">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            TO..&nbsp;&nbsp;Book Publisher</font></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            
            <select name="pubnme"> 
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
            <p></p>
            <p></p>
            <p></p>
            <p></p></p>
            <p>
            <textarea rows="4" name="S1" cols="51"  tabindex="1"></textarea></p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="submit" name="submit" tabindex="2" value=" Send ">&nbsp;&nbsp;&nbsp;
            <input type="reset" value="Clear" name="B2" tabindex="3"></TD></TR>
            <tr></tr>
            <tr></tr>
        </TBODY></TABLE></TD></TR>      
      
        </form>
     
        </BODY>
        
        <jsp:include page="footer.jsp"></jsp:include>
        
        </HTML>
