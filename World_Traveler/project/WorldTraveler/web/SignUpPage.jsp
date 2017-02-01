<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="services.Register"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link rel="stylesheet" type="text/css" href="MainCSS/SignUp.css">

    </head>
    <body>
        
        <h1> World Traveler</h1>
        <form method="post" action="SignUp.jsp" onsubmit="return check();">
            <div class="register">
                
                <h2>Sign up</h2>

                <h3>${sessionScope['error']}</h3>
                <div class="form-group ">
                    <input type="text" class="form-control" placeholder="Username" name = "Username" required>
                    <i class="fa fa-user"></i>
                </div>
               
                <div class="form-group log-status">
                    <input type="text" class="form-control" placeholder="email" name = "email" required>
                    <i class="fa fa-lock"></i>
                </div>
                <div class="form-group ">
                    <input type="text" class="form-control" placeholder="Name(optional)" name = "Name" >
                    
                    <i class="fa fa-user"></i>
                </div>
                <div class="form-group ">
                    <input type="text" class="form-control" placeholder="Lastname(optional)" name = "Lastname" >
                    
                    <i class="fa fa-user"></i>
                </div>
                <div class="form-group ">
                    <input type="text" class="form-control" placeholder="Phone(optional)" name = "Phone" >
                    
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
                <button type="submit" class="sign-btn" >Sign up</button>
                
            </div>
            <div id="error"></div>
        </form>
    </body>
</html>

