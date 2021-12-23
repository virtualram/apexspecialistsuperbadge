({
    save : function(component, event, helper) {              
        
        var accnum = component.get("v.accObj.AccountNumber");
        var name   = component.get("v.accObj.Name"); 
        var x ='';
        var editrecordid = component.get("v.recordId");   
        var action = '';    
        if(editrecordid =='' || editrecordid == undefined){
                       action = component.get("c.getSave");
            console.log(component.find("mySelect").get("v.value"));
            action.setParams({"accname" : name, "accnumber" : accnum , "Type" : component.find("mySelect").get("v.value"),"Industry" : component.find("mySelect1").get("v.value")  }); //pass the params to the method
           
        }else{
           
            action = component.get("c.Edit1");
             console.log(component.find("mySelect").get("v.value")+'edit');
               action.setParams({"accname" : name, "accnumber" : accnum, "idd" :editrecordid, "Type":  component.find("mySelect").get("v.value"), "Industry" : component.find("mySelect1").get("v.value") });  
           // action.setParams({"accname" : name, "accnumber" : accnum, "idd" :editrecordid });  
         
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
        
       
        // navEvt.fire();
        // console.log('save:end');          
    },    
    
    runrender1:function(component,event,helper){
  
        console.log(component.get("v.hideunhide"));
       if(component.get("v.hideunhide") == "false")
        	component.set("v.hideunhide","true");
        	else
                component.set("v.hideunhide","false");
    },
    
    selectchanged : function(component,event,helper){
        console.log('hi'+event.getSource());
        alert(event.getSource().get("v.value"));
    },        
    
    doInit : function(component, event,helper) {
       //  debugger;
           $A.util.addClass(component.find("contactformcmp"),'toggle');
        var jsonstring = '';
        var jsonobj = '';        
        var action = component.get("c.fetchaccount"); 
        if (component.get("v.recordId") ==undefined)
        { 
            console.log('inside firstif:'+component.get("v.recordId")); 
            component.set("v.enabled",true);
        } else{
          //  debugger;
            component.set("v.enabled",false);
            console.log('inside else'+component.get("v.recordId")); 
            action.setParams({Idd :component.get("v.recordId")}); 
            // 
            action.setCallback(this, function(a) {
              jsonstring =  a.getReturnValue();
                component.set("v.accObj",a.getReturnValue());
                
                console.log(component.get("v.accObj"));
            });
            $A.enqueueAction(action);
        }
          helper.helperMethod1(component);
         helper.helperMethod2(component);
    },
    
    deleteacc:function(component,event,helper){
        
        var action = component.get("c.deleteaccount");  
        action.setParams({Idd :component.get("v.recordId")});
        
        
        action.setCallback(this, function(a) {
            //   jsonstring =  a.getReturnValue();
            console.log(a.getReturnValue());         
              var urlEvent = $A.get("e.force:navigateToURL");
        urlEvent.setParams({
          "url": '/'
        });
        urlEvent.fire();
        
        });
        
        
        $A.enqueueAction(action);
        
     
        
    },
    createcontact :function(component,event){
        
 $A.util.removeClass(component.find("god"),'toggle');
       $A.util.addClass(component.find("god"),'slds-modal__container');
       
      
        
    },
    handleCancel : function(component,event){
        
         var cmpTarget2 = component.find('god');
      
        $A.util.removeClass(cmpTarget2, 'slds-modal__container');
          $A.util.addClass(cmpTarget2, 'toggle');
        
         $A.util.removeClass(component.find('section1'), 'slds-modal slds-fade-in-open');
         $A.util.removeClass(component.find('modcont'), 'slds-modal__content slds-p-around_medium');
     
           
        
    }
})