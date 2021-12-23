public class GenericMultiSelectVersion2 {
    
   
 @AuraEnabled
    public static List<String> getPicklistvalues(String objectName, String field_apiname){
        List<String> optionlist = new List<String>();
        
        Map<String,Schema.SObjectType> gd = Schema.getGlobalDescribe(); 
        Map<String, Schema.SObjectField> field_map = gd.get(objectName.toLowerCase()).getDescribe().fields.getMap(); 
        
         List<Schema.PicklistEntry> pick_list_values = field_map.get(field_apiname).getDescribe().getPickListValues();
        
        for (Schema.PicklistEntry a : pick_list_values) 
        {
            optionlist.add(a.getValue());
        }
        return optionlist;
    }
    
    @AuraEnabled
    public static List<String> getcontactrels(String accid){
         List<String> optionlist = new List<String>();
        system.debug('accountid'+ accid);
    //     List<Connections__c> contactrels  = new List<Connections__c>();
       List<Account> relatedaccounts;
     //   contactrels=[select Relationship_R1__c,Relationship_R1__r.Name from Connections__c where Contact_C1__r.id =:accid];
        
        Set<Id>  accids = new Set<Id>();
   //     for (Connections__C cc:contactrels){
            
     //       accids.add(cc.Relationship_R1__c);
//            
     //   }
      //  
        System.debug('accountid'+accids);
        relatedaccounts = new List<account>();
     //   relatedaccounts =[select id,Name from account where id in :accids];
    //    for(Account ac:relatedaccounts){
      //   optionlist.add(ac.Id);
 	//	 optionlist.add(ac.id+'-'+ac.Name);
       //      optionlist.add(ac.id);
       //     optionlist.add(ac.Name);
      //  }   
        
        return  optionlist;
    }
    
    @AuraEnabled
    public static void updatePrimary(String accnid,string contid){
         
       /* system.debug('accountid'+ accnid);
        system.debug('ContactId'+ contid);
        Connections__c connects1 ;
         List<Connections__c> contactrels  = new List<Connections__c>();
        //  List<Connections__c> updatedContactrels  = new List<Connections__c>();
        contactrels=[select Relationship_R1__c,Relationship_R1__r.Name from Connections__c where Contact_C1__r.id =:contid ];//AND Relationship_R1__r.id =:accnid limit 1];
        
        for (Connections__C cc : contactrels){
            if(cc.Relationship_R1__r.id == accnid){
                cc.Primary_Rel__c = true;}else{ cc.Primary_Rel__c = false;}
                    
           
        }
        
         update contactrels;*/
       
} 
}