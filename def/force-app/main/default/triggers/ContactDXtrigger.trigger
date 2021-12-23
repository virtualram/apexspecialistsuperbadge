trigger ContactDXtrigger on Contact (before insert,before update,before delete,after insert,after update,after delete) {
/*
if(Trigger.isbefore && trigger.isupdate){
    
    for(Contact c:trigger.new){
        
        if(c.lastname =='Capgemini' && trigger.oldmap.get(c.id).lastname =='DXC'){
            c.adderror('DXC cannot change to capgemini');
        }
    }
}


if(trigger.isdelete && trigger.isbefore ){
    
    for (Contact c:trigger.old){
        
        if (c.lastname=='DXC'){
            c.adderror('Cannot delete this record with name DXC');
        }
        
    }
  

if(trigger.isinsert && trigger.isbefore ){


    for (Contact c:trigger.new){
    
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

  for (Contact c:trigger.new){
  
      cs=  new Case();
      cs.contactid = c.id;
      cs.status ='New';
      cs.origin ='Web';
      cs.description ='My trigger didit';
      cslist.add(cs);
  
  
  }

insert cslist;

*/

}