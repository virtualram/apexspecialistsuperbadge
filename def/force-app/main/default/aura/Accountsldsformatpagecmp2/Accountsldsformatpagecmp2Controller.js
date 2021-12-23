({
    save : function(component, event, helper) {              
      // debugger;
        
        var accnum = component.get("v.accObj.AccountNumber");
        var name   = component.get("v.accObj.Name"); 
      //  var editrecordid = component.get("v.idd");
         var editrecordid = component.get("v.recordId");
           // var editrecordid = '';
        var x ='';
        var action = '';    
        //  action = component.get("c.getSave");
        //   action.setParams({"accname" : name, "accnumber" : accnum}); //pass the params to the method        
            if(editrecordid ==''){
                action = component.get("c.getSave");
                action.setParams({"accname" : name, "accnumber" : accnum}); //pass the params to the method
            }else{
                action = component.get("c.Edit1");
                action.setParams({"accname" : name, "accnumber" : accnum, "idd" :editrecordid});  
            }   
            action.setCallback(this, function(a) {
                x = a.getReturnValue();
                console.log(x);
            } ); 
        //   console.log(component.get("v.recordId"));                
        $A.enqueueAction(action);
     //  var event = $A.get('e.force:navigateToObjectHome');
        //this works from lighting tab or action only not in dev console
     //  event.setParams({  scope: 'Account' });
      console.log('testmore'+x);
       var event = $A.get('e.force:navigateToSObject');
        
        event.setParams({

      "recordId": "0019000001zRoLgAAK",

      "slideDevName": "related"

    });
  event.fire();
        // navEvt.fire();
        // console.log('save:end');          
    },    
    doInit : function(component, event) {
      // debugger;
        var jsonstring = '';
        var jsonobj = '';
        var action = component.get("c.fetchaccount");        
       // action.setParams({Idd : component.get("v.idd")});
     action.setParams({Idd :component.get("v.recordId")});
       // 
        action.setCallback(this, function(a) {
            //   jsonstring =  a.getReturnValue();
            component.set("v.accObj",a.getReturnValue());            
        });
        $A.enqueueAction(action);
    }
})