global class updateaccountnumber implements Database.Batchable<SObject>{
public Integer serials =5001;
public List<Account> lstaccount = new List<Account>();
void updateaccountnumber()
{
//serials =1001;
}

global Database.QueryLocator start(Database.BatchableContext BC){
  return Database.getQueryLocator('select Id,AccountNumber,Name,registernum__c from Account');
}

global void execute(Database.BatchableContext BC,List<Account> scope){

system.debug(scope.size());
 for (Account s:scope){
     s.registernum__c = serials;
     /* Account a = (Account)s;
     a.registernum__c = serials+1;
     a.Name ='Name'+'test';
    lstaccount.add(a);*/
    serials++;
   
    
 }
        update scope;
//update lstaccount;
}


global void finish(Database.BatchableContext BC){
}


}