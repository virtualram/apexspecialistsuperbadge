trigger xyz on Account (before update,before insert) {
//basically this trigger will not run in after update
    if (Trigger.isBefore){
          for (Account x : trigger.new){
          
          
                           if(x.Name == 'ABC' ){
                               system.debug('if');
                             x.Name.adderror('wrong name');
                            }
                            
         system.debug('outif');
            
            x.Name ='poql';
          }
        }
}