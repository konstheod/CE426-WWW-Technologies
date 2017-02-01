package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.sql.Timestamp;
import java.util.Date;

public final class Database {
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost:3306/WorldTraveler";
    static final String USERNAME = "root";
    static final String PASSWORD_LOCAL = "123456";
    static final String PASSWORD_SERVER = "123456789aA!";
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;
    private Statement stmt;
    private int HistoryNumber = 5;
    
    static String PASSWORD;
    //static final String PASSWORD = PASSWORD_SERVER;
    /**
     * Initialize a newly created Database object
     */
    public Database() {
        String linux_system = System.getProperty("os.version");
        if(linux_system.equals("3.10.0-327.36.3.el7.x86_64")){
            this.PASSWORD = this.PASSWORD_SERVER;
        }else{
            this.PASSWORD = this.PASSWORD_LOCAL;
        }
        
        System.out.println("Linux version: " + linux_system);
 //        System.getProperties().list(System.out);
	dbConnection();
    }
    /**
     * Establishes the connection with SQL server
     */
    public void dbConnection() {
		
        try {
            
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(DB_URL,USERNAME,PASSWORD);
                stmt = conn.createStatement();
            } catch (ClassNotFoundException ex) {
		return;
            }
                

            
        } catch(SQLException se) {
            System.out.println("Connection failed.");
            return;
        }
        if (conn!= null) {
            System.out.println("Connected with db.");
        } else {
            System.out.println("Failed to make connection with db.(conn==NULL)");
        }
    }
    
    public void createTables() {
        try {
            String sql = "CREATE TABLE user " + "(Username VARCHAR(255) not NULL, Password VARCHAR(255) not NULL, Email VARCHAR(255) not NULL UNIQUE, Name VARCHAR(255), Lastname VARCHAR(255), Phone VARCHAR(255), PRIMARY KEY(Username)) ENGINE=InnoDB";
            stmt.executeUpdate(sql);
            System.out.println("Creation of user table complete!");
        } catch(SQLException se) {
            System.out.println("Table user already exists." + se);
        }
        
        try {
            String sql = "CREATE TABLE history " + "(Username VARCHAR(255) not NULL, Origin VARCHAR(255) not NULL, Destination VARCHAR(255) not NULL, DestinationDate TIMESTAMP not NULL, Departure VARCHAR(255) not NULL, Arrival VARCHAR(255) not NULL, Price VARCHAR(255) not NULL, PRIMARY KEY(Origin, Destination, DestinationDate), FOREIGN KEY(Username) REFERENCES user(Username) ON DELETE CASCADE) ENGINE=InnoDB";  stmt.executeUpdate(sql);            System.out.println("Creation of history table complete!");
            stmt.executeUpdate(sql);
            System.out.println("Creation of history table complete!");
        } catch(SQLException se) {
                System.out.println("Table history already exists. " + se );
        }
    }
    
    /**
     * Inserts the sign up data 
     * @param Username Username
     * @param Password Password
     * @param Email Email
     * @param Name Name
     * @param Lastname Lastname
     * @param Phone Phone
     * @return false if the user already exists else true
     */
    public boolean Registration(String Username, String Password, String Email, String Name, String Lastname, String Phone) {
        // Returns true if SignUp was successful otherwise returns false
        try {
            pstmt = conn.prepareStatement("INSERT INTO user values(?,?,?,?,?,?)");
            pstmt.setString(1,Username);
            pstmt.setString(2,Password);
            pstmt.setString(3,Email);
            pstmt.setString(4,Name);
            pstmt.setString(5,Lastname);
            pstmt.setString(6,Phone);
            pstmt.executeUpdate();
            return true;
        } catch(SQLException ex){
            return false;
        }
    }
    
    public boolean userEdit(String Username, String Password, String Email, String Phone ) {
        try {
                pstmt = conn.prepareStatement("UPDATE user SET Password = ?, Email = ?, Phone = ? WHERE Username = ?");
                pstmt.setString(1,Password);
                pstmt.setString(2,Email);
                pstmt.setString(3,Phone);
                pstmt.setString(4,Username);
                pstmt.executeUpdate();
                System.out.println("Edited " + Username + " information.");
                return true;
        } catch(SQLException se) {
                se.printStackTrace();
                return false;
        }
    }
    
    /**
     * Authorization for users data
     * @param Username Username
     * @param Password Password
     * @return false if the authorization fail else true
     */
    public boolean userLogin(String Username, String Password) {
        // Returns true if username & password are correct , otherwise it returns false
        try {
            rs = stmt.executeQuery("SELECT * FROM user WHERE Username='" + Username + "'" + " AND Password='" + Password + "'");
            
            return rs.isBeforeFirst();
            
        } catch(SQLException ex) {
            return false;
        }
    }
    
    public boolean forgotPassword(String Username, String Password, String Name, String Lastname, String Address, String Phone, String EmergencyCall) {
		
        try {
            pstmt = conn.prepareStatement("UPDATE user SET Password = ?, Name = ?, Lastname = ?, Address = ?, Phone = ? WHERE Username = ?");
            pstmt.setString(1,Password);
            pstmt.setString(2,Name);
            pstmt.setString(3,Lastname);
            pstmt.setString(4,Address);
            pstmt.setString(5,Phone);
            pstmt.setString(7,Username);
            pstmt.executeUpdate();
            System.out.println("Edited " + Username + " information.");
            return true;
        } catch(SQLException se) {
            return false;
        }
    }
    
    public boolean userDelete(String Username) {
        // Deletes the registration in users table and also it's dependencies in history table
        try {
            pstmt = conn.prepareStatement("DELETE FROM user WHERE Username = ?");
            pstmt.setString(1,Username);
            pstmt.executeUpdate();
            pstmt = conn.prepareStatement("DELETE FROM history WHERE Username = ?");
            pstmt.setString(1,Username);
            pstmt.executeUpdate();
            System.out.println(Username + " deleted from tables user and history.");
            return true;
        } catch(SQLException se) {
            return false;
        }
    }
    
    public boolean userExists(String Username){

        try{
            pstmt = conn.prepareStatement("SELECT `Username` FROM `user` WHERE Username = ?");
            pstmt.setString(1,Username);
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()){
                return true;
            }
        }catch(SQLException se) {
            return true;
        }
        return false;
    }
    
    public String getUserEmail(String Username) {
		
        try {
            pstmt = conn.prepareStatement("SELECT Email FROM user WHERE Username = ?");
            pstmt.setString(1,Username);
            rs = pstmt.executeQuery();
            while(rs.next()) {
                return rs.getString("Email");
            }
        } catch(SQLException se) {
            se.printStackTrace();
            return "";
        }
        return "";
    }
    
    public String getPassword(String Username) {

        try {
            pstmt = conn.prepareStatement("SELECT Password FROM user WHERE Username = ?");
            pstmt.setString(1,Username);
            rs = pstmt.executeQuery();
            while(rs.next()) {
                    return rs.getString("Password");
            }
        } catch(SQLException se) {
            se.printStackTrace();
            return "";
        }
        return "";
    }
    
    public String getPhone(String Username) {

        try {
            pstmt = conn.prepareStatement("SELECT Phone FROM user WHERE Username = ?");
            pstmt.setString(1,Username);
            rs = pstmt.executeQuery();
            while(rs.next()) {
                    return rs.getString("Phone");
            }
        } catch(SQLException se) {
            se.printStackTrace();
            return "";
        }
        return "";
    }
    
    public boolean historyInsert(String Username, String Origin, String Destination, String Departure, String Arrival, String Price) {
        Date dt = new Date();
        Timestamp timestamp = new Timestamp(dt.getTime());
        try {
                pstmt = conn.prepareStatement("INSERT INTO history values(?,?,?,?,?,?,?)");
                pstmt.setString(1,Username);
                pstmt.setString(2,Origin);
                pstmt.setString(3,Destination);
                pstmt.setTimestamp(4,timestamp);
                pstmt.setString(5,Departure);
                pstmt.setString(6,Arrival);
                pstmt.setString(7,Price);
                pstmt.executeUpdate();
                return true;
        } catch(SQLException se) {
                se.printStackTrace();
                return false;
        }
    } 
    
    public String[] getHistory(String Username) {
            // It returns the last 5 Destinations of the user with the corresponding Username
        String[] resultArray = new String[HistoryNumber];
        int i;
        for(i=0; i<HistoryNumber; i++){
            resultArray[i] = "";
        }
        int counter = 0;
        try {
            pstmt = conn.prepareStatement("SELECT * FROM history WHERE Username = ? ORDER BY DestinationDate DESC");
            pstmt.setString(1,Username);
            rs = pstmt.executeQuery();
            while(rs.next() && counter < HistoryNumber) {
                    
                resultArray[counter] = rs.getString("Origin") + "\t" + rs.getString("Destination") + "\t" + rs.getString("Departure") + "\t" + rs.getString("Arrival") + "\t" + rs.getString("Price");
                counter++;
            } 
        } catch(SQLException se) {
            se.printStackTrace();
            resultArray[0] = "ERROR";
            return resultArray;
        }
        return resultArray;
    }
}
