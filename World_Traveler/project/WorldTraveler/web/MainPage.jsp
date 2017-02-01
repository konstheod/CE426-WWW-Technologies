

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="MainCSS/MainPage.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script type="text/javascript" src="https://conversational-form-0iznjsw.stackpathdns.com/conversational-form.min.js" crossorigin></script>
        
    </head>
    <body>
         
        <ul class="topnav" id="myTopnav">
            <li><a href="Sign-Out.jsp">Sign Out</a></li>
            <li><a href="Edit-Profile.jsp">Edit Profile</a></li>
            <li><a href="HistoryScript.jsp">History</a></li>
            
            <li><a href="MainPage.jsp">Home</a></li>

            <li class="icon">
                <a href="javascript:void(0);" onclick="myFunction()">&#9776;</a>
            </li>
        </ul>
        
                <h3>${sessionScope['error']}</h3>
        <div cf-context class="boxed">
            <form cf-form action="RouteScript.jsp" method="POST" >
                <div class="form-group">
                    <label for="name">Name</label>
                    <input cf-questions="Hi there! What's your name?" type="name" class="form-control" name="name" id="name">
                </div>

                <div class="form-group">
                    <label for="origin">Origin</label>
                    <div class="radio">
                        <label>
                            <input cf-questions="Great to meet you, {previous-answer}! And from which town are you want to travel?|Awesome, {previous-answer}! And from which town are you want to travel?" type="radio" name="origin" id="origin-1" value="Larisa">
                            Larisa
                        </label>
                    </div>

                    <div class="radio">
                        <label>
                            <input type="radio" name="origin" id="origin-2" value="Athens">
                            Athens
                        </label>
                    </div>
                    <div class="radio">
                        <label>
                            <input type="radio" name="origin" id="origin-3" value="Thessaloniki">
                            Thessaloniki
                        </label>
                    </div>
                    <div class="radio">
                        <label>
                            <input type="radio" name="origin" id="origin-2" value="Platy">
                            Platy
                        </label>
                    </div>
                </div>


                <div class="form-group">
                    <label for="destination">Destination</label>
                    <div class="radio">
                        <label>
                            <input cf-questions="Where do you want to go?" type="radio" name="destination" id="destination-1" value="Platy">
                            Platy
                        </label>
                    </div>

                    <div class="radio">
                        <label>
                            <input type="radio" name="destination" id="destination-2" value="Thessaloniki">
                            Thessaloniki
                        </label>
                    </div>
                    <div class="radio">
                        <label>
                            <input type="radio" name="destination" id="destination-3" value="Athens">
                            Athens
                        </label>
                    </div>
                    <div class="radio">
                        <label>
                            <input type="radio" name="destination" id="destination-2" value="Larisa">
                            Larisa
                        </label>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="option">Option</label>
                    <div class="radio">
                        <label>
                            <input cf-questions="So, you can choose between two options! Do you want to travel as economical or fast as possible?" type="radio" name="option" id="origin-1" value="Fast">
                            Fast
                        </label>
                    </div>

                    <div class="radio">
                        <label>
                            <input type="radio" name="option" id="origin-2" value="Economical">
                            Economical
                        </label>
                    </div>
                    
                </div>
                
                 
                <div class="form-group">
                  <label for="departure">Departure Time</label>
                  <input cf-questions="And about what time do you want to depart?  Please give the time in 00:00 format." type="text" class="form-control" name="departure" id="departure" value="08:00">
                </div>
                   
                
                <button type="submit" class="btn btn-default">Submit</button>
            </form>
              
        </div>
        
        
        
        
        
    
    
     

    </body>
</html>

