public with sharing class studentmastercustomcontroller {    
    public pagereference pg;
    public devlight1973__StudentMaster__c stdmast;
    public Integer age{get;set;}
    public String Name{get;set;}
    
    
    public pagereference save1(){        
        
        try{
            stdmast = new  devlight1973__StudentMaster__c();
            stdmast.devlight1973__Age__c = age;
            stdmast.Name = Name;
            insert stdmast;
            pg = new PageReference('/'+this.stdmast.id);
            pg.setRedirect(true);}
        catch (exception e){
            Apexpages.Message x = new Apexpages.Message(Apexpages.Severity.error,e.getMessage());
            system.debug(e.getMessage());
        }        
        return pg;
    }
    
    
    public pagereference cancel1(){        
        
        pg.setRedirect(true);
        pg = new PageReference('/');
        return pg;
    }
    
}