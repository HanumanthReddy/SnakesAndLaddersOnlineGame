<%-- 
    Document   : loginsuccess
    Created on : 20 Feb, 2015, 9:23:50 AM
    Author     : hanumanthreddy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link REL="stylesheet" TYPE="text/css" HREF="loginsuccess.css">
        <link REL="shortcut icon" HREF="icon.png">
        <title>Snakes & Ladders Online Game</title>
    </head>
    <body>
        <br>
<h1 id="mainhead">Welcome to Snakes & Ladders Online Game<br><br></h1>




<div id="links" class="no_und"><br>
    <a href="http://localhost:8084/Snakes_Ladders/createnewgame.jsp">Create New Game</a><br><br>
    <a href="http://localhost:8084/Snakes_Ladders/joinexistinggame.jsp">Join Existing Game</a><br><br>
    <a href="http://localhost:8084/Snakes_Ladders/instructions.jsp">Instructions</a><br><br>
    <a href="http://localhost:8084/Snakes_Ladders/contactus.jsp">Contact us</a><br><br><br><br>
</div>


<div id="middle">

    <%
    if(session.getAttribute("username") == null)
    {
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.jsp");
        out.println("<h1><font color=red>No user exists Login please.</font></h1>");
        rd.include(request, response);
    }
    String userName = null;
    String sessionID = null;
    Cookie[] cookies = request.getCookies();
    
    if(cookies !=null)
    {
        for(Cookie cookie : cookies)
        {
            if(cookie.getName().equals("username")) userName = cookie.getValue();
        }
    }
    %>

<h2 id="h2">Hi <%=userName %></h2>
    <p>You have Logged in successfully.<br><br></p>
    
    <h3>Let's please continue your Session.</h3>

</div>


    </body>
</html>
