({
	myAction : function(component, event, helper) {
       // debugger;
        var appEvent = $A.get("e.c:MapEvent");
	     	//var appEvent =component.getevent("c:MapEvent");
     appEvent.setParams({ "lat" : component.get("v.lat")});
         appEvent.setParams({ "long" : component.get("v.long")});
		appEvent.fire();
	}
})