package services;

import database.Database;
import database.DatabaseCreator;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class History {
    private static Database db;
    private boolean firstWaypoint = true;
    String Username = "";
    String Start = "";
    String Finish = "";
    String Departure = "";
    String Arrival = "";
    String Price = "";

    public History() {
        db = DatabaseCreator.getInstance();
    }
    
    public boolean checkUsername(String Username) {
        return db.userExists(Username);
    }

    public void setUsername(String Username) {
        this.Username = Username;
    }

    public String getUsername() {
        return Username;
    }
    
    public void insertWaypoint(String Start, String Finish, String Departure, String Arrival, String Price){
        if(this.firstWaypoint){
            this.Start = Start;
            this.Finish = Finish;
            this.Departure = Departure;
            this.Arrival = Arrival;
            this.Price = Price;
            this.firstWaypoint = false; 
        }else{
            this.Finish = Finish;
            this.Arrival = Arrival;
            this.Price = addPrice(this.Price, Price);
        }
    }
    
    public String addPrice(String prev, String curr){
        double prevPrice;
        double currPrice;
        double newPrice;
        String newString = "";
        String returned = "";
        int i;
        
        prevPrice = Double.parseDouble(prev);
        currPrice = Double.parseDouble(curr);
        newPrice = currPrice + prevPrice;
        
        DecimalFormat df = new DecimalFormat("#.##");      
        newPrice = Double.valueOf(df.format(newPrice));
        newString = Double.toString(newPrice);
        
        return newString;
    }
    
    public boolean historyUpdate() {
        if(!db.historyInsert(Username, Start, Finish, Departure, Arrival, Price)){
            return false;
        }
        return true;
    }
    
    public List<List<String>> getHistory(){
        String[] hist = db.getHistory(Username);
        List<List<String>> list_returned = new ArrayList<>();

        List<String> route = null;
        String curr = "";
        int i,j;
        
        if(hist[0].equals("")){
            return null;
        }
        
        
        for(i=0; i<hist.length; i++){
            curr = hist[i];
            if(curr.equals("")){
                break;
            }
            route = new ArrayList<>();
            String[] splitLine = curr.split("\t");
            
            for(j=0; j<splitLine.length; j++){
                route.add(splitLine[j]);
            }
            list_returned.add(route);
        }
        
        return list_returned;
    }
}
