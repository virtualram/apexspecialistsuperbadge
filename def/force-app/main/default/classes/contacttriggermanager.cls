public with sharing class contacttriggermanager{
    public static void runtrigs(List<Contact> contnew,List<Contact> contold){
    
       Account acc= new Account();
       acc = [select id from account where name  ='TestDell300'];
    
     if(Trigger.isBefore && Trigger.isDelete){ 
    
    for (contact c:contold)
    {
    if(c.lastname=='TestDell'){
      
       c.addError('Cannot delete contact name with Dell');
    }  } } 
    
     if(Trigger.isBefore && Trigger.isInsert){ 
    
    for (contact c:contnew)
    {
        c.department ='IT Department';
        c.accountid = acc.Id;
    }  } }

}