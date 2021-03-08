<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
int cnt = Integer.parseInt(session.getAttribute("cnt").toString());
Float avgrat = Float.parseFloat(session.getAttribute("agrtng").toString());
int crate = Integer.parseInt(session.getAttribute("rtng").toString());
int bokid = Integer.parseInt(session.getAttribute("bid").toString());
int gvnrtng = Integer.parseInt(request.getParameter("rate"));
cnt=cnt+1;
crate = crate+gvnrtng;
double finalrtng = crate/cnt;
 try{
	 
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore?user=;password=","root","");
        PreparedStatement pstmt=con.prepareStatement("update books_tbl set rating = ?, count=? , avgratng=? where bookid=?");
        pstmt.setInt(1,crate);
        pstmt.setInt(2,cnt);
        pstmt.setDouble(3, finalrtng);
        pstmt.setInt(4,bokid);
       int i = pstmt.executeUpdate();
       if(i>0)
       {
    	   %>
    	   <jsp:forward page="homepage.jsp"></jsp:forward>
    	   <%
       }
    }catch(Exception e){
        e.printStackTrace();
        } %>
</body>
</html>