trigger Accountriggermodule1 on Account (before insert,before update ,before delete,after insert,after update ,after delete) {
  
    if (Trigger.isBefore){
        
        if(Trigger.isDelete){// id is not included in the query but is always returned in any soql and gets placed in the string part of the map
             Map<String,Contact> mpcontacts = new Map<String,Contact>([select accountid from contact where accountid in :trigger.oldmap.keyset()]);
             
              set<Id> accountidset = new Set<Id>();
              
              
             for(Contact m:mpcontacts.values()){
               accountidset.add(m.accountid);
             }
             
            
             system.debug(mpcontacts+'map of contact');
            for (Account a:Trigger.old){
               if (accountidset.contains(a.id)){ 
                a.adderror('Account with contacts cannot be deleted in this org once created');
                }
            }
        }
    }
    
    
}