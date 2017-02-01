package services;

import database.Database;
import database.DatabaseCreator;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Register {
    private static Database db;
    String Username = "";
    String Password = "";
    String email = "";
    String Name = "";
    String Lastname = "";
    String Phone = "";

    public Register() {
        db = DatabaseCreator.getInstance();
    }
    
    public boolean checkUsername(String Username) {
        
        return db.userExists(Username);
        
    }

    public void setUsername(String Username) {
        this.Username = Username;
        
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setName(String Name) {
        if(!Name.equals("")){
            this.Name = Name;
        }
    }

    public void setLastname(String Lastname) {
        if(!Lastname.equals("")){
            this.Lastname = Lastname;
        }
    }

    public void setPhone(String Phone) {
        if(!Phone.equals("")){
            this.Phone = Phone;
        }
    }

    public String getUsername() {
        return Username;
    }

    public String getPassword() {
        return Password;
    }

    public String getEmail() {
        return email;
    }

    public String getName() {
        return Name;
    }

    public String getLastname() {
        return Lastname;
    }

    public String getPhone() {
        return Phone;
    }
    
    public boolean Registration() {
        if(!db.Registration(Username, Password, email, Name, Lastname, Phone)){
            return false;
        }
        return true;
    }
    
    public boolean isEmail(String email) {
        
        return email.contains("@");
    }
    
    public boolean checkPassword(String Password){
      String pattern = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}";
      // Create a Pattern object
      Pattern r = Pattern.compile(pattern);

      // Now create matcher object.
      Matcher m = r.matcher(Password);
      return m.find( );
    }

}
