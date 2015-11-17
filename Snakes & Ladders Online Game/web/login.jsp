<%-- 
    Document   : loginsuccess
    Created on : 20 Feb, 2015, 11:23:06 AM
    Author     : hanumanthreddy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<link REL="stylesheet" TYPE="text/css" HREF="login.css">
<link REL="shortcut icon" HREF="icon.png">
<title>Snakes & Ladders Online Game</title>
<body>
<br>
<h1 id="mainhead">Welcome to Snakes & Ladders Online Game<br><br></h1>




<div id="links" class="no_und">
    <a href="http://localhost:8084/Snakes_Ladders/createnewgame.jsp">Create New Game</a><br><br>
    <a href="http://localhost:8084/Snakes_Ladders/joinexistinggame.jsp">Join Existing Game</a><br><br>
    <a href="http://localhost:8084/Snakes_Ladders/instructions.jsp">Instructions</a><br><br>
    <a href="http://localhost:8084/Snakes_Ladders/contactus.jsp">Contact us</a><br><br><br><br>
</div>

    
    

<div id="middle">
    
    <h2 id="h2">Snakes & Ladders Login</h2>
    <p id="p1">Please login to play your game.<br></p><br>

	<form action="Login_Handler">
            <div align="center">
            <p> Username *:  <input type="text" name="username"/> </p>
            <p> Password *:  <input type="password" name="password"/></p>
            <p> <input type="checkbox" name="Remember Password" value="ON" />Remember Password</p>
            <p> <input type="submit" value="Login" name="login" />&nbsp;&nbsp;&nbsp;
                <input type="submit" value="Clear" name="clear" /></p>
            <p> <a href="http://localhost:8084/Snakes_Ladders/forgotpasswordpage.html">Forgot Password ?</a></p>
            </div>
        </form>

</div>
    


<br><br><br>

</body>
</html>
