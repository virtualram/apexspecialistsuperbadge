trigger Accountdelltrig on Account (before delete,before insert,before update,after insert) {


Accountriggerclass.triggerhandler(trigger.new,trigger.old,trigger.oldmap);

  
 
}