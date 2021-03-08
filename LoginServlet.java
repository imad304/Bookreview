

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// TODO Auto-generated method stub
		System.out.println("helllllllllllllllllll");
    // Important :: creating session
  HttpSession session=request.getSession();
  response.setContentType("text/html");
  PrintWriter out = response.getWriter();
  //get the variables entered in the form
  String utype = request.getParameter("user");  
  String funame = request.getParameter("un");
  String fpwd = request.getParameter("pwd");
//  System.out.println(funame+" "+fpwd);
  int uid=-1;
   // String type="";
 PreparedStatement pstmt=null;
   try{
  Class.forName("com.mysql.jdbc.Driver");
  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore","root","");
  if(utype.equals("publisher"))
  {
    pstmt=con.prepareStatement("select * from publisherreg where Uname=? and password=?");
  }
  else
  {
	  System.out.println(utype+funame+fpwd);
    pstmt=con.prepareStatement("select * from userreg where uuname=? and upass1=? and utype=?");
    pstmt.setString(3, utype);
  }
   pstmt.setString(1,funame);
   pstmt.setString(2, fpwd);
   pstmt.execute();
   ResultSet rs=pstmt.getResultSet();
  if(rs.next())
  {
  uid=rs.getInt("uid");
  /* type=rs.getInt("type"); */
  session.setAttribute("user", funame);
  session.setAttribute("uid", uid);
  session.setAttribute("utype",utype);
 // System.out.println("((((((((((((((^^^^^^^^^^^))))))))))))))"+contct);
  
  /*if(utype.equals("publisher"))
  {
	  response.sendRedirect("Publisher_home.html");
  }
  
  else if(utype.equals("user"))
  {
	  response.sendRedirect("User_home.html");
  }
  
  else
  {
	  response.sendRedirect("Admin_home.html");
  }*/
  
  response.sendRedirect("homepage.jsp");
 
  }
  else
  {
      request.setAttribute("loginfail", "yes"); 
      response.sendRedirect("index.html");
     
  }

  }
   catch(Exception e)
   	  {
      e.printStackTrace();
      }
	}
}
