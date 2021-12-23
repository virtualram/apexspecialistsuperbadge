({
	  save : function(component, event, helper) {              
        // debugger;
        
        var adhar = component.get("v.contactObj.devlight1973__Aadhar__c");
        var name   = component.get("v.contactObj.Name"); 
        var x ='';
      
        var editrecordid = component.get("v.recordId");   
        var action = '';    
        if(editrecordid =='' || editrecordid == undefined){
            action = component.get("c.getSave");
            action.setParams({"conname" : name, "connumber" : adhar ,"accid" : component.get("v.rollupaccid") }); //pass the params to the method
            //console.log('inside empty recid' +component.find("mySelect").get("v.value") );
        }else{
            action = component.get("c.Edit1");
               action.setParams({"accname" : name, "accnumber" : accnum, "idd" :editrecordid, "type":  component.find("mySelect").get("v.value") });  
           // action.setParams({"accname" : name, "accnumber" : accnum, "idd" :editrecordid });  
            //  console.log('inside non empty recid'+component.find("mySelect").get("v.value") );
          
        }   
        action.setCallback(this, function(a) {
            //  debugger;
            //define var or you will get errors
            x = a.getReturnValue();
            console.log(x);  
            var event = $A.get('e.force:navigateToSObject');
            event.setParams({
                
                "recordId":  x,                 
                "slideDevName": "related"
                
            }); 
            event.fire();            
            
            
        } ); 
        //   console.log(component.get("v.recordId"));                
        $A.enqueueAction(action);
        
        
        
              
    }
})