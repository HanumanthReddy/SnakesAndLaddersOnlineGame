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
public class Controller extends HttpServlet {

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
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String userName = null;
        Cookie[] cookies = request.getCookies();
        if(cookies !=null)
        {
            for(Cookie cookie : cookies)
            {
                if(cookie.getName().equals("username")) 
                    userName = cookie.getValue();
            }
        }
        if(userName == null) 
        {
            response.sendRedirect("login.jsp");
        }
        int count=0;
        String query="select count(player_name) from player_details";
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/snakes_ladders","root","hanu1048@");
        
        PreparedStatement ps =  conn.prepareStatement(query);
        ResultSet rs = ps.executeQuery();
        
        while(rs.next())
        {
            count=rs.getInt("count(player_name)");
        }
        
        
        if(count<=1)
        {
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/waitingpage.jsp");
            rd.forward(request, response);
        }
        
        else
        {
        
        
        
        int roll=(int) Math.floor((Math.random()*6) +1 );
        int previous_position=0,current_position=0;
        
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/snakes_ladders","root","hanu1048@");
        query="select current_position,previous_position from player_details where player_name='"+userName+"'";
        ps =  conn.prepareStatement(query);
        rs = ps.executeQuery();
        
        while(rs.next())
        {
            current_position = rs.getInt("current_position");
        }
        conn.close();
        previous_position=current_position;
        current_position=current_position+roll;
        
        if(current_position==18)
        {
            current_position=39;
        }
        else if(current_position==25)
        {
            current_position=47;
        }
        else if(current_position==51)
        {
            current_position=73;
        }
        else if(current_position==79)
        {
            current_position=83;
        }
        else if(current_position==29)
        {
            current_position=7;
        }
        else if(current_position==43)
        {
            current_position=16;
        }
        else if(current_position==87)
        {
            current_position=56;
        }
        
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/snakes_ladders","root","hanu1048@");
        String query2="update player_details set current_position = "+current_position+", previous_position = "+previous_position+" , rolled_position = "+roll+" where player_name = '"+userName+"'" ;
        ps =  conn.prepareStatement(query2);
        ps.executeUpdate();
        conn.close();
        
        
        String boardname="";
        Cookie ck[]=request.getCookies();
        if(ck!=null)
        {
            for(int x1=0;x1<ck.length;x1++)
            {
                if(ck[x1].getName().equals("boardname"))
                    boardname=ck[x1].getValue();
            }
        }
        
        int flag=0;
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/snakes_ladders","root","hanu1048@");
        query="select current_position from player_details where game_name='"+boardname+"'";
        ps =  conn.prepareStatement(query);
        rs = ps.executeQuery();
        
        while(rs.next())
        {
            current_position = rs.getInt("current_position");
            if(current_position>=100)
            {
                flag=1;
                break;
            }
            else
            {
                flag=0;
            }
        }
        conn.close();
        
        if(flag==1)
        {
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/winnerpage.jsp");
            rd.forward(request, response);
        }
        else
        {
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/gameboardpage.jsp");
            rd.forward(request, response);
        }
            
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
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
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
