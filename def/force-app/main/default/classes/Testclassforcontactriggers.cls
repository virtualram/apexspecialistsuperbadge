@isTest
public class Testclassforcontactriggers {
    static testmethod void testthesecode(){
        Test.startTest();
         Contact c = new Contact();
         c.LastName = 'Tomandjerry';
         c.devlight1973__Aadhar__c ='999';
          insert c;         
           c.LastName ='Jerryandtom';
           update c;
        Test.stopTest();
    }
}