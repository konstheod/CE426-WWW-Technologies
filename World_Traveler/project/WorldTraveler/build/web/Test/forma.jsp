<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title></title>
    <meta name="description" content="Turning web forms into conversations">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="apple-touch-icon" href="apple-touch-icon.png">

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/main.css">
    <script type="text/javascript" src="https://conversational-form-0iznjsw.stackpathdns.com/conversational-form.min.js" crossorigin></script>

    <script src="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
    
    
    <link rel="stylesheet" type="text/css" href="indexTest.css">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
  </head>
  <body>

    <ul class="topnav" id="myTopnav">
            <li><a href="#Sign-Out">Sign Out</a></li>
            <li><a href="#Edit-Profile">Edit Profile</a></li>
            <li><a href="#History">History</a></li>
            <li><a href="#Home">Home</a></li>

            <li class="icon">
                <a href="javascript:void(0);" onclick="myFunction()">&#9776;</a>
            </li>
        </ul>
      
    <div class="form-box">
    <div class="container" >
      <!-- Example row of columns -->
      <div class="row">
        <div class="col-md-6 col-md-offset-3">
          <div class="row">
            <div class="col-md-12">
              <div id="form-outer" class="panel panel-default">
                <div class="panel-body">
                  <form id="conversational" cf-form action="Next.jsp" method="POST" >

                    <div class="form-group">
                      <label for="name">Name</label>
                      <input cf-questions="Hi there! What's your name?" type="name" class="form-control" name="name" id="name">
                    </div>

                    <div class="form-group">
                      <label for="origin">Origin</label>
                      <div class="radio">
                        <label>
                          <input cf-questions="Great to meet you, {previous-answer}! I'm a web form, what do you do?|Awesome, {previous-answer}! And from which town are you want to travel?" type="radio" name="origin" id="origin-1" value="Volos">
                          Volos
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
                          <input type="radio" name="origin" id="origin-2" value="Alexandreia">
                          Alexandreia
                        </label>
                      </div>
                    </div>
                    
                    
                    <div class="form-group">
                      <label for="destination">Destination</label>
                      <div class="radio">
                        <label>
                          <input cf-questions="Where do you want to travel?" type="radio" name="destination" id="destination-1" value="Alexandreia">
                         Alexandreia
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
                          <input type="radio" name="destination" id="destination-2" value="Volos">
                          Volos
                        </label>
                      </div>
                    </div>
                    
                    
                    
                    
                    <!--
                    <div class="form-group">
                      <label for="company">Company</label>
                      <input cf-questions="Which company are you with?" type="text" class="form-control" name="company" id="company">
                    </div>
                    -->
                   

                    <button type="submit" class="btn btn-default">Submit</button>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
</div>
    

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!--
    <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.min.js"><\/script>')</script>
    
    <script async defer src="https://buttons.github.io/buttons.js"></script>
    -->
    <script type="text/javascript" src="https://conversational-form-0iznjsw.stackpathdns.com/conversational-form.min.js" crossorigin></script>


    <script>
      (function(){
        setTimeout(function() {
          $(document).on("click", "#toggle-conversation", function(){
            if(!window.ConversationalForm){
              window.ConversationalForm = new cf.ConversationalForm({
                formEl: document.getElementById("conversational"),
                context: document.getElementById("form-outer"),
                userImage: "img/human.png"
              });
            }
            $(this).addClass("disabled");
            var form = $(".conversational-form");
            if (form.hasClass("conversational-form--show")) {
              $(this).removeClass("active");
              $(this).text("Turn on conversation");
              $(".conversational-form").removeClass("conversational-form--show");
            } else {
              $(this).addClass("active");
              $(this).text("Turn off conversation");
              $(".conversational-form").addClass("conversational-form--show");
            }
            $(this).removeClass("disabled");
          });
        }, 200);
      })();
    </script>

    <script src="js/vendor/bootstrap.min.js"></script>
    <script src="js/main.js"></script>


    <script>
      (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

      ga('create', 'UA-69941652-5', 'auto');
      ga('send', 'pageview');

    </script>
  </body>
</html>
