public class ContactCreatorApex {
    public static String contactcreate(String Name){
        try{
        Contact cont= new Contact(lastname =Name);
        insert cont;
        System.debug(cont.id);
            return cont.id;
        }catch(Exception e){
             System.debug(e.getMessage());
               return'rerror';
        }
    }
    
    
    
     public static void contactcreateinbulk(String Name){
        try{
         Integer x =0; 
            List<Contact> contlist= new list<contact>();
         Contact cont;    
         While (x<11){
         cont=    new Contact(lastname =Name+x);  
             if(x==5){
                 cont.devlight1973__age__c =6;
             }else{ cont.devlight1973__age__c =60;}
           //  insert cont;
             contlist.add(cont);
             x++;
            //  System.debug(cont.id);
         }
       //2 issues with this code
            Database.insert(contlist,false);
            
            System.debug(contlist.size());
        }catch(Exception e){
             System.debug(e.getMessage());
              // return'rerror';
        }
    }
}