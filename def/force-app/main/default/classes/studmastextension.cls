public class studmastextension {
    
    public  PageReference pg ;//redirect class
    public ApexPages.StandardController ourstdcontroller;//to access standard controller 
    public String stdName{get;set;}
    public Integer Age{get;set;}   
    public string myvariable{get;set;}
    public final studentmaster__c studmast;
    
    public studmastextension(ApexPages.StandardController stdController) 
    {
        system.debug('extension constructor');
        this.studmast = (studentmaster__c)stdController.getRecord();
        ourstdcontroller = stdController;//now i can use the standard controller methods in my  
        //extension class
        myvariable ='Walmart';
    }
    
    public PageReference saveandredirect(){
        system.debug(ourstdcontroller);
        
        ourstdcontroller.save();
        pg = new PageReference('/'+ this.studmast.id);
        pg.setRedirect(true);
        System.debug(this.studmast.id);
        return pg;
    }
    public PageReference saveandredirect2(){
        system.debug(this.studmast.Name);
     this.studmast.Name = stdname;
        this.studmast.age__C = Integer.valueOf(age);
       
        ourstdcontroller.save();
        pg = new PageReference('/'+ this.studmast.id);
        pg.setRedirect(true);
        
        return pg;
    }
    public string getWelcomeMsg ()
    {
        return 'Welcome' + studmast.name + 'to this session' ;
    }
}