public  with sharing class AuraApexforContact {
 public static String Name ='';
   @AuraEnabled public static String getcontactname(String contactid){
        try{
        Name = [select name from contact where id  = :contactid limit 1].Name;
        }catch(Exception e){
            
            return e.getMessage();
        }
        return Name;
    }

}