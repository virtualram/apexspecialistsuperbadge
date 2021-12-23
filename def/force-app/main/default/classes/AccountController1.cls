public class AccountController1 {
    public Boolean togglescreen1{get ;set;}  
        public Boolean togglescreen2{get ;set;}  
    public Account accts{get;set;}
    public ApexPages.StandardController ourstdController ;
    public AccountController1(ApexPages.StandardController stdController) 
    {
        
        
    this.accts = (account)stdController.getRecord();
    ourstdcontroller = stdController;//now i can use the standard controller methods in my  
         //extension class
       
         togglescreen1 = False;
           togglescreen2 = False;
        system.debug('in constructore');
      }
   
    
  @AuraEnabled
  public static List<Account> getAccounts() {
    return [SELECT Id, name, industry, Type, NumberOfEmployees, TickerSymbol, Phone
    FROM Account ORDER BY createdDate ASC];
  }
    
}