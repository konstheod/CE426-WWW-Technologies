/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


/**
 *
 * @author konstheo
 */
public class Schedule {
    private FileWriter fw;
    private BufferedWriter bw;
    private PrintWriter out;
    private boolean Opened = false;
    
    public Schedule(){
        //this.Opened = this.tryOpen();
    }
    
    private boolean tryOpen(){
        try(FileWriter fw_curr = new FileWriter("Schedules.txt", true); 
            BufferedWriter bw_curr = new BufferedWriter(fw_curr);
            PrintWriter out_curr = new PrintWriter(bw_curr)){
            this.fw = fw_curr;
            this.bw = bw_curr;
            this.out = out_curr;
//            out_curr.println("OUT CURR IS OK");
//            Schedule.out.println("Schedule OUT IS OK");
        } catch (IOException e) {
            System.out.println("Somethin went wrong at tryOpen");
            return false;
        }
        return true;
    }
    
    public boolean insertSchedule(String Start, String Finish, String DepartureTime, String ArrivalTime, String Transportation, String Price) {
        String line = "";
        String pattern = "([0-9]+:[0-9]+)";
        Pattern r = Pattern.compile(pattern);
        Matcher m = r.matcher(DepartureTime);
        if (m.find( )) {
            DepartureTime = m.group(1);
        }
        
        m = r.matcher(ArrivalTime);
        if (m.find( )) {
            ArrivalTime = m.group(1);
        }
        
        line += Start + "\t" + Finish + "\t" + DepartureTime + "\t" + ArrivalTime + "\t" + Transportation + "\t" + Price;
        
        try(FileWriter fw_curr = new FileWriter("Schedules.txt", true); 
            BufferedWriter bw_curr = new BufferedWriter(fw_curr);
            PrintWriter out_curr = new PrintWriter(bw_curr)){

            out_curr.println(line);
            out_curr.close();
            bw_curr.close();
            fw_curr.close();
            
        } catch (IOException e) {
            System.out.println("Somethin went wrong at tryOpen");
            return false;
        }
        return true;            
    }
    
    public double compareDep(String DepTime, String PreTime){
        double depHour, prefHour;
        double diff;

        depHour = Double.parseDouble(DepTime.substring(0, 2));
        depHour += Double.parseDouble(DepTime.substring(3, 5)) * 0.01;
        
        prefHour = Double.parseDouble(PreTime.substring(0, 2));
        prefHour += Double.parseDouble(PreTime.substring(3, 5)) * 0.01;
        
        diff = depHour - prefHour;

        if(diff<-12.01){
            diff += 24;
        }

        return diff;
    }
    
    public boolean makeCircles(List<List<String>> RouteList){
        List<String> route = null;
        List<String> curr = null;
        
        List<String> depCities =  new ArrayList<>();
        List<String> arrCities =  new ArrayList<>();
        int i,j,times;

        for(i=0;i<RouteList.size();i++){
            route = new ArrayList<>();
            curr = RouteList.get(i);
            String[] splitLine = curr.get(0).split("\t");
            
            depCities.add(splitLine[0]);
            arrCities.add(splitLine[1]);
        }


        for(j=0; j<arrCities.size(); j++){
            times = 0;
            for(i=0; i<depCities.size(); i++){
                if(arrCities.get(j).equals(depCities.get(i))){
                    times++;
                }
            }
            if(times>1){
                return true;
            }
        }

        return false;
    }

    public List<List<String>> findRoute(String Start, String Finish, String DepartureTime, String Way, int Iter, String PrevStart) throws IOException{
        
        if(Iter>5){
            return null;
        }
        
        List<List<String>> list_route = new ArrayList<>();
        List<List<String>> list_returned = new ArrayList<>();
        int i,j;

        double prevDiff = 25;
        double currDiff = 0;
        String prevLine = "";
        String startLine = "";
        String finishLine = "";
        String departLine = "";
        String arrivalLine = "";
        double duration = 0;
        double price = 0;
        boolean check = false;
        
        try (FileReader fr_curr = new FileReader("Schedules.txt");
            BufferedReader br = new BufferedReader(fr_curr)) {

            String line;
            while ((line = br.readLine()) != null) {
                list_route.clear();
                check = false;
                String[] splitLine = line.split("\t");
              
                startLine = splitLine[0];
                finishLine = splitLine[1];
                departLine = splitLine[2];
                arrivalLine = splitLine[3];

                if(startLine.equals(Start)){
                    currDiff = compareDep(departLine, DepartureTime); 
                    System.out.println("Iter: " + Iter + " " + line);
                    System.out.println(Start + " " + Finish + " " + DepartureTime + " " + currDiff);

                    if(currDiff>= -0.001 && currDiff<prevDiff){
                        if(finishLine.equals(Start) || startLine.equals(Finish) || 
                            PrevStart.equals(finishLine)){
                            continue;
                        }



                        System.out.println("\n IN ");
                        if(finishLine.equals(Finish)){
                            List<String> curr = new ArrayList<String>();
                            curr.add(line);
                            list_route.add(curr);
                            if(makeCircles(list_route)){
                                continue;
                            }
                            
                            if(Iter == 0){

                                break;
                            }else{
                                return list_route;
                            }
                        }else{
                            
                            list_returned = findRoute(finishLine, Finish, arrivalLine, Way, Iter+1, Start);
                            if(list_returned==null){
                                continue; 
                            }
                            List<String> curr = new ArrayList<String>();
                            curr.add(line);
                            list_route.add(curr);
                            
                            for(i=0; i<list_returned.size();i++){
                                list_route.add(list_returned.get(i));
                            }
                            if(makeCircles(list_route)){
                                continue;
                            }

                            if(Iter == 0){
                                break;
                            }else{
                                return list_route;
                            }
                        }          
                    }
                }                
            }
        }
        if(Iter != 0){
            return null;
        }


        List<String> route = null;
        List<String> curr = null;
        
        list_returned = new ArrayList<>();
        
        for(i=0;i<list_route.size();i++){
            route = new ArrayList<>();
            curr = list_route.get(i);
            String[] splitLine = curr.get(0).split("\t");
            
            for(j=0; j<splitLine.length; j++){
                route.add(splitLine[j]);
            }
            
            list_returned.add(route);
        }
        
        
        return list_returned;
    }
}
