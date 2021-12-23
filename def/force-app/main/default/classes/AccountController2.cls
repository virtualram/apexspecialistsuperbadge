public class AccountController2 {
    public class wrapper1{
        public   account acc{get;set;}
        public   boolean selectaccount{get;set;}
        public wrapper1(account ac ,boolean selected){
            acc = new account();
            acc = ac;
            selected =selected;
        }
     
    
    
    }  
    
    public boolean selectaccount{get;set;}
    public account acc{get;set;}

     public List<wrapper1> wrplist{get;set;}
      public List<wrapper1> wrplist2{get;set;}
 
    public wrapper1 wrp{get;set;}
  public void accwrapit(List<account> acclist){
            
         
            wrplist = new list<wrapper1>();
    
            for (account a:[select NAME from account limit 10]){
                 wrp =  new wrapper1(a,false);
          
                wrplist.add(wrp);
                
            }system.debug(wrplist);}
    
    //
     
   
     //
     //
      public void addthis(){
       
   wrplist2 = new list<wrapper1>();
       system.debug(wrplist);
        for (wrapper1 aw:wrplist){ 
            system.debug('test'+aw.selectaccount);
            if(aw.selectaccount == true)
                wrplist2.add(aw);
            
        }  system.debug('second list'+wrplist2);}
    
    
    
    public AccountController2 ac{get;set;}
    
      public List<account> acclist{get;set;}
    //  public void addthis(){
         //   addthis2();
       
        
  //  }
    public accountcontroller2(){
        if(acclist==null){
     acclist  = new List<account>();
     acclist=   [select Name,type,rating from account limit 10];
        }      
     //  ac = new wrapper1();
    
      //  ac.accwrapit(acclist,false)
         accwrapit(acclist);
            
    }    
   
    @AuraEnabled
    public static List<Account> findAll() {
        return [SELECT id, name, phone FROM Account LIMIT 50];
    }
    @AuraEnabled
    public static List<Account> findByName(String searchKey) {
        String name = '%' + searchKey + '%';
        return [SELECT id, name, phone FROM Account WHERE name LIKE :name LIMIT 50];
    }
    @AuraEnabled
    public static Account findById(String accountId) {
        return [SELECT id, name,  phone
                    FROM Account WHERE Id = :accountId];
    }}