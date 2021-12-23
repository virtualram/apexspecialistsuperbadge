({
	searchHelper : function(component,event,getInputkeyWord) {
	  // call the apex class method 
     var action = component.get("c.fetchContact");
      // set param to method  
        action.setParams({
            'searchKeyWord': getInputkeyWord
          });
      // set a callBack    
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var storeResponse = response.getReturnValue();
                //alert('storeres'+storeResponse);
              
              // if storeResponse size is equal 0 ,display No Result Found... message on screen.
                if (storeResponse.length == 0) {
                    component.set("v.Message", 'No Result Found...');
                } else {
                    component.set("v.Message", 'Search Result...');
                }
                
                // set searchResult list with return value from server.
                component.set("v.listOfSearchRecords", storeResponse);
               
                //component.set("v.recordid",conrecordid);
            }
 
        });
      // enqueue the Action  
        $A.enqueueAction(action);
    
	},
})