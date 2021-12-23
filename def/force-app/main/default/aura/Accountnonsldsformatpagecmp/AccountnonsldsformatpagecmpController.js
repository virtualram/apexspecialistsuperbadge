({
	 save : function(component, event, helper) {              
     // debugger;
        
        var accnum = component.get("v.accObj.AccountNumber");
        var name   = component.get("v.accObj.Name"); 
        var x ='';
        console.log(component.get("v.recordId")+'What is value in record id');
        
       
            
               var action = component.get("c.getSave");
                action.setParams({"accname" : name, "accnumber" : accnum , "type" : component.find("mySelect").get("v.value") }); //pass the params to the method
                //console.log('inside empty recid' +component.find("mySelect").get("v.value") );
            
            action.setCallback(this, function(a) {

                x = a.getReturnValue();
                console.log(x);
                  var event = $A.get('e.force:navigateToSObject');
    
        event.setParams({

      "recordId":  x, //x ,   //"0019000001zRoLgAAK", '"'+""'"

      "slideDevName": "related"

    }); event.fire();
            } ); 
        //   console.log(component.get("v.recordId"));                
        $A.enqueueAction(action);
      
        
     
         
    }
})