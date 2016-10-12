package com.example.model;

import java.util.*;

public class BeerExpert {
   public List getTypes(String type) {

     List types = new ArrayList();

     if (type.equals("light")) {
       types.add("Bag Piper");
       types.add("Mountain Dew");
     }
     else if (type.equals("amber")) {
       types.add("Pata nai yaar");
     }
     else if (type.equals("brown")) {
       types.add("McDowells");
     }
     else if (type.equals("dark")) {
       types.add("Petrol");
       types.add("Kerosene");
     }
     else {
       types.add("Draft Beer ");
     }
     return(types);
   }
}