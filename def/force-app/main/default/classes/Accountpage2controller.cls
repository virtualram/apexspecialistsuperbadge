public class Accountpage2controller {

     public PageReference pg;
    public string accname{get;set;}
    public string accnumber{get;set;}
    public Account acc{get;set;}
    
     @AuraEnabled
    
    public static Account fetchaccount(Id Idd){
        Account acc ;
        String accstring = '';
        acc = [Select id,name,accountnumber,Type,Industry from account where id =:idd];
        
        //     return accstring;
        return acc;
        
    }
    

     @AuraEnabled
      public static String customsave1(String accname1 ,String accnumber1){
        
        Account acc1 = new Account();
          try{
        acc1.Name = accname1;
        acc1.Accountnumber = accnumber1;
        insert acc1;
          }catch(exception e){
              
              system.debug(e.getMessage());
               return(e.getMessage());
          }
        return acc1.id;
    }  
    
    
    @AuraEnabled
      public static String customedit1(Id Idd,String accname1,String accnumber1){
        Account acc1 = [select id,name,accountnumber from account where id =:Idd ];
          try{
        acc1.Name = accname1;
        acc1.Accountnumber = accnumber1;
        update acc1;
          }catch(exception e){              
              system.debug(e.getMessage());
              return(e.getMessage());
          }
        return acc1.id;
    }  



    public PageReference customsave(){
        try{
        acc = new Account();
        acc.Name = accname;
        acc.Accountnumber = accnumber;
        insert acc;
        pg=new PageReference('/'+acc.id);
        pg.setRedirect(true);
       
        }catch (exception e){
            system.debug(e.getMessage());
            Apexpages.message msd= new apexpages.message(Apexpages.severity.error,e.getMessage());
            apexpages.addMessage(msd);
        }   
            
            return pg;
    }  
    
    
    
    
    
}