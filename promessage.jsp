<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>Untitled Document</TITLE>
<META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<META content="Microsoft FrontPage 4.0" name=GENERATOR><base>
<script language="javascript">
function getValues(){
	var values="";
	for(var i=0;i<document.selectform.c1.length;i++){
		if(document.selectform.c1[i].checked==true){
		values+=document.selectform.c1[i].value;
		values+=",";			
		}
		
	}
	if(values==""){
	alert("Select Message to Delete");
	return 0;	
	}else{
	document.selectform.selected.value=values;
	document.selectform.method="post";
	document.selectform.action="messdelete.jsp";
	document.selectform.submit();
     }
}
</script>
</HEAD>
<BODY text=#000000  leftMargin=0 topMargin=0>

<%@ page session="true"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%  	
Connection con = null;
Statement st = null;
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore?user=;password=","root","");
st=con.createStatement();
	ResultSet rs=null;
    ArrayList feedback=new ArrayList();
    Map fback=new HashMap();
%>

<% try
	{
 	rs=st.executeQuery("select * from feedback"); 	
%> 
<form name="selectform">

<TABLE cellSpacing=0 cellPadding=0  border=0 align="center"> 
  <TR>
    <TD height=2 colspan=4></TD></TR>
  <TR>
    <TD vAlign=top height=161 colspan="4">
      
     <p align="center">
      
     &nbsp;
      
     <p align="center">
      
     <b><i><font color="#BE7DFF" size="4">Feed Back From Users</font></i></b>
      
     <p align="center">
      
     &nbsp;
<table border="1" cellpadding="1" cellspacing="1" >  
<tr>
<td width="80" height="55"><b><p align="center">Feedback Code</p></b></td>
<td width="200" height="55"><b><p align="center">Message</p></b></td>
<td width="100" height="55"><b><p align="center">Seeker Code</p></b></td>
<td width="100" height="55"><b><p align="center">Check It for delete</p></b></td>
</tr>
    	
       
    <%	while(rs.next())
	{  fback=new HashMap();
    	fback.put("f_code",rs.getInt(1));
    	fback.put("message",rs.getString(2));
    	fback.put("usrname",rs.getString(3));
    	feedback.add(fback);
	}for(int i=0;i<feedback.size();i++){
    		fback=(HashMap)feedback.get(i);
    %> 
    
 	   <tr>	
           <td width="80" height="55"><p align="center">  
	   <%=fback.get("f_code")%></p>
	  </td>
	  <td width="200" height="55">  
	   <%=fback.get("message")%>
	  </td>
	  <td width="100" height="55"><p align="center">  
	   <%=fback.get("usrname")%></p>
	  </td>
	  <td width="100" height="55" align="center">
      <input type="checkbox" name="c1" value="<%=fback.get("f_code")%>">
	   </td>		
	  </tr> 
      <%}%> 
 </table>
</TD></TR>
 <tr height="20"><td></td></tr>
 <tr>
     <td align="center">
   
     </td>
     <td></td>
    <td align="right">

     <input name="submitbutton" type="submit" value="  Delete  " style="color: #000000" onClick="javascript:getValues()">
     </td>
     <td align="right">
     <input type="reset" name="Submit2" value="Reset" tabindex="4">&nbsp;&nbsp;
    </td>
   </tr>  
</TABLE>
<input type="hidden" name="selected">
</form>
 
<%}
catch(Exception e)
{
 System.out.println("error"+e);
}%>
</BODY></HTML>

