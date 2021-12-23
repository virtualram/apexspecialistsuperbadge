({
    
   
    
    doInit: function(component, event, helper){
       
        if(component.get("v.recordId")==undefined || component.get("v.recordId")==null)
        {  }else
        {
            // debugger;
            var action = component.get("c.fetchcontact");
            action.setParams({Idd : component.get("v.recordId") }); 
            
            action.setCallback(this,function(a){
                component.set("v.conObj",a.getReturnValue());
                console.log(component.get("v.conObj"));
             //   component.set("v.conObj.LastName",a.getReturnValue().LastName);
                   console.log(component.get("v.conObj.LastName"));
       
            });
        }
    },
    showdesc: function(component,event,helper){
       // component.set("v.truthy","true";)
        if (component.get("v.truthy") == "true") 
             component.set("v.truthy","false");
             else
                  component.set("v.truthy","true");
    },
    savedata: function(component, event, helper) {
        
        var name = component.get("v.conObj.LastName");
        var email = component.get("v.conObj.Email");
        var desc = component.get("v.conObj.Description");
        var redirectid =''
        
        if(component.get("v.recordId")=='' || component.get("v.recordId")==null){        
            
            var action = component.get("c.insertrecords");
            action.setParams({Name1 : name,Email : email }); 
            
        }else{
            
            var action = component.get("c.updaterecords");
            action.setParams({recid: component.get("v.recordId"),passeddata: desc });
            
        }    
        
        action.setCallback(this,function(a){
            console.log(a.getReturnValue());
            if(component.get("v.recordId")=='' || component.get("v.recordId")==null){
                redirectid  = a.getReturnValue();
            }else{
                redirectid  =component.get("v.recordId");
            }
            
          /*  var event = $A.get('e.force:navigateToSObject');
            event.setParams({
                
                "recordId":  redirectid,       //pass id1          
                "slideDevName": "detail"
                
            }); 
            event.fire(); */
            
             var evt = $A.get("e.force:navigateToComponent");
        evt.setParams({
            componentDef : "c:ITCcomp1"
            //componentAttributes: {}
        });
        evt.fire();
        } );
        $A.enqueueAction(action);
    },
    close1:function(component){
        
        component.set("v.truthy","false");
        
    }
})