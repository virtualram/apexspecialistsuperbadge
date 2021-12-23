public class Contacttriggerhandler {
    
    public static void handler1(List<Contact> listofnewcontact ,List<Contact> listofoldcontact,
                                Map<Id,Contact> mapofoldcontacts ){
        if(Trigger.isbefore){
        if(Trigger.isInsert ){        
        for(Contact ac:listofnewcontact){
                if(ac.LastName == 'Java'){
                    ac.addError('Java cannot be added as contact');
                }
            }
          }
        
         if(Trigger.isUpdate ){        
           for(Contact ac:listofnewcontact){
                if(mapofoldcontacts.get(ac.id).LastName == 'ITCinfotech' && ac.LastName =='Capgemini'){
                    ac.addError('NAme of itcinfotech contact cannot be changed to capgemni');
                }
            } }
        
        if(Trigger.isDelete ){        
            for(Contact ac:listofoldcontact){
                if(ac.LastName == 'ITCinfotech'){
                    ac.addError('ITC cannot be deleted');
                }
            }
        }
    } if(Trigger.isafter && Trigger.isinsert) {
       case cs ; 
        Id recid = [select id from recordtype where name ='Inquiry'].Id;
        //we are queruing for the record type inquiry
        
        for (Contact c:listofnewcontact){
            cs = new Case();
            system.debug(c.id);
            cs.ContactId = c.id;
            cs.RecordTypeId = recid;
            cs.Status ='New';
            cs.Origin ='Web';
            cs.BusinessHoursId = '01m90000000aZsyAAE';
            insert cs;
        }
    }
        
        
    }

}