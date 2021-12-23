public class Accountpaginatecontroller {
     public Boolean active {get;set;}
    public List<account> accountlist {get;set;}
    public Apexpages.StandardSetController accset ;
    transient public string qry ='';
    
    
    public Id accountid {get;set;}
    public string accountname {get;set;}
    
    public Accountpaginatecontroller (){        
        fetchaccounts();
        active =true;
    }
    
    public void fetchaccounts(){
        // accountlist =  new List<Account>([select id,name from account]);
        qry = 'select id,name from account';
        accset =new  Apexpages.StandardSetController(Database.getQueryLocator(qry));
        accset.setpagesize(4);
        accountlist = (list<Account>) accset.getRecords();
    }
    
    public void nextpage(){
        
        accset.next();
        accountlist = (list<Account>) accset.getRecords();
        
        if(accset.gethasprevious()){
            active= false;            
        }
        
    }
    
    public void prevpage(){
        
        //  accset.next();
        //   accountlist = (list<Account>) accset.getRecords();
        
    }
    
    
    public void updateaccount(){
       String str1= String.valueOf(ApexPages.currentPage().getParameters().get('accountid'));
     String str2= ApexPages.currentPage().getParameters().get('accountname1');
        system.debug(accountname+str2);
        // List<Account> ac = new List<Account>();
        Account ac = new Account();
        ac =[select id,name from account where id =:accountid limit 1];
        
        if(ac!=null){
            ac.name = accountname;
            system.debug(ac.name +accountname+str2+accountname+'actionsupportfired');
            try{
              update ac;   
                
            }  catch(Exception e){
                system.debug(e.getmessage()+'error');
            }     
        }   
    }
    


}