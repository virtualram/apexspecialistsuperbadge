({
    doInit: function(component, event, helper) {
        console.log(component.get("v.recordId")+'test');
        debugger;
        
        if(component.get("v.recordId") == '' || component.get("v.recordId") == 'undefined' || component.get("v.recordId") == null ){
   component.find("contactRecordCreator").getNewRecord(
            "Contact", // objectApiName
            null, // recordTypeId
           true, // skip cache?
            $A.getCallback(function() {
                var rec = component.get("v.newContact");
                var error = component.get("v.newContactError");
                console.log(rec.id);
                if(error || (rec === null)) {
                    console.log("Error initializing record template: " + error);
                }
                else {
                    console.log("Record template initialized: " + rec.sobjectType);
                   
                }
            })
        );
        }
    },

 unhidesection:function(component,event,helper){
       
      // component.set("v.showandhide",true);
console.log(component.get("v.showandhide"));
      if (component.get("v.showandhide") == true)
           component.set("v.showandhide",false);
        else
           component.set("v.showandhide",true);
    }
     ,
   
       handleSaveContact: function(component, event, helper) {
           debugger;
        component.find("contactRecordCreator").saveRecord($A.getCallback(function(saveResult) {
            // NOTE: If you want a specific behavior(an action or UI behavior) when this action is successful 
            // then handle that in a callback (generic logic when record is changed should be handled in recordUpdated event handler)
            if (saveResult.state === "SUCCESS" || saveResult.state === "DRAFT") {
                // handle component related logic in event handler
                console.log("record saved"+saveResult.state);
                console.log("record id"+saveResult.recordId);
                 var event = $A.get('e.force:navigateToSObject');
            	event.setParams({                
                "recordId":  saveResult.recordId,                 
                "slideDevName": "related"                
            }); 
            event.fire();                    
            } else if (saveResult.state === "INCOMPLETE") {
                console.log("User is offline, device doesn't support drafts.");
            } else if (saveResult.state === "ERROR") {
                console.log('Problem saving record, error: ' + JSON.stringify(saveResult.error));
            } else {
                console.log('Unknown problem, state: ' + saveResult.state + ', error: ' + JSON.stringify(saveResult.error));
            }
        }));
    },
    
    showModal: function(component, event, helper) {
   // debugger;
       $A.util.removeClass(component.find("god"),'toggle');
       $A.util.addClass(component.find("god"),'slds-modal__container');
        
        //$A.get("e.force:closeQuickAction").fire();
    },

    handlerecordUpdated: function(component, event, helper) {
        var eventParams = event.getParams();
        if(eventParams.changeType === "CHANGED") {
            // get the fields that changed for this record
            var changedFields = eventParams.changedFields;
            console.log('Fields that are changed: ' + JSON.stringify(changedFields));
            // record is changed, so refresh the component (or other component logic)
            var resultsToast = $A.get("e.force:showToast");
            resultsToast.setParams({
                "title": "Saved",
                "message": "The record was updated."
            });
            resultsToast.fire();

        } else if(eventParams.changeType === "LOADED") {
            // record is loaded in the cache
        } else if(eventParams.changeType === "REMOVED") {
            // record is deleted and removed from the cache
        } else if(eventParams.changeType === "ERROR") {
            // there’s an error while loading, saving or deleting the record
        }
     },
    handleCancel: function(component, event, helper) {
  // debugger;
      
         var cmpTarget2 = component.find('god');
      
        $A.util.removeClass(cmpTarget2, 'slds-modal__container');
          $A.util.addClass(cmpTarget2, 'toggle');
        
         $A.util.removeClass(component.find('section1'), 'slds-modal slds-fade-in-open');
         $A.util.removeClass(component.find('modcont'), 'slds-modal__content slds-p-around_medium');
       
        //$A.get("e.force:closeQuickAction").fire();
    }
    
})