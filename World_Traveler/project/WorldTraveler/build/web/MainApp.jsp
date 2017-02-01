<%
    
//    response.sendRedirect("CommingSoon.html");

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
    
    
    attr += "<tr>";
    attr += "<th>";
    attr += "Athens";
    attr += "</th>";
    attr += "<th>";
    attr += "Larisa";
    attr += "</th>";
    attr += "<th>";
    attr += "10:20";
    attr += "</th>";
    attr += "<th>";
    attr += "14:20";
    attr += "</th>";
    attr += "<th>";
    attr += "Train";
    attr += "</th>";
    attr += "<th>";
    attr += "34.3";
    attr += "</th>";
    attr += "</tr>";
    
    
    attr += "<tr>";
    attr += "<th>";
    attr += "Larisa";
    attr += "</th>";
    attr += "<th>";
    attr += "Platy";
    attr += "</th>";
    attr += "<th>";
    attr += "14:20";
    attr += "</th>";
    attr += "<th>";
    attr += "15:20";
    attr += "</th>";
    attr += "<th>";
    attr += "Train";
    attr += "</th>";
    attr += "<th>";
    attr += "13.9";
    attr += "</th>";
    attr += "</tr>";
    
    
    attr += "<tr>";
    attr += "<th>";
    attr += "Platy";
    attr += "</th>";
    attr += "<th>";
    attr += "Thessaloniki";
    attr += "</th>";
    attr += "<th>";
    attr += "15:20";
    attr += "</th>";
    attr += "<th>";
    attr += "15:40";
    attr += "</th>";
    attr += "<th>";
    attr += "Train";
    attr += "</th>";
    attr += "<th>";
    attr += "9.1";
    attr += "</th>";
    attr += "</tr>";
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    attr += "</table>";
    

    session.setAttribute("route", attr);
    response.sendRedirect("RoutePage.jsp");


%>