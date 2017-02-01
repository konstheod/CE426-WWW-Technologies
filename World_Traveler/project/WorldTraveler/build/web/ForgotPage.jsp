<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link rel="stylesheet" type="text/css" href="MainCSS/Login.css">
    </head>
    <body>
        
        <h1> World Traveler </h1>
        <form method="post" action="ForgotPass.jsp">
            <div class="login">
                <h3>${sessionScope['error']}</h3>

                <h2>Recover your credentials</h2>
                <h4>Please enter your username in order to send you a redirect link to your email account!</h4>

                <div class="form-group log-status">
                    <input type="text" class="form-control" placeholder="Username" name = "Username" required>
                    <i class="fa fa-lock"></i>
                </div>
                <button type="submit" class="log-btn" >Submit</button>
            </div>
        </form>
    </body>
</html>
