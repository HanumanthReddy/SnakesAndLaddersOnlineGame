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
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author hanumanthreddy
 */
public class Login_Handler extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        
        response.setContentType("text/html;charset=UTF-8");
        
        try (PrintWriter out = response.getWriter())
        {
            String username, password;
            username=request.getParameter("username");
            password = request.getParameter("password");
            out.println(username);
            int flag=0;
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/snakes_ladders","root","hanu1048@"))
                {
                    String query="select username,password from registration where username='"+username+"'and password='"+password+"'";
                    PreparedStatement ps = conn.prepareStatement(query);
                    ResultSet rs = ps.executeQuery();
                    
                    while(rs.next())
                    {
                        String name = rs.getString("username");
                        String pass = rs.getString("password");
                        
                        if(username.equals(name) && password.equals(pass))
                        {
                            flag=1;
                            HttpSession session = request.getSession();
                            session.setAttribute("username", username);
                            session.setMaxInactiveInterval(1*60);
                            Cookie userName = new Cookie("username", username);
                            userName.setMaxAge(30*60);
                            response.addCookie(userName);
                            response.sendRedirect("loginsuccess.jsp");
                        }
                    }
                }
            }
            catch (ClassNotFoundException ex) {
                Logger.getLogger(Login_Handler.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            if(flag==0)
            {
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.jsp");
                out.println("<h1><font color=red>Invalid Username or Password.</font></h1>");
                rd.include(request, response);
            }

            out.println("<!DOCTYPE html>");
            out.println("<html><head><body>");
            out.println("<title>Login Handler</title>");            
            out.println("</head></body></html>");
            
        }
        catch (SQLException ex) {
            Logger.getLogger(Login_Handler.class.getName()).log(Level.SEVERE, null, ex);
        
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Login_Handler.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
            
        } catch (SQLException ex) {
            Logger.getLogger(Login_Handler.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}