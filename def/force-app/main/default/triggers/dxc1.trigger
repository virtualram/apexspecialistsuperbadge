trigger dxc1 on StudentMaster__c (after insert) {

List<contact> clist = new List<contact>();
contact c;
//create contacts for the student
      if(trigger.isafter && trigger.isinsert){
      
          for(studentmaster__C std:trigger.new){
          
          
              c = new contact();
              c.lastname = std.name;
              c.email = std.devlight1973__EmailId__c;
              c.phone= std.devlight1973__Studentphone__c;
              
              clist.add(c);
          }
          insert clist;
          system.debug(clist);
     }
     


}