public class Accountriggerclass {
    
    public static void triggerhandler(List<account> newacclist,List<account> oldacclist,Map<Id,Account> mapac){
        
    
        Contact cont;
      if(trigger.isafter && trigger.isinsert){
     for(Account ac:newacclist){
     cont = new Contact(lastName='Contactfromtrigger1'+ac.name,accountid = ac.id);
     insert cont;
    } 
 
 } 
 


if(trigger.isbefore && trigger.isDelete){
    
  List<Contact> contlist= new List<contact>();
//    contlist =[select accountid from contact where accountid in :trigger.oldmap.keyset()];
     contlist =[select accountid from contact where accountid in :trigger.old];
    for(Account ac:oldacclist){
        for (contact c:contlist){
            
            if(ac.id == c.accountid){
                ac.adderror('cannot delete account as contact exists');
            }
        }
    }
    
      
     for(Account ac:oldacclist){
     if(ac.name =='Testnodelete'){
         ac.addError('User cannot delete this record');
         }
    } 
 
 } 
 
  if(trigger.isbefore && trigger.isInsert){
   for(Account ac:newacclist){    
       ac.accountnumber ='777';
       }   
   }   
   
   
  if(trigger.isbefore && trigger.isUpdate){
   for(Account ac:newacclist){ 
   if (ac.name  <> mapac.get(ac.id).name){
        ac.addError('Name change of account is not allowed');
    }
    
     } 
   
   }
  
 
    }
  
}