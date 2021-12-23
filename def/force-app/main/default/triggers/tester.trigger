trigger tester on Detailhotelbillitems__c (after update) {
Detailhotelbillitems__c dtl = new Detailhotelbillitems__c 
( Name='Gangasagar',  billvalue__c = 600,billnumber__c =50);
insert dtl;
 
}