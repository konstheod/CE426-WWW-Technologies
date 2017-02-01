<%@page import="services.*" %>

<%
    
    String username = request.getParameter("Username");
    String password = request.getParameter("Password");
    String type     = request.getParameter("login");
    
    session = request.getSession(true);
    session.removeAttribute("error");

    session.setAttribute("Account","foreign");
    if(type.equals("database")){
        LoginPage user = new LoginPage(); 
        
        if(username.equals("admin") && password.equals("admin")){
            response.sendRedirect("AdminPage.jsp");
        }else{

            user.setUserName(username);
            user.setPassword(password);
            if(user.checkUser()){
               session.setAttribute("Username",username);
               session.setAttribute("Account","database");
               response.sendRedirect("MainPage.jsp");
            }
            else{
                
                session.setAttribute("error", "Your username or password is incorrect.");
                response.sendRedirect("WelcomePage.jsp");
            }
        }
    }
    else if( type.equals("signup")){
       session.removeAttribute("error");
       response.sendRedirect("SignUpPage.jsp");
    }
    else if( type.equals("uth")){
        LoginUth user = new LoginUth(username, password); 
        if(user.auth()){
            session.setAttribute("Username",username);
            response.sendRedirect("MainPage.jsp");

        }else{
            session = request.getSession(false);
            session.setAttribute("error", "Your username or password is incorrect.");
            response.sendRedirect("WelcomePage.jsp");
        }                
    }
    else if( type.equals("google")){
        LoginGoogle user = new LoginGoogle(username, password);
        if(user.auth()){
            session.setAttribute("Username",username);
            response.sendRedirect("MainPage.jsp");
        }else{
            session = request.getSession(false);
            session.setAttribute("error", "Your username or password is incorrect.");
            response.sendRedirect("WelcomePage.jsp");
        }
        
        session.setAttribute("error", "Your username or password is incorrect.");
        response.sendRedirect("WelcomePage.jsp");
    }
    else if( type.equals("twitter")){
        session.setAttribute("error", "Your username or password is incorrect.");
        response.sendRedirect("WelcomePage.jsp");
    }
    else if( type.equals("facebook")){
        session.setAttribute("error", "Your username or password is incorrect.");
        response.sendRedirect("WelcomePage.jsp");
    }else{
        session.removeAttribute("error");
    }
%>