trigger triggerflo  on Account (before insert,after insert,before update,after update,before delete ,after delete) {
    if (Trigger.isbefore)
    {system.debug('before insert/update'+ trigger.new+trigger.old);}else
    {
        system.debug('afterinsert'+  trigger.new+trigger.old);
    }

}