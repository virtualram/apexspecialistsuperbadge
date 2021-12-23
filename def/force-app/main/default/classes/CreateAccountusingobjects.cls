public with sharing class CreateAccountusingobjects {
    public static void accountlistcreate(){
        try{  
            List<Account> acclist = new List<Account>();
            Account acc ;
            integer ct =0;
            while (ct <4){    
                acc = new Account();
                acc.name = 'TestDell50'+ct;  
                if(ct ==2){
                    acc.AnnualRevenue = 90; 
                }else{
                    acc.AnnualRevenue = 101;  
                }
                acclist.add(acc);
                ct++;
             // insert(acclist);
               Database.saveResult[] srlist = Database.insert(acclist,false);//single list insert statement to bypass governor limits
                for(Database.SaveResult s:srlist){
                    if(s.isSuccess()){
                        
                        system.debug('REcord is created successfully');
                    }else {
                        
                                    for(database.Error er:s.getErrors()){
                                        system.debug('REcord failed'+er.getMessage());                            }
                    }}
                    
                }
            }catch(Exception e){
                
                system.debug(e.getMessage());
            }
        }
        

        
    
    
    
    
    
    public Id createaccountobj(){
        
        integer  x =0;
        Account acc1 = new Account();
        acc1 =  new Account(Name ='Dell Alienware'+x);
        insert acc1;    
        return acc1.id;         
        
    }   
    
    public static List<Contact> fetchaccountcontactslist(){
        
        List <Account> acclist = new List<Account>();
        List <Contact>  ct = new List<Contact>();
        acclist = [select id,name,(select id,name from Contacts) from Account];
        system.debug(acclist);
        for(Account acc:acclist){    
            System.debug(acc.name +':'+acc.contacts);
        }
        return   ct;   
    }
    
    
    
    
}