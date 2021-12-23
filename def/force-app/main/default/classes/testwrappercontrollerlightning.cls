public class testwrappercontrollerlightning {
    
    
    
    
    //createing a list for wrapper class object
    // always try to create list seperately outside
    //    constructor and return it rseperately
    //the key concept here is to create list and other variablesotuside
    //the constructor.remeber the constructor does not always create all list variable
    //variable get methods fire independently of constrcutor,where everthe the get set is defined for
    //the variable
    //
    //   
    @AuraEnabled    
    public static List<Contact> colist {get;set;}
    @AuraEnabled  
    public static  List<wrapperclass1> wpl {get;                                       
                                            set;}  
    
    public  testwrappercontrollerlightning(){      
        
    }
    
    
    @AuraEnabled 
    public static List<wrapperclass1>  getrecs(){
        
        colist =[Select Id,lastname,firstname from Contact limit 10];        
        wpl = new List<wrapperclass1>();
        for (Contact co:colist){            
            wpl.add(new wrapperclass1(co,false));            
            system.debug('hi');    
        }
        return wpl;
    }
    
    @AuraEnabled
    public static void save(){
        
        for (wrapperclass1 w:wpl){
            system.debug(w.coo.lastname+w.selected1);
        }
        update colist;
        
    }
    @AuraEnabled
    public static void save1(){
        
        for (wrapperclass1 w:wpl){
            system.debug(w.coo.lastname+w.selected1+'test');
        }
        //  update colist;
        
        
        
        
    }
}