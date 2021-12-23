public with sharing class customController {

    public  List<Offering__c> offer { 
    get{
   List<Offering__c> offer1;
        offer1 = [Select id, Name,Description_Text_Area__c from Offering__c];
        return offer1;
    }  
    
     
    
    
     set; }
     
     public  List<Offering_Release__c> getofferrelease(String id)
     {
     
      List<Offering_Release__c> offerrelease;
      offerrelease = [Select Offering_ID_Master_Detail_Rel__r.Id, id, Name,Release_Name_Text__c from Offering_Release__c where Offering_ID_Master_Detail_Rel__r.Id = :id ];
        return offerrelease ;
    
        }
     
}