<!DOCTYPE html>


<html>
<link REL="stylesheet" TYPE="text/css" HREF="joinexistinggame.css">
<link REL="shortcut icon" HREF="icon.png">
<title>Snakes & Ladders Online Game</title>

    <script>
        
        function validation()
        {
            var username = document.form.username.value;
            if(username==="")
            {
                alert("Enter a valid user name...!!");
                document.form.username.focus();
                return false;
            }
            else if ((username.length > 15))
            {
                alert("UserName should have lessthan 15 Characters");
                document.form.username.select();
                return false;
            }
            
            
            var boardname = document.form.boardname.value;
            if(boardname==="")
            {
                alert("Enter a valid GameBoard name...!!");
                document.form.boardname.focus();
                return false;
            }
	    else if ((boardname.length > 15))
            {
                alert("BoardName should have lessthan 15 Characters");
                document.form.boardname.select();
                return false;
            }
            
            var password = document.form.password.value;
            if(password==="")
            {
                alert("Enter a valid Password...!!");
                document.form.password.focus();
                return false;
            }
            if (password.length > 10)
            {
                alert("Password should have lessthan 10 Characters");
                document.form.password.select();
                return false;
            }
        }
        
    </script>

<body>
    
    <%
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
    %>
    
    
<br>
<h1 id="mainhead">Welcome to Snakes & Ladders Online Game<br><br></h1>




<div id="links" class="no_und"><br>
<a href="http://localhost:8084/Snakes_Ladders/instructions.jsp">Instructions</a><br><br>
<a href="http://localhost:8084/Snakes_Ladders/registration.jsp">Registration</a><br><br>
<a href="http://localhost:8084/Snakes_Ladders/createnewgame.jsp">Create New Game</a><br><br>
<a href="http://localhost:8084/Snakes_Ladders/contactus.jsp">Contact us</a><br><br>
</div>

    
<div id="middle">

    <h2 id="p1">Join the Existing Game</h2>

    
	
	<form name="form" onsubmit="return validation();" action="JEG_Validation">
    
	<table align="center"> 
                
            <tr> 
                <td align="left"> User Name *:</td>         
                <td align ="right"> <input name="username" type="text"><br></td>
                </tr>
        
            <tr>        
                <td align="left"> Board Name *:  </td>
                <td align ="right"><input name="boardname" type="text"> </td>
                </tr>

            <tr>     
                <td align="left"> Password *: </td>
                <td align ="right"><input name="password" type="password"> </td>
                </tr>
                
            <tr>   
                <td align="left" id="reg"> Die Color *:</td>
                <td align="left" id="reg">  
                    <select name="diecolor">
                        <option value="blue">Blue</option>
                        <option value="red">Red</option>
                        <option value="green">Green</option>
                        <option value="yellow">Yellow</option>
                    </select>
                </td>
                </tr>
        
            <tr> 
                <td align="right"> <button type=submit>Submit</button></td>
                </tr>

    </table>
</form>
    <p>Note: Please make sure your details are correct and fields marked with * are necessary.</p>
	    
    
</div>

</body></html>
