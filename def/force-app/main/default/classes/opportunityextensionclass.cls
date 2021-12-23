public class opportunityextensionclass {
 public  PageReference pg ;//redirect class
    public ApexPages.StandardController ourstdcontroller;//to access standard controller 
    public String stdName{get;set;}
  
    public  opportunity opp;
    
    public opportunityextensionclass(ApexPages.StandardController stdController) 
    {
        system.debug('extension constructor');
        this.opp = (opportunity)stdController.getRecord();
        ourstdcontroller = stdController;//now i can use the standard controller methods in my  
        //extension class
       
    }
    
    public PageReference saveandredirect(){
        //system.debug(ourstdcontroller.opportunities);
        
       // ourstdcontroller.save();
        pg = new PageReference('/'+ this.opp.id);
        pg.setRedirect(true);
        System.debug(this.opp.id);
        return pg;
    }
}