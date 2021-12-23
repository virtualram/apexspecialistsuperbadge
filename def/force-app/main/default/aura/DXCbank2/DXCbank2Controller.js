({
    fetchcontacts : function(component, event, helper) {
        
        var evt= component.getEvent("dxcmp");
        evt.setParams({"DXmessage":"ignore the migratory crowd of  birds"});
        evt.fire();
        var action = component.get("c.getcontacts1");
        action.setParams({accid: component.get("v.Accountid")});
        action.setCallback(this,function(returnobject){
            console.log(returnobject.getReturnValue());
            component.set("v.Contactlist",returnobject.getReturnValue());
        });
        $A.enqueueAction(action);
    }
})