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
        
        <link REL="stylesheet" TYPE="text/css" HREF="registration.css">
        <link REL="shortcut icon" HREF="icon.png">
        <script src="registration.js"></script>
        <title>Snakes & Ladders Online Game</title>
    </head>
    
    
    <body>
        
<br>
<h1 id="mainhead">Welcome to Snakes & Ladders Online Game<br><br></h1>




<div id="links" class="no_und"><br>
<a href="http://localhost:8084/Snakes_Ladders/login.jsp">Login</a><br><br>
<a href="http://localhost:8084/Snakes_Ladders/instructions.jsp">Instructions</a><br><br>
<a href="http://localhost:8084/Snakes_Ladders/createnewgame.jsp">Create New Game</a><br><br>
<a href="http://localhost:8084/Snakes_Ladders/joinexistinggame.jsp">Join Existing Game</a><br><br>
<a href="http://localhost:8084/Snakes_Ladders/contactus.jsp">Contact us</a><br><br><br><br>
<div><img src="registration.png" alt="Preview not Available" style="width:160px;height:165px"></div>
    
</div>

    
    

<div id="middle">

    <h2 id="p1">Registration</h2>
    <form name="form" onsubmit="return validation();" action="Registration_Validation">
	<table align="center"> 
                
            <tr>
                <td align="left">First Name *: </td>
                <td align="right"><input type="text" name="firstname"/></td>
                </tr>
        
            <tr>
                <td align="left">Last Name *: </td>
                <td align="right"><input type="text" name="lastname"/></td>
                </tr>
                
            <tr> 
                <td align="left"> User Name *: </td>         
                <td align ="right"> <input name="username" id="username" type="text" onkeyup="loadXMLDoc()" required onblur="checkUname()"></td>
                </tr>
            
            <tr>
                <td align ="left" id="reg"> Availability :  </td>
                <td align ="left"><span id="err"> </span> </td>
                </tr> 
                
            <tr> 
                <td align="left">Date of Birth *:</td>
                <td align="right"><input name="dateofbirth" type="date"> </td>
                </tr>
                
            <tr>
                <td align="left">Select Gender *:
                <td align="left">
                    <input name="gender" value="male" type="radio">Male
                    <input name="gender" value="female" type="radio">Female
                </td>
                </tr>
        
            <tr> 
                <td align="left">Email *: </td>
                <td align ="right"><input name="email" type="email"></td>
                </tr>
        
            <tr> 
                <td align="left"> Alternative Email *: </td>
                <td align ="right"><input name="alternateemail" type="email"/></td>
                </tr> 
        
            
    
            <tr>     
                <td align="left"> Password *: </td>
                <td align ="right"><input name="password" type="password"></td>
                </tr>
        
            <tr>     
                <td align="left"> Retype Password *: </td>
                <td align ="right"> <input name="password2" type="password"> </td>
                </tr>   
    
            <tr>        
                <td align="left"> Address *:</td>
                <td align ="right"><input name="address" type="text"> </td>
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
                <td align ="right"><input name="answerofsecretquestion" type="text"></td>
                </tr>    
        
	    <tr>
		<td><input type="text" id="txtCaptcha" style="background-image:url(1.jpg); text-align:center; border:none;font-weight:bold; font-family:Modern"/>
		<td><input type="button" id="btnrefresh" value="Refresh" onclick="DrawCaptcha();" /></td>
                </tr>

            <tr> <td><input type="text" id="txtInput"/> </td></tr>
	    <tr> <td><input id="Button1" type="button" value="Check" onclick="alert(ValidCaptcha());"/></td></tr>
            <tr> 
                <td align="right"> <button type=submit>Submit</button></td>
                </tr>

    </table>
</form>
    <p>Note: Please make sure your details are correct and fields marked with * are necessary.</p>
	    
    
        </div>
        
        
    </body>
</html>
