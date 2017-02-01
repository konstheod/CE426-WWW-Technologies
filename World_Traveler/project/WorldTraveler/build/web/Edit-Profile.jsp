<%@page import="services.*" %>
<%
    
    session = request.getSession();
    session.removeAttribute("error");
    if(session.getAttribute("todo") != null){
        if(session.getAttribute("todo").equals("check")){
            
//            session.setAttribute("Username",session.getAttribute("Username"));
//            session.setAttribute("Account",session.getAttribute("Account"));
            
            String Password = request.getParameter("Password");
            String PasswordCheck = request.getParameter("PasswordCheck");
            String PreviousPassword = request.getParameter("PreviousPassword");
            String email = "";
            email = request.getParameter("email");
            String Phone = "";
            Phone = request.getParameter("Phone");
            
                      
            String username = session.getAttribute("Username").toString();
            LoginPage user = new LoginPage(); 
            user.setUserName(username);
            String authPassword = user.getPassword();
            
            String redirectString = "";
            boolean check = false;
            
            if(authPassword.equals(PreviousPassword)){
                if(email.equals("")){
                    user.setEmail(user.getEmail());
                }else{
                    user.setEmail(email);
                    check = true;
                }
                
                System.out.println("EMAIL IS OK");
                
                if(Phone.equals("")){
                    user.setPhone(user.getPhone());
                }else{
                    user.setPhone(Phone);
                    check = true;
                }
                System.out.println("PHONE IS OK");
                
                if(Password.equals("")){
                    user.setPassword(authPassword);
                }else{
                    if(Password.equals(PasswordCheck)){
                        if(!user.checkPassword(Password)){
                            session.setAttribute("todo","check");
                            session.setAttribute("error", "Password must contain minimum 8 characters at least 1 Alphabet, 1 Number and 1 Special Character.");
                            redirectString = "Edit-ProfilePage.jsp";
                            check = false;

                        }else{
                            session.removeAttribute("todo");
                            session.setAttribute("error", "Your profile has been updated");
                            redirectString = "MainPage.jsp";
                            user.setPassword(Password);
                            check = true;
                        }
                    }else{
                        session.setAttribute("error", "Your password confirmation don't match!");
                        session.setAttribute("todo","check");
                        redirectString = "Edit-ProfilePage.jsp";
                        check = false;
                    }
                }
                if(check){
                    user.updateProfile();
                }
                response.sendRedirect(redirectString);
                
            }else{
                session.setAttribute("error", "Your previous password is wrong!");
                session.setAttribute("todo","check");
                response.sendRedirect("Edit-ProfilePage.jsp");
            }
            
            
            

        }else{
            session.removeAttribute("todo");
            session.setAttribute("error", "Something went wrong");

            response.sendRedirect("MainPage.jsp");
        }        
        
    }else{
        session.removeAttribute("todo");

        if(session.getAttribute("Account").equals("database")){
            String username = session.getAttribute("Username").toString();
            LoginPage user = new LoginPage(); 
            user.setUserName(username);

            session.setAttribute("email",user.getEmail());
//            session.setAttribute("Username",session.getAttribute("Username"));
//            session.setAttribute("Account",session.getAttribute("Account"));
            
            String phone = "";
            phone = user.getPhone();
            if(phone.equals("")){
                phone = "Phone(optional)";
            }
            session.setAttribute("phone",phone);
            
            session.setAttribute("todo","check");
            response.sendRedirect("Edit-ProfilePage.jsp");

        }else{
//            session.setAttribute("Username",session.getAttribute("Username"));
//            session.setAttribute("Account",session.getAttribute("Account"));  
            session.setAttribute("error", "You haven't signup using our services!");
            response.sendRedirect("MainPage.jsp");
        }
    }
%>
