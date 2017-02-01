<%@page import="java.util.List"%>
<%@page import="services.*" %>
<%
    session = request.getSession();
    session.removeAttribute("error");
    session.removeAttribute("route");
//    session.setAttribute("Username",session.getAttribute("Username"));
//    session.setAttribute("Account",session.getAttribute("Account"));
    
    String Username = session.getAttribute("Username").toString();
    String Account = session.getAttribute("Account").toString();
    
    Schedule curr = new Schedule();
    boolean check = false;
    if(session.getAttribute("Account").equals("database")){
        check = true;
    }
    
    History currHistory = new History();
    if(check){
        currHistory.setUsername(Username);
    }
    
    String Origin = request.getParameter("origin");
    String Destination = request.getParameter("destination");
    String Option = request.getParameter("option");
    String Departure = request.getParameter("departure");

    List<List<String>>  list;
    list = curr.findRoute(Origin, Destination, Departure, Option, 0, "");
    Integer i;
    Integer j;
    String attr = "";

    attr += "<table>";
    attr += "<tr>";
    attr += "<th>";
    attr += "Start";
    attr += "</th>";
    attr += "<th>";
    attr += "Finish";
    attr += "</th>";
    attr += "<th>";
    attr += "Departure";
    attr += "</th>";
    attr += "<th>";
    attr += "Arrival";
    attr += "</th>";
    attr += "<th>";
    attr += "Transportation";
    attr += "</th>";
    attr += "<th>";
    attr += "Price";
    attr += "</th>";
    attr += "</tr>";

    for(i=0;i<list.size();i++){
        List<String> route = list.get(i);
        attr += "<tr>";
        for(j=0;j<route.size();j++){
            attr += "<th>";
            attr += route.get(j);
            attr += "</th>";
        }
        attr += "</tr>";
        if(check){
            currHistory.insertWaypoint(route.get(0), route.get(1), route.get(2), route.get(3), route.get(5));
        }
    }    
    attr+= "</table>";
    if(check){
        if(currHistory.checkUsername(Username)){
            currHistory.historyUpdate();
            session.setAttribute("route", attr);
            response.sendRedirect("RoutePage.jsp");
        }else{
            session.setAttribute("error", "You haven't login properly!");
            response.sendRedirect("MainPage.jsp");
        }
    }else{
        session.setAttribute("route", attr);
        response.sendRedirect("RoutePage.jsp");
    }
       
%>