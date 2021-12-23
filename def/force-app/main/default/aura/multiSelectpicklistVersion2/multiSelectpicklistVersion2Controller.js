({
    keyController : function(component, event, helper) {
    //	helper.buildPicklistValues(component, event, helper);
    var conId=component.get('v.selConId');
  //  alert('id in multiselect'+conId);
    helper.buildPicklistValues2(component, event,helper);
    
        
    },
    
    SelectedPrimaryRel : function(component, event, helper) {
    helper.PrimaryRelSelected(component, event,helper);
    },
    
     handleComponentEvent2 : function(cmp, event) {
        var message = event.getParam("messageconid");
          console.log('firehandled')
        // set the handler attributes based on event data
        cmp.set("v.selConId", message);
       
    },
    
    
    enumerate : function(component,event,helper){
        
        console.log(component.find("rightSelectedValues").get("v.value")); 
       alert(component.find("rightSelectedValues").get("v.value") + 'selected as primary rel for contact');
       helper.primaryRelSelected(component, event, helper); 
    },
    shiftRight : function(component, event, helper) {
    if(component.get("v.addSelectedValues").length > 0)
        {
            helper.shiftRight(component, event, helper);
        } 
        else 
        {
            alert("Please select atleast one value");
        }
 	},
    shiftLeft : function(component, event, helper) {
    if(component.get("v.removeSelectedValues").length > 0)
    	{
    		helper.shiftLeft(component, event, helper);
    	} 
        else 
        {
    		alert("Please select atleast one value to Move to Left");
    	}
    }
})