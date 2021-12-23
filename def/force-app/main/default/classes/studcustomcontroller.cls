public with sharing class studcustomcontroller {

    public   List<studentmaster__c> students {
        get{
         students  = Database.query('SELECT name, Department__c FROM studentmaster__c' );
         return students;
        }    
      set;}
    
      
    /*
    public List<studentmaster__c> getstudents() {
        //getstduents is the getter method. In the VF page refer to this as students dont use getstudents
        //
      List<studentmaster__c> students  = Database.query('SELECT name, Department__c FROM studentmaster__c' );
          return students;
    }*/
    
      public List<studentmaster__c>  checkit(){
        students  = Database.query('SELECT name, Department__c FROM studentmaster__c limit 3' );
        return students;
    }
  
}