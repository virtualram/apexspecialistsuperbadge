({
    locationChange : function(component, event, helper) {
       // debugger;
        alert(component.get("v.show"));
        var token = event.getParam("token");
       if(token != null || token != undefined){
                    alert(token+component.get("v.show"));
                 
                   //  component.set("v.show","true");
                    if (token.indexOf('Account/') === 0) {
                        var accountId = token.substr(token.indexOf('/') + 1);
                        console.log(accountId);
                        var action = component.get("c.findById");
                        action.setParams({
                          accountId: accountId
                        });
                        action.setCallback(this, function(a) {
                             console.log(a.getReturnValue());
                            component.set("v.account", a.getReturnValue());    
                            component.set("v.rollupaccid",a.getReturnValue().Id);
                        });
                        $A.enqueueAction(action);
                    }
        }  
    }
})