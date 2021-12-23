trigger testit on Offering__c (after insert) {

Offering_Release__c  ofr = new Offering_Release__c();
ofr.Name = 'test';
ofr.Release_Name_Text__c='test';
ofr.Release_Version_Text__c ='test';
ofr.Offering_ID_Master_Detail_Rel__c ='a079000000Di7NJ';

insert ofr;
}