({
    doInit : function(component, event, helper) {
        console.log('this is record id'+component.get("v.recordId"));
        var action = component.get("c.fetchcontact");
        action.setParams({Idd : component.get("v.recordId")});
        action.setCallback(this,function(returnobject){
            console.log(returnobject.getReturnValue());
        component.set("v.conObj",returnobject.getReturnValue());
         
        });
        $A.enqueueAction(action);
    },
    
    // insertrecords(String Name1,String Email)
    save1 : function(component, event, helper) {
        console.log('this is record id'+component.get("v.recordId"));
        var action = component.get("c.insertrecords");
        action.setParams({Name1 : component.get("v.conObj.LastName"),
                          Email : component.get("v.conObj.Email")});
        action.setCallback(this,function(returnobject){
            console.log(returnobject.getReturnValue());
            if (returnobject.getReturnValue().includes('exception') == true){
                component.set("v.truthy","true");
                component.set("v.errormessage",returnobject.getReturnValue());
                
            }else{
             var event = $A.get('e.force:navigateToSObject');
            event.setParams({
                
                "recordId":  returnobject.getReturnValue(),       //pass id1          
                "slideDevName": "detail"
                
            }); 
            event.fire();
            }    
        });
        $A.enqueueAction(action);
    }
})