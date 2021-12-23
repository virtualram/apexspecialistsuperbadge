({
    doInit : function(component, event) {
        //  debugger;
      /*  var action = component.get("c.findAll");
        action.setCallback(this, function(a) {
            component.set("v.accounts", a.getReturnValue());
        });
        
        console.log(component.get("v.accounts"));
        $A.enqueueAction(action);*/
    },      
    
    showalert:function(component,event){
        var z =  component.find("link1");
        alert(z.get("v.value"));
        
    },
     emptyaccountlist:function(component,event){
         if(component.get("v.rollupaccid") != ''){
             component.set("v.accounts","");
              component.set("v.show",false);
             
         }
        
    },
    
    
    searchKeyChange2: function(component, event) {
        
        component.set("v.hideunhide",true);
        //   console.log('event handled');
        //   console.log(event.getName());
        //   debugger;
        var searchKey = event.getParam("searchkey1");        
        var action1 = component.get("c.findByName");//method name should match word and case in controller method definiction.
        action1.setParams({
            "searchKey": searchKey 
            //parameters of methods should be in exact same word and case,as defined in the controller method.
        });
        if(searchKey !=" "){
            action1.setCallback(this, function(a) {     
                component.set("v.accounts", a.getReturnValue());
            });
            $A.enqueueAction(action1);
        } else{
             component.set("v.accounts", "");
        }   
    }
    
})