public with sharing  class Triggerhandlerforstudents {
    
    
     public static void triggervalidationsdelete(List<devlight1973__StudentMaster__c> oldstudentlist){
        
        for(devlight1973__StudentMaster__c std : oldstudentlist){                
                if (std.name == 'Mahesh'){
                     std.addError('Cannot delete this record');                    
                }              
                
            }
        
        
    }

}