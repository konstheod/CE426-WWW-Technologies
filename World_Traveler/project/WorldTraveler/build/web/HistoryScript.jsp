<%@page import="java.util.List"%>
<%@page import="services.*" %>
<%
    session = request.getSession();
    session.removeAttribute("error");
    session.removeAttribute("history");
//    session.setAttribute("Username",session.getAttribute("Username"));
//    session.setAttribute("Account",session.getAttribute("Account"));
    
    String Username = session.getAttribute("Username").toString();
    String Account = session.getAttribute("Account").toString();
    
    History currHistory = new History();
    currHistory.setUsername(Username);
    
    if(currHistory.checkUsername(Username)){
        
        List<List<String>>  list;
        String attr = "";

        list = currHistory.getHistory();
        if(list==null){
            attr += "<table>";
            attr += "<tr>";
            attr += "<th>";
            attr += "You haven't use our service again. So, you haven't any travel history.";
            attr += "</th>";
            attr += "</tr>";
            attr+= "</table>";
        }else{
            Integer i;
            Integer j;

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
            }    
            attr+= "</table>";
        }
        session.setAttribute("history", attr);
        response.sendRedirect("HistoryPage.jsp");
    }else{
        session.setAttribute("error", "You haven't signup using our services!");
        response.sendRedirect("MainPage.jsp");
        
    }
%>