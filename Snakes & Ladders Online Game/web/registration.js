	function validation()
        {
            var firstname = document.form.firstname.value;
            if(firstname=="")
            {
                alert("Enter a valid first name...!!");
                document.form.firstname.focus();
                return false;
            }
            else if ((firstname.length > 15))
            {
                alert("FirstName should have lessthan 15 Characters");
                document.form.firstname.select();
                return false;
            }
            
            var lastname = document.form.lastname.value;
            if(lastname==="")
            {
                alert("Enter a valid last name...!!");
                document.form.lastname.focus();
                return false;
            }
            else if ((lastname.length > 15))
            {
                alert("LastName should have lessthan 15 Characters");
                document.form.lastname.select();
                return false;
            }
            
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
            
            var dateofbirth=document.form.dateofbirth.value();
            if (dateofbirth=="")
            {
                alert("Select your date of birth");
                document.form.dateofbirth.select();
                return false;
            }
            
            var password = document.form.password.value;
            if(password==="")
            {
                alert("Enter a valid Password in first field...!!");
                document.form.password.focus();
                return false;
            }
            else if (password.length > 10)
            {
                alert("Password at field1 should have lessthan 10 Characters");
                document.form.password.select();
                return false;
            }
            
            var password2 = document.form.password2.value;
            if(password2==="")
            {
                alert("Enter a valid Password in second field...!!");
                document.form.password2.focus();
                return false;
            }
            else if (password2.length > 10)
            {
                alert("Password at field2 should have lessthan 10 Characters");
                document.form.password2.select();
                return false;
            }
            else if(!(password==password2))
            {
                alert("Same Password should be Entered at both fields...!!");
                document.form.password2.focus();
            }
            var gender=document.form.gender.value();
            if(gender=="true") { }
            else { alert("you must select your Gender"); document.form.gender.focus(); }
        }





function DrawCaptcha()
    {
        var a = Math.ceil(Math.random() * 10)+ '';
        var b = Math.ceil(Math.random() * 10)+ '';       
        var c = Math.ceil(Math.random() * 10)+ '';  
        var d = Math.ceil(Math.random() * 10)+ '';  
        var e = Math.ceil(Math.random() * 10)+ '';  
        var f = Math.ceil(Math.random() * 10)+ '';  
        var g = Math.ceil(Math.random() * 10)+ '';  
        var code = a + ' ' + b + ' ' + ' ' + c + ' ' + d + ' ' + e + ' '+ f + ' ' + g;
        document.getElementById("txtCaptcha").value = code
    }
 
    function ValidCaptcha(){
        var str1 = removeSpaces(document.getElementById('txtCaptcha').value);
        var str2 = removeSpaces(document.getElementById('txtInput').value);
        if (str1 === str2) return true;        
        return false;
        
    }

    function removeSpaces(string)
    {
        return string.split(' ').join('');
    }

    function loadXMLDoc()
    {
        var xmlhttp;
        var k=document.getElementById("username").value;
        var urls="check.jsp?ver="+k;
        xmlhttp=new XMLHttpRequest();
        xmlhttp.onreadystatechange=function()
        {
            if (xmlhttp.readyState===4)
                {
                    document.getElementById("err").innerHTML=xmlhttp.responseText;
                }
        };
        xmlhttp.open("GET",urls,true);
        xmlhttp.send();
    }