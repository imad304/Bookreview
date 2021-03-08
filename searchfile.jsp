<%@page import="java.sql.* " %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>Search form</TITLE>
<META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<META content="Microsoft FrontPage 4.0" name=GENERATOR>
<script language="javascript">
/* function formvalidate(){	
	if(document.fform.S1.value==""){
		alert("Enter your feedback");
		return (false);
	}else{
		document.fform.action="feedback.jsp";
		document.fform.submit(); 
		
	}
} */
</script> 
</HEAD>
<BODY text=#000000  leftMargin=0 topMargin=0>
  <jsp:include page="header.jsp"></jsp:include>

  <form name="fform" method="post" action="resultofsearch.jsp">

      <TABLE cellSpacing=0 cellPadding=0 width="784" border=0>
        <TBODY>
        <TR>
          <TD vAlign=top width=1 
    bgColor=#ffffff>&nbsp;</TD>
          <TD vAlign=top width=767 
    bgColor=#ffffff>&nbsp;
            <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <b><font color="#6699CC"> SEARCH BY BOOKS OR PUBLISHERS&nbsp; 
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </font></b></p>
            <p><b><font color="#6699CC">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           </font></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br><br><br>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <label><font color="#669fff"> Search by Publisher : </font> </label> 
   
   <%  try{
	
Class.forName("com.mysql.jdbc.Driver");

Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore?user=;password=","root","");

PreparedStatement pstmt,pst;

pstmt=con.prepareStatement("select * from books_tbl");
pstmt.execute();
ResultSet rs=pstmt.getResultSet();
String str=""; %>
     <select name="pubnme"> 
         <option>Select</option>
<%
while(rs.next())
{
	
	 str= rs.getString("publishername");
 %>
            
              <option value="<%= str %>"><%= str %></option> 
       
 <% 
}

%>
</select> 

 &nbsp;&nbsp;&nbsp;<label><font color="#669fff"> OR </font> </label> &nbsp;&nbsp;&nbsp;&nbsp;
  <label><font color="#669fff"> Search by Book Name : </font> </label> <select name="bknme"> 
              <option>Select</option>
<%
/* pst=con.prepareStatement("select bookname from books_tbl where publishername=?");
pst.setString(1,str);
pstmt.execute();
ResultSet rs1=pst.getResultSet();
*/ 
pst=con.prepareStatement("select * from books_tbl");
pst.execute();
ResultSet rs1=pst.getResultSet();
String str1=""; 
while(rs1.next())
{
	
	 str1= rs1.getString("bookname");
 %>
           
              <option value="<%= str1 %>"><%= str1 %></option>
       
 <% 
}
%>
</select> 
<%
   }
catch(Exception e)
{
	e.printStackTrace();
}
 
 %>
  <br><br><br><br><br>
            <p></p>
            <p></p>
            <p></p>
            <p></p></p>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <input type="submit" name="submit" tabindex="2" value=" Search">&nbsp;&nbsp;&nbsp;
            <input type="reset" value="Clear" name="B2" tabindex="3"></TD></TR>
            <p></p>
            <p></p>
            <tr></tr>
            <tr></tr>
        </TBODY></TABLE></TD></TR>      
      <br><br><br>
        </form>
     
        </BODY>
        
        <jsp:include page="footer.jsp"></jsp:include>
        
        </HTML>
