public class contactextension {
    
 public  PageReference pg ;//redirect class
 public ApexPages.StandardController ourstdcontroller;//to access standard controller 
 public String stdName{get;set;}
    public Boolean togglescreen{get ;set;}  
        public Boolean togglescreen1{get ;set;}  
    
    
public string myvariable{get;set;}
    
    public final Contact cont;    

    public Contactextension(ApexPages.StandardController stdController) 
    {
        
        
    this.cont = (contact)stdController.getRecord();
        system.debug(this.cont);
    ourstdcontroller = stdController;//now i can use the standard controller methods in my  
         //extension class
         togglescreen = False;
         togglescreen1 = False;
        system.debug('in constructore');
      }
    public void changetogglevalue(){
        system.debug(togglescreen+'inside changetogglevalue');
        
        
         //   togglescreen = True;//}
    }
    public PageReference saveandredirect(){
        system.debug(ourstdcontroller);
        try{
           this.cont.devlight1973__Level__c ='Primary';
         ourstdcontroller.save();
        }
        catch(exception e){
            
            apexpages.Message msg= new Apexpages.MEssage(apexpages.severity.FATAL,e.getMessage());
        }
        pg = new PageReference('/'+ this.cont.id);
        pg.setRedirect(true);
        System.debug(this.cont.Id);
        return pg;
    }
   
    public string getWelcomeMsg ()
    {
        return 'Welcome' + Contact.name + 'to this session' ;
    }
}