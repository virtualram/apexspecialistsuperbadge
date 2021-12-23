@isTest 
public with sharing class Testbrandnewclass{
    static testMethod void Testmycontroller() {      
    Accountpage2controller ac = new Accountpage2controller();
        ac.accname ='testdata1';
        ac.accnumber ='900';
        ac.customsave();
     Account acc  =new Account();
        acc.name='testdata111111';
        acc.accountnumber ='901';        
        insert acc;        
        system.debug(acc.id);
         Accountpage2controller.fetchaccount(acc.id);
          Accountpage2controller.customedit1(acc.id,acc.name,'23');
         Accountpage2controller.customsave1('asdfasdfasdfadsfadsfadsf','23');     
    }

    
    
    
}