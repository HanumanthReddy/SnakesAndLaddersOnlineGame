<%-- 
    Document   : check
    Created on : 27 Feb, 2015, 3:00:36 PM
    Author     : hanumanthreddy
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

        
                <%
                    String sn=request.getParameter("ver");
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/snakes_ladders","root","hanu1048@");
                    
                    String sql_count = "SELECT * FROM registration WHERE username = '"+sn+"' ;";
                    PreparedStatement pst0 =  conn.prepareStatement(sql_count);             
                    ResultSet rs = pst0.executeQuery(sql_count);
                   
                  
                    if(rs.next())
                    {    
                        out.println("<font color=red>");
                        out.println("Name is Already Registered");
                        out.println("</font>");
 
                    }
                    else{
 
                        out.println("<font color=green>");
                        out.println("Name is Available to Register");
                        out.println("</font>");
 
                    }
 
                    rs.close();

 
                %>
   