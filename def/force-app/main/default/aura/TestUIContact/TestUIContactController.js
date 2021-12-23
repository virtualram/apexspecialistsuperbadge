({            getcontactname : function(component,event,helper){
            //this call's server side controller action        ////first get action variable intialised with controller method apex function
            var action = component.get("c.retcontactname");
          //  debugger;   
            action.setParams({ id: component.get("v.Conid") });
            action.setCallback(this, function(a) {            
                if(a.getReturnValue() == 'error'){
                    console.log('Error returned from apex');                
                }else{
                    component.set("v.ContactName", a.getReturnValue());
                }
               console.log(a.getReturnValue());
            });
            $A.enqueueAction(action);
        },  
    getacccontacts : function(component,event,helper){
        //this call's server side controller action
        ////first get action variable intialised with controller method apex function
        var action = component.get("c.retaccountdetails");
        //debugger;      
        action.setParams({ id: component.get("v.accid") });
        action.setCallback(this, function(a) {
            
            var retx = a.getReturnValue().split(';');
            var accountname = retx[0];
            var contactname = retx[1];   
            component.set("v.ContactName", contactname);
            component.set("v.accountName", accountname);
            //alert(a.getReturnValue());
        });
        $A.enqueueAction(action);
        //second call to populate list
         var action1 = component.get("c.retaccountdetailslist");
        debugger;      
        action1.setParams({ id: component.get("v.accid") });
        action1.setCallback(this, function(a) {
            
          
           component.set("v.contactlist",a.getReturnValue());
        });
        $A.enqueueAction(action1);
    },   
    remclass : function(component,event,helper){
        $A.util.removeClass(component, 'changeMe'); 
        
        $A.util.addClass(component.find('text1'),'toggle1');
        
    },
    oninit:function(component,event,helper){
      
        alert('On INIt');
    },
    onRender :function(component,event,helper){
        
        alert('On Render event fired');  
    },
    calculate11 : function(component, event, helper) {  
          helper.sendMessage(component,event,helper)
     console.log('Inside the controller js');   
    // helper.calculate2(component);
     helper.validate12(component,helper);
        
    },
    
    fieldvalidornot: function(component, event, helper){
        
        helper.validate12(component,helper); 
        
    },
      /*   var inputcmp = component.find("tenure"); //or component.get("v.tenure";)
        var val  =inputcmp.get("v.value"); 
        console.log(inputcmp.get("v.label"));
        if(val >21){
            
           inputcmp.set("v.errors",[{message :'Value cant be greater than 21 using compset'}]);
            //add the line to remove class and show error message on text1
        }else{
       
        helper.calculate2(component); //move your calc code to helper and call from controller
          //  helper.showmessage1(component);
       $A.util.addClass(component, 'changeMe'); 
     //    $A.util.removeClass(component.find('text1'), 'toggle1');
            
        
        }
 
    }*/
    tenurechanged: function(component){
        
        
        console.log(component.get("v.Tenure"));
    },
    
    calculate1 : function(component,event,helper) {
        // debugger;
        var inputcmp = component.find("tenure"); 
      //  component.get("v.tenure";)
        var val  =inputcmp.get("v.value"); 
        console.log(inputcmp.get("v.label"));
        if(val >21){
            inputcmp.set("v.errors",[{message :'Value cant be greater than 21 using compset'}]);
            //add the line to remove class and show error message on text1
        }else{
            inputcmp.set("v.errors",[{message :''}]);
            var txt1 = component.find("text1") ;
            $A.util.removeClass(txt1,'toggle1');  
            $A.util.addClass(component.find('div2'),'toggle1');  
            helper.calculate2(component);
            helper.showmessage1(component);
        }}
})