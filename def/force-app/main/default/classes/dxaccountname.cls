public with sharing class dxaccountname {
    @AuraEnabled
    public static List<contact> getcontacts1(String accid){
        
        List<Account> acc = new List<account>();
        
        acc = [select id,name ,(select id,lastname from contacts) from account where id =:accid];
        system.debug(acc[0].contacts[0].lastname);
        
      //  return acc[0].contacts[0].lastname;
         return acc[0].contacts;       
    }

}