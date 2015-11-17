<%-- 
    Document   : waitingpage
    Created on : 20 Feb, 2015, 12:13:47 PM
    Author     : hanumanthreddy
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link REL="stylesheet" TYPE="text/css" HREF="waitingpage.css">
<link REL="shortcut icon" HREF="icon.png">
<meta http-equiv="Refresh" content="5;url=waitingpage.jsp">
    
<title>Snakes & Ladders Online Game - Game Board</title>
<body><br>
    
    
<h1 id="mainhead">Welcome to Snakes & Ladders Online Game<br><br></h1>
<div id="middle">
    <h2>Loading......!!</h2>
    <img src="please-wait-animation.gif" height="140" width="350">
    <h3 id="p1">Please wait until another player joined.</h3>
</div>
    
    <%
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
            response.sendRedirect("http://localhost:8084/Snakes_Ladders/login.jsp");
        }
        
        int count=0;
        
        String query="select count(player_name) from player_details where game_name='"+boardname+"'";
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/snakes_ladders","root","hanu1048@");
        PreparedStatement ps =  conn.prepareStatement(query);
        ResultSet rs = ps.executeQuery();
        
        while(rs.next())
        {
            count=rs.getInt("count(player_name)");
        }
        conn.close();
        
        if(count>=2)
        {
            response.sendRedirect("http://localhost:8084/Snakes_Ladders/gameboardpage.jsp");
        }
    %>
    
    
    
    
    
</body></html>