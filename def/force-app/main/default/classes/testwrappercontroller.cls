public with sharing class testwrappercontroller {
    
    //createing a list for wrapper class object
    // always try to create list seperately outside
    //    constructor and return it rseperately
    //the key concept here is to create list and other variablesotuside
    //the constructor.remeber the constructor does not always create all list variable
    //variable get methods fire independently of constrcutor,where everthe the get set is defined for
    //the variable
    //
    //   
    public List<Contact> colist {get;set;}
    public  List<wrapperclass1> wpl {get;
                                     /*{
                                      * //best practise ,dont intialise wrapper class in get,do it in constructor
        */
        set;}  
    
    public  testwrappercontroller(ApexPages.StandardController controller){
       
        colist =[Select Id,lastname,firstname from Contact limit 10];        
        wpl = new List<wrapperclass1>();
        for (Contact co:colist){            
            wpl.add(new wrapperclass1(co,false));            
            system.debug('hi');    
}
    }
    
    public void save(){
        Wrapperclassdeletevar.contactdelmap =new Map<id,boolean>();
        for (wrapperclass1 w:wpl){
            system.debug(w.coo.lastname+w.selected1);
             Wrapperclassdeletevar.contactdelmap.put(w.coo.id,w.selected1);
            
        }
        update colist;
        
    }
    
    public void save1(){
        
        for (wrapperclass1 w:wpl){
            system.debug(w.coo.lastname+w.selected1+'test');
        }
        //  update colist;
        
    
    
    
}


}