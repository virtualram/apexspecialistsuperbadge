public with sharing class GetContacts {
    public String strX {
        get;set;
    }
    public List<Account> accts {
        get{return [Select id, Name from Account]; }
      
        set;
    }
    @RemoteAction
    public static String testjsremoting(){
    return 'js remoting works';
    }
    public String myTestString{
    get;
    set;
    }
     public List<Contact> contacts { 
      get;   
      set;
    }
    public String aName {
        get;set;
    }
    public String arvn {
        get;set;
    }
    public String arvt {
        get;set;
    }
    public String aparentoffer {
        get;set;
    }
    public Integer seqc {
        get;set;
    }
    public Offering_Release__c ofr;
    
  
    
    public PageReference TestX() {
        strX = ApexPages.currentPage().getParameters().get('X');
      //  idd = strX;
        return null;
    }
    public  PageReference TestX1() {
        // offerrelease1.add();
      // myTestString = '0019000000KQbTjAAL' ; 
      ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'this is test error message'));
      // contacts = Database.query('SELECT Id,Name FROM Contact WHERE Account.Id = :strX OR Email = :arvt OR Phone =:arvn ');
        return null;
    }
}