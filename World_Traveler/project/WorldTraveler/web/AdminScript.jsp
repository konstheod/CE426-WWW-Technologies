<%@page import="java.sql.Time"%>
<%@page import="services.*" %>
<%
    String start = request.getParameter("start");
    String finish = request.getParameter("finish");
    String transportation = request.getParameter("transportation");
    String departure = request.getParameter("departure");
    String arrival = request.getParameter("arrival");
    String price = request.getParameter("price");
    
    System.out.println("\n\nNew session start");
    System.out.println("The start is: "+ start);
    System.out.println("The finish is: "+ finish);
    System.out.println("The transportation is: "+ transportation);
    System.out.println("The departure is at: "+ departure);
    System.out.println("The arrival is at: "+ arrival);
    
    Time curr_time;
    Schedule curr = new Schedule();
    boolean check;
    check = curr.insertSchedule(start, finish, departure, arrival, transportation, price);
    if(! check){
        session.setAttribute("error", "Something went really wrong.");
    }else{
        session.setAttribute("error", "Schedule Table Updated.");
    }
    response.sendRedirect("AdminPage.jsp");

%>