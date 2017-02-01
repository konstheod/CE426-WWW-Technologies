<%@page import="services.*" %>
<%
    
    session = request.getSession();
    session.removeAttribute("error");
    session.setAttribute("Username","");
    session.setAttribute("Account","");  
    session = request.getSession(true);
    response.sendRedirect("WelcomePage.jsp");
     
%>
