@isTest
public class testcontrol{
 public PageReference pg ;
public void testcontrol(){

 
testthis();
}

public   static testmethod  void testthis(){
PageReference pg = new PageReference('/pages/OfferOffereleaseVF');
OfferOffereleaseVF_customController1 ct = new OfferOffereleaseVF_customController1();
Test.setcurrentpage(pg); 
Test.startTest();
    List <Offering__c> x = ct.offer;
            List<Offering_release__c> y = ct.offerrelease1;
            
// List <Core_Team_Member__c> c = ct.ctm();
ct.TestX1();


Test.stopTest();

}



}