global class BatchScheduleUpdate implements Schedulable
{
    global void execute(SchedulableContext sc)
    {
        // Implement any logic to be scheduled
       
        // We now call the batch class to be scheduled
        batch1 b = new batch1 ();
       
        //Parameters of ExecuteBatch(context,BatchSize)
        database.executebatch(b,200);
    }
    
   /* 
    Schedule from Developer Console
------------------------------------------------- 
BatchScheduleUpdate batchSch=new BatchScheduleUpdate();
String sch='0 5 2 * * ?';
//System.schedule(String jobName, String cronExp, APEX_OBJECT schedulable);
System.schedule('Batch Schedule', sch , batchSch);
*/

   
}