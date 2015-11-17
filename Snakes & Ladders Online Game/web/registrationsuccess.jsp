<%-- 
    Document   : registrationsuccess
    Created on : 25 Feb, 2015, 9:53:49 AM
    Author     : hanumanthreddy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link REL="stylesheet" TYPE="text/css" HREF="registrationsuccess.css">
        <link REL="shortcut icon" HREF="icon.png">
        <title>Snakes & Ladders Online Game</title>
    </head>
    <body>
      <br>
<h1 id="mainhead">Welcome to Snakes & Ladders Online Game<br><br></h1>




<div id="links" class="no_und">
    <a href="http://localhost:8084/Snakes_Ladders/login.jsp">Login</a><br><br>
    <a href="http://localhost:8084/Snakes_Ladders/createnewgame.jsp">Create New Game</a><br><br>
    <a href="http://localhost:8084/Snakes_Ladders/joinexistinggame.jsp">Join Existing Game</a><br><br>
    <a href="http://localhost:8084/Snakes_Ladders/instructions.jsp">Instructions</a><br><br>
    <a href="http://localhost:8084/Snakes_Ladders/contactus.jsp">Contact us</a><br><br><br><br>
</div>


<div id="middle">

    <%String username=request.getParameter("username");%>

<h2 id="h2">Welcome <%=username %></h2>
    <p>You have successfully Registered.<br><br></p>
    
    <h3>Please Login to continue your Session.</h3>

</div>  
    </body>
</html>
