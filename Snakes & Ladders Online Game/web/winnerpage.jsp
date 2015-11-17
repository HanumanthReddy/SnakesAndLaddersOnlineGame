<%-- 
    Document   : winnerpage
    Created on : 21 Feb, 2015, 11:46:32 AM
    Author     : hanumanthreddy
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Refresh" content="5;url=index.jsp">
        <link REL="stylesheet" TYPE="text/css" HREF="winnerpage.css">
        <link REL="shortcut icon" HREF="icon.png">
        <title>Snakes & Ladders Online Game - Winner</title>
    </head>
    <body id="image">
        
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
            
            String user="";
            int current_position=0,previous_position=0,rolled_position=0;
            Class.forName("com.mysql.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/snakes_ladders","root","hanu1048@")) {
                
                String query="select * from player_details where game_name='"+boardname+"'" ;
                PreparedStatement ps =  conn.prepareStatement(query);
                ResultSet rs=ps.executeQuery();
                while(rs.next())
                {
                    user=rs.getString("player_name");
                    String query2="delete from player_details where game_name = '"+boardname+"'" ;
                    PreparedStatement ps2 =  conn.prepareStatement(query2);
                    ps2.executeUpdate();
                }
                query="delete from game_details where boardname = '"+boardname+"'" ;
                ps =  conn.prepareStatement(query);
                ps.executeUpdate();
                conn.close();
            }
        %>
        
        <h1 id="h1">Congratulations......!! <%=user%></h1>
        <p id="p1">You are the Winner.</p>
        
    </body>
</html>
