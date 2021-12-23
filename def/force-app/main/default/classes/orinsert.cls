Public class orinsert{
public ApexPages.StandardController controller;
//Public Account acc{get; set;}
Public Offering_Release__c offerreleaseins = new Offering_Release__c();
Public String aName {get; set;}
Public String aManufactureNamec {get; set;}
Public String aLName {get; set;}
Public String aStreet {get; set;}
Public String aEdu {get; set;}


public orinsert(ApexPages.StandardController Controller)
{
   offerreleaseins=(Offering_Release__c)Controller.getRecord();
    this.controller=Controller;
    
    

}
public orinsert(){}


public PageReference Save()
{
      
      insert  offerreleaseins;
       return null;
}


}