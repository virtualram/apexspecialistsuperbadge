({
	getacccontacts : function(component,event,helper){
    //this call's server side controller action
    ////first get action variable intialised with controller method apex function
       var action = component.get("c.retaccountdetailslist");
       debugger;      
    	action.setParams({ id: component.get("v.accid") });
        action.setCallback(this, function(a) {
            component.set("v.contactlist",a.getReturnValue());
            console.log(a.getReturnValue());
            console.log(component.get("v.contactlist"));
            //alert(a.getReturnValue());
        });
        $A.enqueueAction(action);
    }
})