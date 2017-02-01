<%@page import="services.LoginPage" %>
<%
    String Username = request.getParameter("Username");
    
    LoginPage user = new LoginPage(); 
    
    user.setUserName(Username);
    System.out.print("The password is: "+ user.getPassword());

    if(user.getEmail() != ""){
      // System.out.print("The password is: "+ user.getPassword());
       //response.sendRedirect("ForgotPage.jsp");
       session.setAttribute("error", "A message has sent to your personal email." + "Password: "+ user.getPassword() );
       response.sendRedirect("WelcomePage.jsp");
    }
    else{
        session = request.getSession();
        session.setAttribute("error", "This username doesn't exists.");
        response.sendRedirect("ForgotPage.jsp");
    }
%>