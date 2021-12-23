({
    calculate: function(component, event, helper) {
        if(component.get("v.Rateofinterest") <9){
            
            var amt  = component.get("v.Amount");
            var roi  =   component.get("v.Rateofinterest");
            var finalamt = roi/100 *amt +amt;
            component.set("v.Maturityamount",finalamt);
            //this is being done to clear the previous error message if any.
            
        } 
    },
    
    validatetheroi :function(component, event, helper) {
        // debugger;
        var field = component.find("roi");
        if(field.get("v.value") >9 ){
            
            field.set("v.errors",[{message :'Value cant be greater than 9'}]);
        } else{//empty error message if there are none,to clear previous error messages
            field.set("v.errors",[{message :''}]);
        }
    },
    
    storedata :function(component ,event,helper){
        sessionStorage.setItem("lastvalue", component.get("v.Amount"));
    },
    
    getdata :function(component ,event,helper){
        var z= 	sessionStorage.getItem("lastvalue");
        console.log(z);
      
    },
    getname : function(component,event,helper){
        debugger;
        var action = component.get("c.insertrecords");
        action.setParams({contactid : component.get("v.contactid") });
         action.setCallback(this,function(a){
                component.set("v.contactname",a.getReturnValue());
                //console.log(a.getState());
            } );
        $A.enqueueAction(action);
    }
})