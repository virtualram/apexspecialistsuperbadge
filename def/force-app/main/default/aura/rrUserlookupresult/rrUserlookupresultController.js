({
	 selectUser : function(component, event, helper){      
    // get the selected Contact from list  
      var getSelectUser = component.get("v.oUser");
    // call the event   
      var compEvent = component.getEvent("oSelectedUserEvent");
    // set the Selected Contact to the event attribute.  
         compEvent.setParams({"userByEvent" : getSelectUser });  
    // fire the event  
         compEvent.fire();
         console.log('00000000000000000000000000000000'+getSelectUser);
    },
})