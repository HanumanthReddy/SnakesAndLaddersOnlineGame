<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link REL="stylesheet" TYPE="text/css" HREF="forgotpasswordpage.css">
        <link REL="shortcut icon" HREF="icon.png">
        <title>Snakes & Ladders Online Game</title>
    </head>
    
    
    <body>
        
<br>
<h1 id="mainhead">Welcome to Snakes & Ladders Online Game<br><br></h1>




<div id="links" class="no_und"><br>
<a href="http://localhost:8084/Snakes_Ladders/instructions.jsp">Instructions</a><br><br>
<a href="http://localhost:8084/Snakes_Ladders/registration.jsp">Registration</a><br><br>
<a href="http://localhost:8084/Snakes_Ladders/createnewgame.jsp">Create New Game</a><br><br>
<a href="http://localhost:8084/Snakes_Ladders/joinexistinggame.jsp">Join Existing Game</a><br><br>
<a href="http://localhost:8084/Snakes_Ladders/contactus.jsp">Contact us</a><br><br><br><br>
</div>

    
    

<div id="middle">

    <h2 id="p1">Password Recovery</h2>
    <form name="form">
	<table align="center"> 

            <tr> 
                <td align="left"> User Name *: </td>         
                <td align ="right"> <input name="username" type="text"></td>
                </tr>
 
            <tr>
                <td align="left">Secret Question *:</td>
                <td align ="left">
                    <select name="question">
                        <option value="Select a Question">Select any one...</option>
                        <option value="Who is your Best Friend ?">Who is your Best Friend ?</option>
                        <option value="Which is your Favorite Dish ?">Which is your Favorite Dish ?</option>
                        <option value="Who is your Inspiration ?">Who is your Inspiration ?</option>
                        <option value="What's your Wife Name ?">What's your Wife Name ?</option>
                    </select>
                </td>       
                </tr>    
    
            <tr> 
                <td align="left"> Answer *:</td>
                <td align ="right"><input name="answer" type="text"></td>
                </tr>    
        
            <tr> 
                <td align="right"> <button type=submit>Submit</button></td>
                </tr>

    </table>
</form>
    <p>Note: Please make sure your details are correct and fields marked with * are necessary.</p>
	    
    
        </div>
        
        
    </body>
</html>
