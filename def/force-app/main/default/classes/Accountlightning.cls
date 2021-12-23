public with sharing class Accountlightning {
    
    public void Accountlightning(){    }
    public static Account acc;
    
    @AuraEnabled
    public static String getSave(String accname,String accnumber,String Type,String Industry){
        try{
            acc = new Account();
            acc.Name = accname;
            acc.accountnumber = accnumber;
            acc.type =Type;
            acc.Industry = Industry;
            insert acc;             
        }catch(exception e){
            return e.getMessage();
        }
        return acc.id;      
    }    
    @AuraEnabled
    public static String Edit1(String accname,String accnumber,String idd,String Type,String Industry){
        try{
            acc = [Select id,name,accountnumber,type from account where id =:idd];
            system.debug('typ'+Type);
            acc.Name = accname;
            acc.accountnumber = accnumber;
            acc.type = Type; 
            acc.Industry = Industry;
            update acc; 
            system.debug(acc.Id+acc.Type+'43');
        }catch(exception e){
            return e.getMessage();
        }
        return acc.id;        
    }    
    
    @AuraEnabled
    // public static String fetchaccount(Id Idd){
    public static Account fetchaccount(Id Idd){
        
        String accstring = '';
        acc = [Select id,name,accountnumber,Type,Industry from account where id =:idd];
        system.debug('42'+ acc+acc.Type);
        //     return accstring;
        return acc;
        
    }
    
    @AuraEnabled
    public static String  deleteaccount(Id Idd){
        try{ 
            acc = [Select id,name,accountnumber,Type from account where id =:idd];
            delete acc;
            return  'Deleted';
        } catch(Exception e){
            
            return e.getMessage();
        }
    }
    
    
    @AuraEnabled     
    public static List<String> getpickvals(String Fieldname)
    {	
   Map<String, Schema.SObjectField>  sfields =Schema.getGlobalDescribe().get('Account').getDescribe().fields.getMap(); 
     List<Schema.PicklistEntry> fle  ;
         List<String> options = new List<String>();
         List<String> options1 = new List<String>();
           List<String> options2 = new List<String>();
     for (String sfield:sfields.keyset()){
       
         if (sfield ==Fieldname){
                  system.debug(sfield);
               Schema.DescribeFieldResult dr = sfields.get(sfield).getDescribe(); 
         	 fle  = dr.getPicklistValues();
              for (Schema.PicklistEntry p:fle){
          			  options1.add(p.getValue());
        		}
             options = options1;
         }
         
 	 
         
     }  
       
  
       
        return options;
    }
    /*
@AuraEnabled     
public static List<String> getpickvals()
{	
Schema.DescribeFieldResult fieldresult = Account.Type.getDescribe();
List<Schema.PicklistEntry> fle = fieldresult.getPicklistValues();
List<String> options = new List<String>();
for (Schema.PicklistEntry p:fle){
options.add(p.getValue());
}
return options;

} */
}