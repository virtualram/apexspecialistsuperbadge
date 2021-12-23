({
    locationChange : function(component, event, helper) {
        console.log(component.get("v.show"))
        var token = event.getParam("token");
       if(token != null || token != undefined){
                    alert(token);
                     //debugger;//
                     component.set("v.show","true");
                    if (token.indexOf('contact/') === 0) {
                        var contactId = token.substr(token.indexOf('/') + 1);
                        console.log(contactId);
                        var action = component.get("c.findById");
                        action.setParams({
                          contactId: contactId
                        });
                        action.setCallback(this, function(a) {
                             //console.log(a.getReturnValue());
                            component.set("v.contact", a.getReturnValue());                                                        
                        });
                        $A.enqueueAction(action);
                    }
        }  
    }
})