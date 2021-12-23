public class alltriggerhandler {    
    public static itrigger handler;    
   
    public static void gethandler(Schema.SObjectType sotype){
        if(sotype == Account.sobjecttype){
           handler = new Accounttriggerhandler();
        }
        if(handler == null){
            system.debug('Handler for account does not exist');
        }else{ 
             String Name = [select name from Profile where id =:userinfo.getProfileId()].name;
            if(Trigger.isbefore && trigger.isupdate){                
                for (Sobject a:trigger.new){  
                   // if(Name <>'System Administrator'){
                        handler.bulkbefore();
                        handler.beforeupdate(a,trigger.oldmap.get(a.id));
                    //} 
                }               
            }
        }
        
    }

}