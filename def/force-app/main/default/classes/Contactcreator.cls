public with sharing class Contactcreator {
    static  Contact cont ;
    @AuraEnabled public static String  insertrecords(String Name1,String Email){
        try{
            cont = new Contact();
         
            cont.LastName = Name1;
            cont.Email = Email;
            insert cont;
            system.debug(cont.id);
            
        }catch(exception e){
            system.debug(e.getMessage());
            return e.getMessage();
        }     
        return cont.id;
    }       
      public static void  deleterecords(String recid){
            try{
                Contact contdelete = new Contact();
                contdelete = [select id from contact where id =:recid ];
                delete contdelete;
            }catch(exception e){
                system.debug(e.getMessage());
            }   
            
        }
    
    
   @AuraEnabled public static void  updaterecords(String recid,String passeddata){
            try{
                Contact conttoupdate= new Contact();
                conttoupdate= [select id,department from contact where id =:recid ];
                conttoupdate.department = passeddata;
                update conttoupdate;
            }catch(exception e){
                system.debug(e.getMessage());
            }   
            
        }
    
     @AuraEnabled
   
    public static Contact fetchcontact(Id Idd){
     //   Contact cont;    
        cont = [Select id,LastName,Email,Description  from contact where id =:Idd];      
        return cont;
        
    }
    
    
    
    }