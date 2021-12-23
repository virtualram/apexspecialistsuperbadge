public  class Exceptionhandler0 {
    public static void excpmethod(){
        try {            
         // Account acc =[select id , name from account  where name ='pop'];
          //  account acc = [select id from account limit 1];
          //  system.debug(acc.name);
         
            Account    acc = new Account();            
            acc.AccountNumber ='0';
           acc.name='Test';
            insert acc;
            // Causes an SObjectException because we didn't retrieve
            // the Total_Inventory__c field.           
        }
          catch(QueryException e){
             System.debug('Query Exception caught: ' + e.getMessage() +e.getTypeName());  
        }catch(DmlException e) {
            System.debug('DmlException caught: ' + e.getMessage()+e.getTypeName());    
        } catch(SObjectException e) {
            System.debug('SObjectException caught: ' + e.getMessage()+e.getTypeName());    
        } catch(Exception e) {
            System.debug('Exception caught: ' + e.getMessage()+e.getTypeName());    
        }
      
        
    }}