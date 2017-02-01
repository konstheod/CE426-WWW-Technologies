<%@page import="login_page.*" %>

<%
    System.out.println("HEEEEEEEEEEEEEEEEEEREEEE!!!!!");
    String name = request.getParameter("name");
    String origin = request.getParameter("origin");
    String destination     = request.getParameter("destination");
    
    System.out.println("Name : " + name);
    System.out.println("origin : " + origin);
    System.out.println("destination : " + destination);
    
    System.out.println("company : " + request.getParameter("company"));
    System.out.println("end : " + request.getParameter("end"));
%>