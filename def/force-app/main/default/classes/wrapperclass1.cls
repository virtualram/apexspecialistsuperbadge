public class wrapperclass1{
    @AuraEnabled
    public boolean selected1 {get; set;}
    @AuraEnabled
    public Contact coo {get; set;} 
 
    public  wrapperclass1(Contact c,boolean f){    
    selected1 = f;
    coo =c;    
    
     }  
    }