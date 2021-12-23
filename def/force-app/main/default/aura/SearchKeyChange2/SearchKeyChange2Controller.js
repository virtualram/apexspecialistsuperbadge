({
    searchKeyChange: function(component, event, helper) {
        //  debugger;
        var myEvent = $A.get("e.c:searchaccountevent");
        //  in case of no namespace enabled: "e.devlight1973:eventname"
        
        console.log('fired keyboard event with the following value'+event.target.value);
        
       if( event.target.value!=' '||event.target.value != "" || event.target.value != null || event.target.value==undefined)    {
            myEvent.setParams({"searchkey1": event.target.value});
            console.log('inside if+'+event.target.value);
            myEvent.fire();
            
       }else{
           myEvent.setParams({"searchkey1": " "});
            console.log('inside if+'+event.target.value);
            myEvent.fire();
       }
    }
})