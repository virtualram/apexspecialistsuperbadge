trigger checks on Lead (before delete, before insert, before update, after delete, after insert, after update,after undelete) {
                                    
                                    
     if (Trigger.isbefore){
     
         if (trigger.isinsert){     
             system.debug('Value of trigger.new is in beforeinsertis :'+trigger.new );
              system.debug('Value of trigger.old is in beforeinsertis :'+trigger.old );         
         }     
         
     
     
         if (trigger.isupdate){     
             system.debug('Value of trigger.new is in beforeupdate is :'+trigger.new );
              system.debug('Value of trigger.old is in beforeupdate is :'+trigger.old );         
         }     
         
         
          if (trigger.isdelete){     
             system.debug('Value of trigger.new is in beforedel is :'+trigger.new );
              system.debug('Value of trigger.old is in beforedel is :'+trigger.old );         
         }    
     
     }   
     
      if (Trigger.isafter){
     
         if (trigger.isinsert){     
             system.debug('Value of trigger.new is in afterinsertis :'+trigger.new );
              system.debug('Value of trigger.old is in afterinsertis :'+trigger.old );         
         }     
         
     
     
         if (trigger.isupdate){     
             system.debug('Value of trigger.new is in afterupdate is :'+trigger.new );
              system.debug('Value of trigger.old is in afterupdate is :'+trigger.old );         
         }     
         
         
          if (trigger.isdelete){     
             system.debug('Value of trigger.new is in afterdel is :'+trigger.new );
              system.debug('Value of trigger.old is in afterdel is :'+trigger.old );         
         }   
         
         
         
         if (trigger.isundelete){     
             system.debug('Value of trigger.new is in afterunddel is :'+trigger.new );
              system.debug('Value of trigger.old is in afterundel is :'+trigger.old );         
         }   
     
     }   
     
                                      

}