public with sharing class ContactclassforVF {
    public String contactname {get;set;}
    public String contactemail {get;set;}
    public Contact con{get;set;}
    public String contactid {get;set;}
    public String errormessage {get;set;}
    public PageReference  pg{get;set;}
    public List<Contact> reclist{get;set;}
    
    //   public  pagereference Save1()
    public  void Save1()
    {   errormessage='No errors so far';
     try{
         con = new Contact();
         system.debug(contactname);
         con.Lastname =contactname;
         con.email = contactemail;
         insert con;
         contactid = con.id;
         //  pg = new pagereference('/'+con.id);
         //    pg.setRedirect(true);
         getlist();
     }
     catch(exception e){
         errormessage =e.getMessage();
     }
     //return pg ;  
    }
    
    public void getlist(){
        
        reclist = new List<Contact>();
        reclist =[select id,Name,Email from contact where createddate = today];
        
    }
    
}