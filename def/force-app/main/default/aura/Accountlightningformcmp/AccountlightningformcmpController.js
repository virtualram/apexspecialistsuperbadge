({
	saveaccount : function(component, event, helper) {
      // debugger;
		var accnum = component.get("v.accObj.AccountNumber");
        var accname = component.get("v.accObj.Name");
        var x ='';
        var action = component.get("c.getSave");
        action.setParams({"accname" : accname, "accnumber" : accnum });
         action.setCallback(this, function(a) {
                x = a.getReturnValue();
                console.log(x);
                 event.setParams({

      "recordId": x, 

      "slideDevName": "related"

    }); event.fire();
               
            } ); 
             $A.enqueueAction(action);
        
	}
})