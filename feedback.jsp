
<%@ page import="java.sql.*"%>
<%@page session="true"%>
<% String utpe = session.getAttribute("user").toString();%>

<% 
String boknm = session.getAttribute("bookname").toString();
String pnme=session.getAttribute("publishername").toString();

Connection con = null;
Statement st = null;
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore?user=;password=","root","");
st=con.createStatement();

//int sn2=slogid.intValue();
//System.out.println("snew1"+sn2);
%>
<%!
%>
<%
ResultSet rs=null;
PreparedStatement ps=null;

st=con.createStatement();
String st1=request.getParameter("desc");
%>  
<%! int fcode;%> 
<% try
	{
	
	rs=st.executeQuery("select max(f_code) from feedback");
	if(rs.next())
	{	
		fcode=rs.getInt(1)+1;
		System.out.println("Max:"+fcode);
	}
	else
	{
	   	 fcode=1000;
	 	 System.out.println("Max:"+fcode);
	}


	ps=con.prepareStatement("insert into feedback values(?,?,?,?,?)");
	
	ps.setInt(1,fcode);
	ps.setString(2,st1);
	ps.setString(3,utpe);
	ps.setString(4,pnme);
	ps.setString(5,boknm);


	int i=ps.executeUpdate();
	
		if (i>0)
		{      %>       

		<TR>
          <TD vAlign=top width=771 
    bgColor=#ffffff>&nbsp;</TD></TR>
        <TR>
          <TD vAlign=top width=771 
    bgColor=#ffffff>
            <p align="center"><b>Ur Feed Back was sent ......</b>  <a href ="homepage.jsp">back</a>
          </TD></TR>
        <TR>
          <TD vAlign=top width=771 
    bgColor=#ffffff>&nbsp;
          </TD></TR>
        <TR>
          <TD vAlign=top width=771 
    bgColor=#ffffff>
            <p align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         </p>
          </TD></TR>
                          			
	
		<%}
		else
		{
			out.println("Sorry !...");
			
		}




}	
catch(Exception e)
{
 System.out.println("error"+e);
}
finally
{
	ps.close();
	rs.close();
	st.close();
	con.close();
}

%>