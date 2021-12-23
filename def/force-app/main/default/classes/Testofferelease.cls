@isTest(SeeAllData=true) public with sharing class Testofferelease{
static OfferOffereleaseVF_customController1  controller;
    static{
        
        controller = new  OfferOffereleaseVF_customController1();
    }
    
    static testMethod void TestX() {
        try {
            System.debug('jiasha');
            controller.TestX();
            controller.TestX1();
            List <Offering__c> x = controller.offer;
            List<Offering_release__c> y = controller.offerrelease1;
            
            
        } catch(Exception e) {
            system.debug('Error in TestX ' + e.getMessage());
        }
    }

    
    
    
}