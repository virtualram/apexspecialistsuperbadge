trigger test on A__c (after update) {

   for(A__c a:Trigger.new)
   
       {
       
           a.X__c = 'sdf';
           //update a;
       }

}