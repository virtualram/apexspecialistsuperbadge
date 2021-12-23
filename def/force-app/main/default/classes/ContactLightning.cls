public class ContactLightning {
 public static Contact con;
   
    @AuraEnabled
    public static String getSave(String conname,String connumber,STring accid){
        try{
            con = new Contact();
            con.lastName = conname;
            con.devlight1973__Aadhar__c = connumber;
            con.accountid = accid;
            // system.debug(conname+String.valueOf(connumber)+'test');
         //   con.Type = type;
            insert con;             
        }catch(exception e){
            return e.getMessage();
        }
        return con.id;      
    }    
}