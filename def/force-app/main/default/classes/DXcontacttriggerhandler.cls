public with sharing class DXcontacttriggerhandler {
    public static void handler1(list<contact> newrec ,list<contact> oldrec,map<Id,contact> oldmap){
        
        ////////
        
if(Trigger.isbefore && trigger.isupdate){
    
    for(Contact c:newrec){
        
        if(c.lastname =='Capgemini' && oldmap.get(c.id).lastname =='DXC'){
            c.adderror('DXC cannot change to capgemini');
        }
    }
}


if(trigger.isdelete && trigger.isbefore ){
    
    for (Contact c:oldrec){
        
        if (c.lastname=='DXC'){
            c.adderror('Cannot delete this record with name DXC');
        }
        
    }
  

if(trigger.isinsert && trigger.isbefore ){


    for (Contact c:newrec){
    
             if (c.lastname=='nonDXC'){
             c.adderror('Cannot add this record with name nonDXC');
             }else{
         c.Title ='Dr';
                 c.phone='123456789';}
 
        
  }

}}

Case cs ;
List<case> cslist = new List<case>();

if(Trigger.isafter && Trigger.isinsert)

  for (Contact c:newrec){
  
      cs=  new Case();
      cs.contactid = c.id;
      cs.status ='New';
      cs.origin ='Web';
      cs.description ='My trigger didit';
      cslist.add(cs);
  
  
  }

insert cslist;


        
        
        
        //
        //
        
        
        
    }

}