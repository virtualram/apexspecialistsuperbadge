public with sharing class customcontrolleraccountsave {
public account acc = new Account();
public String accountnamevariable {get;set;}
Public Pagereference pg;
 public Pagereference savemyrecord(){
 
   acc = new Account(Name = accountnamevariable);
   insert acc;
   pg = new PageReference('/'+acc.id);
   system.debug(acc.id);
   pg.setredirect(true);
   return pg;
      //error handling in try catch for validation rules or other criteria checking
      // ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'testetst'or e.message));
}}