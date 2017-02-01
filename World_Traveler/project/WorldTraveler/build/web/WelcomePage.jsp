<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="MainCSS/Login.css">

    </head>
    <body>
       <h1>World Traveler </h1>
        <div class="login">
            <form method="post" action="LoginPage.jsp">
                <h3>${sessionScope['error']}</h3>
                <div class="form-group ">
                    <div class="username">
                        <input type="text" class="form-control" placeholder="Username" name = "Username" required>
                        <i class="fa fa-user"></i>
                    </div>
                    <div class="password">
                        <div class="log-status">
                            <input type="password" class="form-control" placeholder="Password" name = "Password" required>
                            <i class="fa fa-lock"></i>
                        </div>
                    </div>
                </div>
                    <div class="centreButtons">
                        <button type="submit" class="log-btn" name="login" value="database">Log in</button>
                        <a class="sign-btn" href="SignUpPage.jsp" name="login"  >Sign Up</a>
                        <!--<button class="sign-btn" name="login" value="signup" >Sign Up</button>-->
                    </div>

                    <!--<a class="link" href="ForgotPage.jsp">Lost your password?</a>-->
                    <div class="apiButtons">
                        <button type="submit" name="login" value="uth" class="uth">
                            <img border="0" alt="UTH" src="photos/icons/UTH.jpg" width="200" height="55">
                        </button>
<!--
                        <button type="submit" name="login" value="google"  class="google">
                            <img border="0" alt="UTH" src="photos/icons/google.jpg" width="30" height="30">
                        </button>

                        <button type="submit" name="login" value="twitter" class="twitter">
                            <img border="0" alt="UTH" src="photos/icons/twitter.png" width="30" height="30">
                        </button>

                        <button type="submit" name="login" value="facebook" class="facebook">
                            <img border="0" alt="UTH" src="photos/icons/facebook.png" width="30" height="30">-->
                        </button>
                    </div>  
                </div>
            </form>
        </div>
    </body>
</html>

