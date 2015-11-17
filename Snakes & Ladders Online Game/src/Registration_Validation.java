/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hanumanthreddy
 */
@WebServlet(urlPatterns = {"/Registration_Validation"})
public class Registration_Validation extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws java.sql.SQLException
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, SQLException, IOException {
        
        
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String firstname,lastname,username,dateofbirth,gender,email,
                    alternateemail,password,address,secretquestion,answerofsecretquestion;
            
            firstname=request.getParameter("firstname");
            lastname=request.getParameter("lastname");
            username=request.getParameter("username");
            dateofbirth=request.getParameter("dateofbirth");
            gender=request.getParameter("gender");
            email=request.getParameter("email");
            alternateemail=request.getParameter("alternateemail");
            password=request.getParameter("password");
            address=request.getParameter("address");
            secretquestion=request.getParameter("question");
            answerofsecretquestion=request.getParameter("answerofsecretquestion");
            int i=0;
            ResultSet rs=null;
            
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/snakes_ladders","root","hanu1048@")) {
                    
                    PreparedStatement ps2=conn.prepareStatement("insert into registration(firstname,lastname,username,dateofbirth,"
                            + "gender,email,alternateemail,password,address,secretquestion,answerofsecretquestion)"
                            + "values('"+firstname+"','"+lastname+"','"+username+"','"+dateofbirth+"','"+gender+"','"+email+"','"+alternateemail+"','"+password+"','"+address+"','"+secretquestion+"','"+answerofsecretquestion+"')");
                        i=ps2.executeUpdate();
                }
            }
            
            catch (ClassNotFoundException ex) {
                Logger.getLogger(Registration_Validation.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            if(i==0 && (rs!=null))
            {
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/registration.jsp");
                out.println("<h1><font color=red>Invalid Details.</font></h1>");
                rd.include(request, response);
            }
            else if(i==1)
            {
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/registrationsuccess.jsp");
                rd.forward(request, response);
            }
            
            out.println("<!DOCTYPE html>");
            out.println("<html><head><body>");
            out.println("<title>Registration Handler</title>");            
            out.println("</head></body></html>");
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try { processRequest(request, response); }
        catch (SQLException ex) { Logger.getLogger(Registration_Validation.class.getName()).log(Level.SEVERE, null, ex); }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Registration_Validation.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}