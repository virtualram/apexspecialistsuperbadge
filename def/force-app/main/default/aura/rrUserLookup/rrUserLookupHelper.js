({
    setDefaultUserInfo: function(component, helper){
      console.log("setDefaultUserInfo");
  
      var action = component.get("c.getCurrentUser");
   
      action.setCallback(this, function(response){ 
        //console.log("response.getState: " + response.getState);       
        if (response.getState() === "SUCCESS"){ 
        var forclose = component.find("lookup-pill");
           $A.util.addClass(forclose, 'slds-show');
           $A.util.removeClass(forclose, 'slds-hide');
      
        
        var forclose = component.find("searchRes");
           $A.util.addClass(forclose, 'slds-is-close');
           $A.util.removeClass(forclose, 'slds-is-open');
        
        var lookUpTarget = component.find("lookupField");
            $A.util.addClass(lookUpTarget, 'slds-hide');
            $A.util.removeClass(lookUpTarget, 'slds-show');  
         

          var currentvalue = response.getReturnValue();
          component.set("v.selectedRecord",currentvalue);  
          
        var selecteduserid = component.get("v.selectedRecord.Id");
            component.set("v.selecteduserid",selecteduserid);
       
        }
        else {
          console.log("Failed with state: " + state);
        }
        
      });
      $A.enqueueAction(action);
    },
    getUserInfo: function(component){
     

    },
    searchHelper : function(component,event,getInputkeyWord) {
	  // call the apex class method 
     var action = component.get("c.fetchUser");
      // set param to method  
        action.setParams({
            'searchKeyWord': getInputkeyWord
          });
      // set a callBack    
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var storeResponse = response.getReturnValue();
              // if storeResponse size is equal 0 ,display No Result Found... message on screen.
                if (storeResponse.length == 0) {
                    component.set("v.Message", 'No Result Found...');
                } else {
                    component.set("v.Message", 'Search Result...');
                }
                
                // set searchResult list with return value from server.
                component.set("v.listOfSearchRecords", storeResponse);
            }
 
        });
      // enqueue the Action  
        $A.enqueueAction(action);
    
	},
})