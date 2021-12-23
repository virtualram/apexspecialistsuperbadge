trigger myAccountTrigger on Opportunity(before delete, before insert, before update,after delete, after insert, after update){


list<AggregateResult> oppaccountswithexistingrecords =  [select count(id) a ,accountid from opportunity  group by accountid  having count(ID)>1 ];


for (opportunity opp:trigger.new){
    
    for(AggregateResult oppwithacc:oppaccountswithexistingrecords){
        
        
        if(opp.accountid == oppwithacc.get('accountid'))
            
        {
            opp.addError('This accoubt already has more than one opportunity');
        }
    }
    
}

}