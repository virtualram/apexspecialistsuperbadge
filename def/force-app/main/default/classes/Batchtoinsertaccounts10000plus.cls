global class Batchtoinsertaccounts10000plus implements Database.Batchable<sObject>{

global List<Account> acclist1 = new List<Account>();
Global account acc = new account();
global Batchtoinsertaccounts10000plus(){

    
Integer xx =0;
while(xx<2){
  acc = new Account();
    acc.name ='Studentrev'+xx;
    //insert acc;
    acclist1.add(acc);
    xx++;
}

//insert acclist1;
}

global Database.QueryLocator start(Database.BatchableContext BC){

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