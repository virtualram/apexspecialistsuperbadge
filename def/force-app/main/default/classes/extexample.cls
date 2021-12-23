public with sharing class extexample {
  private studentmaster__c stdmast;
  public String DateStringProperty {get;set;}
 
   public extexample(ApexPages.StandardController stdcontroller){
   
     this.stdmast = (studentmaster__c)stdcontroller.getRecord();
      
   }
   public String getwelcomemsg(){
   DateStringProperty = Date.Today().format(); 
   return   stdmast.name  +' Welcome to the Jungle';
      
   }
   
   

}