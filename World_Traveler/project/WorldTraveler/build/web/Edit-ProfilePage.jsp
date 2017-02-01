<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="MainCSS/EditProfile.css">
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
        
         <form method="post" action="Edit-Profile.jsp" onsubmit="return check();">
            <div class="register">
                
                <h2>Edit Profile</h2>

                <h3>${sessionScope['error']}</h3>
<!--                <div class="form-group ">
                    <input type="text" class="form-control" placeholder="Username" name = "Username" required>
                    <i class="fa fa-user"></i>
                </div>-->
               
                <div class="form-group">
                    <input type="text" class="form-control" placeholder=${sessionScope['email']} name = "email">
                    <i class="fa fa-user"></i>
                </div>
                
                <div class="form-group ">
                    <input type="text" class="form-control" placeholder=${sessionScope['phone']}  name = "Phone" >
                    
                    <i class="fa fa-user"></i>
                </div>
                <div class="form-group ">
                    <input type="password" class="form-control" placeholder="Previous Password" name = "PreviousPassword" required>

                    <i class="fa fa-user"></i>
                </div>
                <div class="form-group ">
                    <input type="password" class="form-control" placeholder="Password" name = "Password" required>
                    
                    <i class="fa fa-user"></i>
                </div>
                <div class="form-group ">
                    <input type="password" class="form-control" placeholder="Please confirm your password" name = "PasswordCheck" required>
                    
                    <i class="fa fa-user"></i>
                </div>
                <button type="submit" class="sign-btn" >Submit</button>
                
            </div>
            <div id="error"></div>
        </form>     
    
    
     

    </body>
</html>

