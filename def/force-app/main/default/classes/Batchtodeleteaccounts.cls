global class Batchtodeleteaccounts implements Database.Batchable<Account>{ 
   global list <account> acl= new list <account>();
   global Iterable<Account> start(Database.batchableContext info){ 
       acl= [select id,name from account limit 10];
        
       return  acl; 
   }     
   global void execute(Database.batchableContext info, List<Account> scope){ 
       List<Account> accsToUpdate = new List<Account>(); 
       for(Account a : scope){ 
            a.name = a.name +'_itcinfo' ;  
           accsToUpdate.add(a); 
       } 
      // delete accsToUpdate; 
       Database.update(accsToUpdate);
   }     
   global void finish(Database.batchableContext info){     
   } 
}