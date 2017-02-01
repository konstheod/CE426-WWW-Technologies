<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="MainCSS/Route.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
    </head>
    <body>
         
        <ul class="topnav" id="myTopnav">
            <li><a href="Sign-Out.jsp">Sign Out</a></li>
            <li><a href="Edit-Profile.jsp">Edit Profile</a></li>
            <li><a href="HistoryScript.jsp">History</a></li>
            <li><a href="MainPage.jsp">Home</a></li>
               
            <li class="icon">
                <a href="javascript:void(0);" onclick="myFunction()">&#9776;</a>
            </li>
        </ul>
        
        <h2>Route</h2>
        <h3>${sessionScope['error']}</h3>

        <div class="tableBox">
            ${sessionScope['route']}
        </div>
    </body>
</html>

