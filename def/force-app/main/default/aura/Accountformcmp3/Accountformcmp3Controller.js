({
    
    
    doInit: function(component, event, helper) {
        
        var action = '';  
        //we NEed to query and get the data during init phase only if it is in edit mode
        if(component.get("v.recordId") != null || component.get("v.recordId") != '')
        { 
                action = component.get("c.fetchaccount");
                action.setParams({"Idd" :component.get("v.recordId") }); //pass the params to the method      
                action.setCallback(this, function(a) {
                    
                   var x = a.getReturnValue();
                    component.set("v.accountObj",a.getReturnValue());
                    console.log(x);            
                   
                } );         
                $A.enqueueAction(action);
        }
    },
    save1: function(component, event, helper) {
        debugger;
        var action = '';   
        if(component.get("v.recordId") !='' || component.get("v.recordId") != null){
           action = component.get("c.customedit1");
            action.setParams({"Idd" : component.get("v.recordId"), "accname1" :component.get("v.accountObj.Name"), "accnumber1" : component.get("v.accountObj.AccountNumber") }); //pass the params to the method 
            //Edit the data here
        
        }else{
            
          action = component.get("c.customsave1");
        action.setParams({"accname1" :component.get("v.accountObj.Name"), "accnumber1" : component.get("v.accountObj.AccountNumber") }); //pass the params to the method 
              //Save the data here
            
        }    
            
        action.setCallback(this, function(a) {
            
           var x = a.getReturnValue();
            component.set("v.errormessages",a.getReturnValue());
            console.log(x);            
            var event = $A.get('e.force:navigateToSObject');
            event.setParams({                
                "recordId":  x,                 
                "slideDevName": "related"                
            }); 
            event.fire();  
        } ); 
        
        $A.enqueueAction(action);
        
    }
    
})