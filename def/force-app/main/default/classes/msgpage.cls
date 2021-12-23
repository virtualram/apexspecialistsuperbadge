public with sharing class msgpage{
public String testvar {get;set;}

     public  msgpage(){
         ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'testetst'));
        testvar ='has value';
     }



}