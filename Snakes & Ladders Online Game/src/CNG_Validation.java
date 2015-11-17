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

/**
 *
 * @author hanumanthreddy
 */
public class CNG_Validation extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     * @throws java.lang.ClassNotFoundException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        
        int flag=0,flag2=0;
        int current_position=0,previous_position=0,rolled_position=0;
        String username=request.getParameter("username");
        String boardname=request.getParameter("boardname");
        String password=request.getParameter("password");
        String diecolor=request.getParameter("diecolor");
        String maxplayers=request.getParameter("maxplayers");
        
        
        Cookie ck=new Cookie("boardname",boardname);
        response.addCookie(ck);
        
        
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/snakes_ladders","root","hanu1048@")) {
                String query="select username from registration where username='"+username+"'";
                PreparedStatement ps = conn.prepareStatement(query);
                ResultSet rs = ps.executeQuery();
                
                while(rs.next())
                {
                    String name = rs.getString("username");
                    if(username.equals(name))
                    {
                        flag=1;
                    }
                }
            }
        }
        
        catch (ClassNotFoundException ex)
        {
            Logger.getLogger(CNG_Validation.class.getName()).log(Level.SEVERE, null, ex);
        }
        
            
        if(flag==0)
        {
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/createnewgame.jsp");
            out.println("<h1><font color=red>Username does not Exists.</font></h1>");
            rd.include(request, response);
        }
        else
        {
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/snakes_ladders","root","hanu1048@")) {
                    PreparedStatement ps = conn.prepareStatement("select boardname from game_details");
                    ResultSet rs = ps.executeQuery();
                    
                    while(rs.next())
                    {
                        String bname = rs.getString("boardname");
                        if(boardname.equals(bname))
                        {
                            flag2=1;
                        }
                    }
                }
            }
            catch (ClassNotFoundException ex)
            {
                Logger.getLogger(CNG_Validation.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            
            if(flag2==1)
            {
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/createnewgame.jsp");
                out.println("<h1><font color=red>Boardname Already Exists.</font></h1>");
                rd.include(request, response);
            }
            else
            {
                try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/snakes_ladders","root","hanu1048@")) {
                        PreparedStatement ps = conn.prepareStatement("insert into game_details values('"+username+"','"+boardname+"','"+maxplayers+"','"+password+"','"+diecolor+"')");
                        PreparedStatement ps2 = conn.prepareStatement("insert into player_details values('"+username+"','"+boardname+"','"+diecolor+"','"+current_position+"','"+previous_position+"','"+rolled_position+"')");
                        ps.executeUpdate();
                        ps2.executeUpdate();
                        response.sendRedirect("waitingpage.jsp");
                    }
                }
                catch (ClassNotFoundException ex)
                {
                    Logger.getLogger(CNG_Validation.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
            

            out.println("<!DOCTYPE html>");
            out.println("<html><head><body>");
            out.println("<title>CNG - Validation</title>");            
            out.println("</head></body></html>");
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
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(CNG_Validation.class.getName()).log(Level.SEVERE, null, ex);
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
            
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(CNG_Validation.class.getName()).log(Level.SEVERE, null, ex);
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