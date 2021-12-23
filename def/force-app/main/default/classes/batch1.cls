global class batch1 implements Database.Batchable<sObject>{

global batch1(){

}

global Database.QueryLocator start(Database.BatchableContext BC){
return Database.getQueryLocator('Select id,Name from Account');
    return Database.getQueryLocator('Select id,Name from Account');
}    

global void execute(Database.BatchableContext BC,List<Account> scope){

List <Account> lstAccount = new list<Account>();
//for(Sobject s : scope)
for(Account s : scope)
{

  s.name ='test11';
/*
Account a =(Account)s;
 a.Name =a.Name+'test1';
  lstAccount.add(a);
  */
}
//update lstAccount;
update scope;
}
global void finish(Database.BatchableContext BC){

}



}