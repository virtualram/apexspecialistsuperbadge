public class studemastextension1 {
    public String Welcomemsg  {get;set;}
    
    public StudentMaster__c stdmast{get;set;}
    public Apexpages.StandardController ourstdcontroller;     
    public PageReference pg;
    public  studemastextension1(apexpages.StandardController apxstdcontroller){
        this.stdmast =(devlight1973__StudentMaster__c)apxstdcontroller.getRecord();
        this.ourstdcontroller = apxstdcontroller;        
        
    }
    public PageReference saveandredirect(){
           Welcomemsg ='Hello capgemini';
          system.debug(this.stdmast.devlight1973__Age__c);
         this.ourstdcontroller.save();  
             system.debug(this.stdmast.devlight1973__Age__c);
         pg = new PageReference('/'+this.stdmast.id);
         pg.setRedirect(true);
         return pg;
       
    }
    
    
      

}