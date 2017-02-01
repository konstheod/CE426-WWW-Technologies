package services;

import database.Database;
import database.DatabaseCreator;

import java.util.Date;
import java.util.Properties;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author katerina
 */
public class LoginPage{
    private static Database db;
    String Username;
    String Password;
    String Email;
    String Phone;
    
    public LoginPage() {
        db = DatabaseCreator.getInstance();
    }

    public void setUserName(String Username )
    {
        this.Username = Username;
        
    }
    public void setPassword(String Password )
    {
        this.Password = Password;
        
    }
    
    public String getUserName()
    {
        return Username;
        
    }
    
    public void setPhone(String Phone )
    {
        this.Phone = Phone;
        
    }
    
    public void setEmail(String Email )
    {
        this.Email = Email;
        
    }
    
    public String getPhone(){
        return db.getPhone(Username);

    }
    
    public String getPassword()
    {
        return db.getPassword(Username);
    }
    
    public boolean checkUser(){
        
        return db.userLogin(Username, Password);
 
    }
    
    public String getEmail(){
        return db.getUserEmail(Username);
    }
    
    public void sendEmail(String Yo){
        try{

            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail..com"); // for gmail use smtp.gmail.com
            props.put("mail.smtp.auth", "true");
            props.put("mail.debug", "true"); 
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.port", "465");
            props.put("mail.smtp.socketFactory.port", "465");
            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.socketFactory.fallback", "false");

            Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {

                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("konstantinosth2009@gmail.com", "****");
                }
            });

            mailSession.setDebug(true); // Enable the debug mode

            Message msg = new MimeMessage( mailSession );

            //--[ Set the FROM, TO, DATE and SUBJECT fields
            msg.setFrom( new InternetAddress( "kat.karakoula@gmail.com" ) );
            msg.setRecipients( Message.RecipientType.TO,InternetAddress.parse("katcool5@hotmail.com") );
            msg.setSentDate( new Date());
            msg.setSubject( "Hello World!" );

            //--[ Create the body of the mail
            msg.setText( "Hello from my first e-mail sent with JavaMail" );

            //--[ Ask the Transport class to send our mail message
            Transport.send( msg );

        }catch(MessagingException E){
            System.out.println( "Oops something has gone pearshaped!");
            System.out.println( E );
        }
    }
    
    
    
    public boolean updateProfile(){
        boolean check;
        check = db.userEdit(Username, Password, Email, Phone);
        return true;
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

