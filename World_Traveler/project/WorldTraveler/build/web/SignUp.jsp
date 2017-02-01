<%@page import="services.Register" %>
<%
    session.removeAttribute("error");
    
    String Username = request.getParameter("Username");
    String Password = request.getParameter("Password");
    String PasswordCheck = request.getParameter("PasswordCheck");
    String email = request.getParameter("email");
    String Name = request.getParameter("Name");
    String Lastname = request.getParameter("Lastname");
    String Phone = request.getParameter("Phone");
    Register user = new Register(); 
    if(user.checkUsername(Username)){
        session = request.getSession(true);
        session.setAttribute("error", "This username already exists, please try again.");
        response.sendRedirect("SignUpPage.jsp");
    }
    else if(!user.isEmail(email)){
        session = request.getSession(true);
        session.setAttribute("error", "This is not a valid email, please try again.");
        response.sendRedirect("SignUpPage.jsp");
    }
    else if(!Password.equals(PasswordCheck)){
        session = request.getSession(true);
        session.setAttribute("error", "Wrong Password");
        response.sendRedirect("SignUpPage.jsp");
    }
    else if(!user.checkPassword(Password)){
        session = request.getSession(true);
        session.setAttribute("error", "Password must contain minimum 8 characters at least 1 Alphabet, 1 Number and 1 Special Character.");
        response.sendRedirect("SignUpPage.jsp");
    }
    else{
        session.setAttribute("Username",Username);
        session.setAttribute("Account","database");
        user.setUsername(Username);
        user.setPassword(Password);
        user.setEmail(email);
        user.setLastname(Lastname);
        user.setName(Name);
        user.setPhone(Phone);
        if(user.Registration()){
            response.sendRedirect("MainPage.jsp");
        } else{
            session = request.getSession(true);
            session.setAttribute("error", "An error occured. Please try again.");
            response.sendRedirect("SignUpPage.jsp");
        }
    }
%>
