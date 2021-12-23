trigger t on Offering_Release__c (after update) {
Offering__c[] offer1;
String x{
get;
set;
}
String y{get;set;}
 for (Offering_Release__c a : Trigger.new) {
          //  x =  a.changeparentofferid__c;
            offer1 = [Select Id from Offering__c where name =:a.changeparentofferid__c];
           y = offer1[0].Id;
           
           
           a.Offering_ID_Master_Detail_Rel__c =y;
           }

}