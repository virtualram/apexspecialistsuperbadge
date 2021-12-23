public with sharing class ContactController {

    @AuraEnabled
    public static String retcontactname(Id id) {
   Contact con = new contact();
        try{
            
            
       con = [SELECT name FROM Contact where id =:id];
     
        }catch(System.Exception  e){
           // system.debug('error');
            return 'error'+e.getmessage();
        }  
       return con.name;
    }
    @AuraEnabled
         public static String retaccountdetails(Id id){
     List<account> acc = new List<Account>();
         acc = [Select id,name,billingaddress,(select name from contacts)  from account where id =:id];
         return acc[0].name+';'+acc[0].contacts[0].name;
    }   
     @AuraEnabled
     public static List<Contact> retaccountdetailslist(Id id){
     List<account> acc = new List<Account>();
     List<Contact> con = new List<Contact>();   
         acc = [Select id,name,billingaddress,(select id, name from contacts)  from account where id =:id];
         for (account ac:acc){    
             for(contact co:ac.contacts){
            		 con.add(co);
             }
         }
         
      return con;
    }
    
    }