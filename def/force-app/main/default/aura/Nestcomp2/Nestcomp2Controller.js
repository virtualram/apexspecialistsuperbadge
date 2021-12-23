({
    doInit : function(component, event, helper) {
      
        console.log('data from parent comp'+component.get("v.nestcomp2data"));
        var appEvent = $A.get("e.c:Nestcompappevent");
        
        appEvent.setParams({ "message" : "test111" });
        appEvent.fire();
        
    }
})