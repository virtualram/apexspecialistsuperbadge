public class studentmastercustomeontroller {
    public string  name {get;set;}
    public integer age {get;set;}
    public devlight1973__StudentMaster__c stdmast;
    public pagereference pg;
    public pagereference save1(){
        stdmast = new devlight1973__StudentMaster__c();
        stdmast.name =name;
        stdmast.age__c =age;
        
        insert stdmast;
        pg.setRedirect(true);
        pg = new PageReference('/'+stdmast.id);
        return pg;
        
    }
}