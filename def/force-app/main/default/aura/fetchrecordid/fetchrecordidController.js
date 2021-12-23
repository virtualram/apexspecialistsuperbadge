({
    getAttachments : function(component) {
        var action = component.get("c.getAttachments");
        action.setParams({
            parentId : component.get("v.recordId")
        });
        
        action.setCallback(this, function(a) {
            if (a.getState() === "SUCCESS") {
                var attachments = a.getReturnValue();
                component.set("v.attachments", attachments);
            } else if (a.getState() === "ERROR") {
                console.log("oof");
            }
        });
        $A.enqueueAction(action);
    }
})