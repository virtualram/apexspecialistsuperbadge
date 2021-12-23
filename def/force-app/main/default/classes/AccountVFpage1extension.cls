public class AccountVFpage1extension {
    public Apexpages.StandardController ourextncontroller ;
    public final Account extnacc ;    
    public PageReference pg;
    public String extvar1 { get;set ;}
    
    public AccountVFpage1extension (Apexpages.StandardController stdcontroller){        
        this.extnacc   =(Account)stdcontroller.getRecord();
        system.debug('construct'+extnacc);
        this.ourextncontroller = stdcontroller;   
        extvar1 ='i got created in extension';
    }
    
    public pagereference extensionsave(){ 
        system.debug('constructnot'+extnacc);
         this.ourextncontroller.save(); 
          system.debug('constructnot2'+ this.ourextncontroller.getRecord().id);
         
         pg= new PageReference('/'+ this.ourextncontroller.getRecord().id);
         pg.setRedirect(true);
          return pg;        
        
    }

     
}