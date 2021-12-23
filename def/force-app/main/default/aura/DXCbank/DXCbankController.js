({
    
   
    
     recvdevent:  function(comp, event, helper)  { 
       
         console.log(event.getParam("DXmessage"));
         
	},
     closeMe : function(comp, event, helper)  { 
        comp.destroy();
	},
	calc : function(component, event, helper) {
         helper.calchelper(component,event,helper);
		
	},
    cleanup : function(component, event, helper) {
		
        component.set("v.Maturity",0);
        
	},
   recover : function(component, event, helper) {
		
    component.set("v.Maturity", sessionStorage.getItem("xx"));
        
	},
    tenurecheck :function(component,event,helper){
       helper.tenurecheckhelper(component,event,helper);
    }
    
})