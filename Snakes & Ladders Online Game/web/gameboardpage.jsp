<%-- 
    Document   : rolldie
    Created on : 20 Feb, 2015, 4:57:40 PM
    Author     : hanumanthreddy
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<html>
<link REL="stylesheet" TYPE="text/css" HREF="gameboardpage.css">
<link REL="shortcut icon" HREF="icon.png">
    
<title>Snakes & Ladders Online Game - Game Board</title>
<body>

<h1 id="mainhead">Welcome to Snakes & Ladders Online Game<br></h1>
<h3 id="h2">Your Game Board</h3><br>











<div id="img">
    <table class="table1">

    <%
        String boardname = null;
        Cookie ck[]=request.getCookies();
        if(ck!=null)
        {
            for(int x1=0;x1<ck.length;x1++)
            {
                if(ck[x1].getName().equals("boardname"))
                {
                    boardname=ck[x1].getValue();
                }
            }
        }
        
        String userName = null;
        Cookie[] cookies = request.getCookies();
        if(cookies !=null)
        {
            for(Cookie cookie : cookies)
            {
                if(cookie.getName().equals("username"))
                {
                    userName = cookie.getValue();
                }
            }
        }
            
        if(userName == null) 
        {
            response.sendRedirect("http://localhost:8084/Snakes_Ladders/login.jsp");
        }
        
        int current_position=0,random=0;
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/snakes_ladders","root","hanu1048@");
        String query="select player_name,player_colour,current_position,rolled_position from player_details where game_name='"+boardname+"'";
        PreparedStatement ps =  conn.prepareStatement(query);
        ResultSet rs = ps.executeQuery();
        
        ArrayList<String> name = new ArrayList<>();  
        ArrayList<String> colour = new ArrayList<>();  
        ArrayList<Integer> curpos = new ArrayList<>();
        ArrayList<Integer> rand = new ArrayList<>();
        
        while(rs.next())
        {
            curpos.add(rs.getInt("current_position"));
            rand.add(rs.getInt("rolled_position"));
            colour.add(rs.getString("player_colour"));
            name.add(rs.getString("player_name"));
        }
        conn.close();
        int cur=0;
        String color="";
        if(name.get(0).equals(userName))
        {
            color=colour.get(0)+".jpg";
            cur=(int)curpos.get(0);
        }
        if(name.get(1).equals(userName))
        {
            color=colour.get(1)+".jpg";
            cur=(int)curpos.get(1);
        }
        
        
        int pawn_position=cur;
        int row=pawn_position/10,col=pawn_position%10,x=0,y=0,i,j;
        
    
    for(i=0;i<=9;i++){ %>
         <tr>
   <% for(j=0;j<=9;j++) {
       
       if(i%2==0)  {  if(pawn_position==(100-((i*10)+j)) ){ %>
       <td> <img src=<%=color%> style="width:25px;height:30px;"> </td>
     <%  } else{  %>    
       <td>  </td> 
      <% } } else{ %>
     <%  x=9-i; y=j+1;if(pawn_position%10==0){ x=x+1;y=y%10;} if(x == row && y == col)
     {%>  <td> <img src=<%=color%> style="width:25px;height:30px;"> </td>  <% } else{ %> <td>  </td> <%}  }}%>
   </tr>
   <% } %></table>
   
</table>
</div>
<br><br><br>
    











<div id="score">
    <table class="table2"> 
            
        <TR id="p2">
                <TH>Player_Name</TH>
                <TH>Pawn_Color</TH>
                <TH>Current_Position</TH>
                <TH>Previous_Position</TH>
            </TR>
                
            <%
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/snakes_ladders","root","hanu1048@");
                String sql3 = "select * from player_details where game_name = '"+boardname+"'" ;
                PreparedStatement pst3 =  conn.prepareStatement(sql3);
                rs = pst3.executeQuery(sql3);
                    
            while(rs.next()){%>
            <TR> 
                <TD> <%= rs.getString(1) %></TD>
                <TD> <%= rs.getString(3) %></TD>
                <TD> <%= rs.getString(4) %></TD>
                <TD> <%= rs.getString(5) %></TD>
                
            </TR>
            <% } %>
            
            </table>
</div>

            
  
            
            
            
            
<div id="roll">
    <form action="Controller" name="rolldice" onsubmit="return rolldie()">
        <button  class="button" type=submit>Roll Dice</button>
    </form>

        <%
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/snakes_ladders","root","hanu1048@");
            query="select rolled_position from player_details where player_name='"+userName+"'";
            ps =  conn.prepareStatement(query);
            rs = ps.executeQuery();
        
            while(rs.next())
            {
                random=rs.getInt("rolled_position");
            }
            
            if(random==1)
            {%>
                <p id="p">Move your counter to next place by 1.</p>
                <img src="die1.gif" style="width:100px;height:80px;">
            <%}
            else if(random==2)
            {%>
                <p id="p">Move your counter to next place by 2.</p>
                <img src="die2.gif" style="width:100px;height:80px;">
            <%}
            else if(random==3)
            {%>
                <p id="p">Move your counter to next place by 3.</p>
                <img src="die3.gif" style="width:100px;height:80px;">
            <%}
            else if(random==4)
            {%>
                <p id="p">Move your counter to next place by 4.</p>
                <img src="die4.gif" style="width:100px;height:80px;">
            <%}
            else if(random==5)
            {%>
                <p id="p">Move your counter to next place by 5.</p>
                <img src="die5.gif" style="width:100px;height:80px;">
            <%}
            else if(random==6)
            {%>
                <p id="p">Move your counter to next place by 6.</p>
                <img src="die6.gif" style="width:100px;height:80px;">
            <%}%>
</div>
    





</body>
</html>
