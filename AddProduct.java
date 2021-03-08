

import java.io.IOException;

import java.io.PrintWriter;
import java.io.File;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.org.apache.xerces.internal.xs.PSVIProvider;



import javazoom.upload.*;
//import javazoom.upload.parsing.CosUploadFile;
import java.util.*;
import java.sql.*;

import javax.mail.*;
import javax.mail.internet.*;

public class AddProduct extends HttpServlet {
   
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
    
        try {

        MultipartFormDataRequest mrequest=null;
        String Categ="";
        String filetoUpload="";
        String filetype="";
        String bname="";
        String price="";
        String aname="";
        String publishername="";
        String description="";
        String review1="";
        String review2="";
        String review3="";
        String email="";
        /*String  cid="";
        String mrp="";*/
        UploadBean upBean=new UploadBean();
        if (MultipartFormDataRequest.isMultipartFormData(request)){
            System.out.println("multipart request");
						mrequest = new MultipartFormDataRequest(request);
						Hashtable files = mrequest.getFiles();
                        filetype=mrequest.getParameter("imagefile");
                        filetoUpload=mrequest.getParameter("fname");

                        // upBean.setFolderstore(getServletConfig().getServletContext().getRealPath("/cartimages/"));
                       // upBean.setFolderstore("/shoppingcart/WebContent/cartimages/");
                       
 
                        File ftu=new File(filetoUpload);    
                        String fileName=ftu.getName();
                        System.out.println(fileName+"******************************");
                        String appPath = getServletConfig().getServletContext().getRealPath("");
                		// constructs path of the directory to save uploaded file
                		String savePath = appPath + File.separator ;
                		System.out.println(appPath);
                		// creates the save directory if it does not exists
                		//File fileSaveDir = new File(savePath);
                		/*if (!fileSaveDir.exists()) {
                			fileSaveDir.mkdir();
                		}*/
                		
                		/*for (Part part : request.getParts()) {
                			String fileName = extractFileName(part);
                			part.write(savePath + File.separator + fileName);
                		}*/
                        upBean.setFolderstore(savePath+ "bookimages\\"+fileName);
                        System.out.println("**********9999999999999999"+savePath+fileName);
                        upBean.store(mrequest,"imagefile");
                        
                        System.out.println("777777777777success");
                        Categ=mrequest.getParameter("Category");
                        bname=mrequest.getParameter("bname");
                        price=mrequest.getParameter("price");
                        aname=mrequest.getParameter("aname");
                        publishername=mrequest.getParameter("pname");
                        description=mrequest.getParameter("discrip");
                        review1=mrequest.getParameter("review1");
                        review2=mrequest.getParameter("review2");
                        review3=mrequest.getParameter("review3");
                        /*cid=mrequest.getParameter("id");
                        mrp=mrequest.getParameter("mrp");*/
                       
                        System.out.println("bname"+bname);
                        System.out.println("aname"+aname);
                        System.out.println("fileName"+fileName);
                        System.out.println("price"+price);
                        System.out.println("publishername"+publishername);
                        System.out.println("description"+description);
                        System.out.println("Categ"+Categ);
                        System.out.println("review1"+review1);
                        System.out.println("review2"+review2);
                        System.out.println("review3"+review3);
                        

            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore","root","");
            System.out.println("*******************************SUCCESSFULL");
            ResultSet rs=null;
            /*ResultSet rs=null;
            Statement st=con.createStatement();
            rs=st.executeQuery("select * from categories");*/
            PreparedStatement pst=con.prepareStatement("insert into books_tbl(bookname,authorname,imagename,price,publishername,description,Category,review1,review2,review3) values(?,?,?,?,?,?,?,?,?,?)");
            System.out.println("*********************"+pst);
           // System.out.println("&&&&&&&&&&&&&&&&&&&&&"+pname+cid);
            
            pst.setString(1,bname);
            pst.setString(2,aname);
            pst.setString(3,fileName);
            pst.setString(4,price);
            pst.setString(5,publishername);
            pst.setString(6,description);
            pst.setString(7,Categ);
            pst.setString(8, review1);
            pst.setString(9, review2);
            pst.setString(10, review3);
            int i=pst.executeUpdate();
            if(i>0)
            {
            	
            	PreparedStatement ps = con.prepareStatement("select * from userreg where utype ='user'");
            	ResultSet rs1 = ps.executeQuery();
            	while(rs1.next())
            	{
            		email = rs1.getString("email");


                    request.setAttribute("reg", "success");
                    
                    String SMTP_HOST_NAME = "smtp.gmail.com";
                	  String SMTP_PORT = "465";
                	  String emailMsgTxt = "Test Message Contents";
                	   String emailSubjectTxt = "A test from gmail";
                	   String emailFromAddress = "santhoshkondapaka@gmail.com"; 
                	   String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
                	  // String   to=email;
                	   boolean debug = true;
                	   Properties props = new Properties();
                	   props.put("mail.smtp.host", SMTP_HOST_NAME);
                	   props.put("mail.smtp.auth", "true");
                	   props.put("mail.debug", "true");
                	   props.put("mail.smtp.port", SMTP_PORT);
                	   props.put("mail.smtp.socketFactory.port", SMTP_PORT);
                	   props.put("mail.smtp.socketFactory.class", SSL_FACTORY);
                	   props.put("mail.smtp.socketFactory.fallback", "false");

                	   javax.mail.Session session1 = javax.mail.Session.getDefaultInstance(props,new javax.mail.Authenticator() {

                	   protected PasswordAuthentication getPasswordAuthentication() {
                	   return new PasswordAuthentication("v.rameshreddi@gmail.com", "r@me$hredd!");
                	   }
                	   });

                	   session1.setDebug(debug);

                	   Message msg = new MimeMessage(session1);
                	   InternetAddress addressFrom = new InternetAddress(emailFromAddress); 
                	   msg.setFrom(addressFrom);

                	   InternetAddress addressTo =new InternetAddress(email);
                	   msg.setRecipient(Message.RecipientType.TO, addressTo);

                	   // Setting the Subject and Content Type
                	   msg.setSubject("Message From Online Book Review Management");
                	   msg.setContent("New Book Added! Book Name: " +bname+" and Publisher Name: " +publishername , "text/plain");
                	   Transport.send(msg);


                	    System.out.println("Message Send.....");
                   
                  	  
                   
            		
            	}	
            	
            	
            	
            getServletConfig().getServletContext().getRequestDispatcher("/homepage.jsp").forward(request, response);
            }
        }
        } catch(Exception e){
            e.printStackTrace();
            out.close();
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
