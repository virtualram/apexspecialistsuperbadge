({
  doInit: function(component, event, helper) {
     helper.setDefaultUserInfo(component); 
      //helper.searchHelper(component,event,component.get("v.SearchKeyWord"));
    },
	keyPressController : function(component, event, helper) {
      // get the search Input keyword   
		var getInputkeyWord = component.get("v.SearchKeyWord");
      // check if getInputKeyWord size id more then 0 then open the lookup result List and 
      // call the helper 
      // else close the lookup result List part.   
        if( getInputkeyWord.length > 0 ){
             var forOpen = component.find("searchRes");
               $A.util.addClass(forOpen, 'slds-is-open');
               $A.util.removeClass(forOpen, 'slds-is-close');
            helper.searchHelper(component,event,getInputkeyWord);
        }
        else{  
            component.set("v.listOfSearchRecords", null ); 
             var forclose = component.find("searchRes");
               $A.util.addClass(forclose, 'slds-is-close');
               $A.util.removeClass(forclose, 'slds-is-open');
          }
         
	},
  
  // function for clear the Record Selaction 
    clear :function(component,event,heplper){
      
         var pillTarget = component.find("lookup-pill");
         var lookUpTarget = component.find("lookupField"); 
        
         $A.util.addClass(pillTarget, 'slds-hide');
         $A.util.removeClass(pillTarget, 'slds-show');
        
         $A.util.addClass(lookUpTarget, 'slds-show');
         $A.util.removeClass(lookUpTarget, 'slds-hide');
      
         component.set("v.SearchKeyWord",null);
         component.set("v.listOfSearchRecords", null );
        component.set("v.selectedRecord", null );
    },
    setUserId : function(component, event, helper) {
           var selecteduserid = component.get("v.selectedRecord.id");
            component.set("v.selecteduserid",selecteduserid);
      //  alert('sdsd');
        },
  // This function call when the end User Select any record from the result list.   
    handleComponentEvent : function(component, event, helper) {
     //  debugger;
    // get the selected User record from the COMPONETN event 	 
       var selectedUserGetFromEvent = event.getParam("userByEvent");
	   component.set("v.childAttr5",component.get("v.selectedRecord.Id")); 
	   component.set("v.selectedRecord" , selectedUserGetFromEvent); 
      
         var selecteduserid = component.get("v.selectedRecord.Id");
            component.set("v.selecteduserid",selecteduserid);
       // var selectedrecord = component.get("v.selectedRecord.Id");
       // component.set("v.selecteduserid",selectedrecord); 
     //  Console.log('changedid'+component.get("v.selecteduserid"));
        var forclose = component.find("lookup-pill");
           $A.util.addClass(forclose, 'slds-show');
           $A.util.removeClass(forclose, 'slds-hide');
      
        
        var forclose = component.find("searchRes");
           $A.util.addClass(forclose, 'slds-is-close');
           $A.util.removeClass(forclose, 'slds-is-open');
        
        var lookUpTarget = component.find("lookupField");
            $A.util.addClass(lookUpTarget, 'slds-hide');
            $A.util.removeClass(lookUpTarget, 'slds-show');  
      
	},
  // automatically call when the component is done waiting for a response to a server request.  
    hideSpinner : function (component, event, helper) {
        var spinner = component.find('spinner');
        var evt = spinner.get("e.toggle");
        evt.setParams({ isVisible : false });
        evt.fire();    
    },
 // automatically call when the component is waiting for a response to a server request.
    showSpinner : function (component, event, helper) {
        var spinner = component.find('spinner');
        var evt = spinner.get("e.toggle");
        evt.setParams({ isVisible : true });
        evt.fire();    
    },
    
})