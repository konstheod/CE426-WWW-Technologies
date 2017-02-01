<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <!-- jquery -->
        <script src="jquery/jquery-1.8.2.min.js"></script>
        <script src="jquery-3.1.1.js"></script>

        <!-- momentjs -->  
        <script src="moment.js"></script>
        <script src="momentjs/moment.min.2.5.0.js"></script> 
        <script src="moment.min.2.17.1.js"></script> 
        <!-- combodate -->  
        <script src="combodate.js"></script> 
        
    </head>
    <body>
        <h3>${sessionScope['error']}</h3>

        <form action="AdminScript.jsp" method="POST" >
            <div class="form-group">
                <label for="start">start</label>
                <div class="radio">
                    <label>
                        <input cf-questions="Great to meet you, {previous-answer}! I'm a web form, what do you do?|Awesome, {previous-answer}! And from which town are you want to travel?" type="radio" name="start" id="origin-1" value="Larisa">
                        Larisa
                    </label>
                </div>

                <div class="radio">
                    <label>
                        <input type="radio" name="start" id="origin-2" value="Athens">
                        Athens
                    </label>
                </div>
                <div class="radio">
                    <label>
                        <input type="radio" name="start" id="origin-3" value="Thessaloniki">
                        Thessaloniki
                    </label>
                </div>
                <div class="radio">
                    <label>
                        <input type="radio" name="start" id="origin-2" value="Platy">
                        Platy
                    </label>
                </div>
            </div>


            <div class="form-group">
                <label for="finish">finish</label>
                <div class="radio">
                    <label>
                        <input cf-questions="Where do you want to travel?" type="radio" name="finish" id="destination-1" value="Platy">
                        Platy
                    </label>
                </div>

                <div class="radio">
                    <label>
                        <input type="radio" name="finish" id="destination-2" value="Thessaloniki">
                        Thessaloniki
                    </label>
                </div>
                <div class="radio">
                    <label>
                        <input type="radio" name="finish" id="destination-3" value="Athens">
                        Athens
                    </label>
                </div>
                <div class="radio">
                    <label>
                        <input type="radio" name="finish" id="destination-2" value="Larisa">
                        Larisa
                    </label>
                </div>
            </div>
            
            <div class="form-group">
                <label for="transportation">Destination</label>
                <div class="radio">
                    <label>
                        <input cf-questions="Where do you want to travel?" type="radio" name="transportation" id="destination-1" value="Train">
                        Train
                    </label>
                </div>

                <div class="radio">
                    <label>
                        <input type="radio" name="transportation" id="destination-2" value="Bus">
                        Bus
                    </label>
                </div>
                <div class="radio">
                    <label>
                        <input type="radio" name="transportation" id="destination-3" value="Airoplane">
                        Airoplane
                    </label>
                </div>
                
            </div>
            
            <div class="form-group">
                <label for="Departure">Departure date</label>
                <div class="radio">
                    <label>
                        <input type="text" id="datetime24" data-format="DD-MM-YYYY HH:mm" data-template="DD / MM / YYYY     HH : mm" name="departure" value="21-12-2012 08:30">
                        <script>
                        $(function(){
                            $('#datetime24').combodate();  
                        });
                        </script>  
                    </label>
                </div> 
            </div>
            
            <div class="form-group">
                <label for="Arrival">Arrival date</label>
                <div class="radio">
                    <label>
                        <input type="text" id="datetime24" data-format="DD-MM-YYYY HH:mm" data-template="DD / MM / YYYY     HH : mm" name="arrival" value="21-12-2012 10:30">
                        <script>
                        $(function(){
                            $('#datetime24').combodate();  
                        });
                        </script>  
                    </label>
                </div> 
            </div>
            
            
            <div class="form-group">
                <label for="Price">Price</label>
                <div class="radio">
                    <label>
                        <input type="text" id="price" name="price" value="42,8">

                    </label>
                </div> 
            </div>
            <button type="submit" class="btn btn-default">Submit</button>
        </form>
    </body>
</html>
