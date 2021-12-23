public class Accounttriggerhandler implements itrigger {
    public void bulkbefore(){    
         //you can use trigger.newmap..... in here
    }
    
    public void beforeupdate(sobject so ,Sobject sold){
        Account accnew =  (Account) so;
        Account accold =  (Account) sold;
        if(accnew.name <> accold.name){
            accnew.adderror('Name cannot be updated');
        }
        
    }
    
   
    
}