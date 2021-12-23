({
    
    fireApplicationEvent2 : function(cmp, event) {
        // Get the component event by using the
        // name value from aura:registerEvent
   
        var apEvent = $A.get("e.c:aeEvent");
               //var apEvent = $A.get("e.c:aeEvent");
        						//e.c:aeEvent
        						//console.log(apEvent);
        apEvent.setParams({
            "message" : "An application event fired me. " +
            "It all happened so fast. Now, I'm here!" });
        apEvent.fire();
    }
})