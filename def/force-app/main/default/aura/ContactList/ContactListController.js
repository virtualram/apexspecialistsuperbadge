({
    doInit : function(component, event) {
        //  debugger;
        var action = component.get("c.findAll");
        action.setCallback(this, function(a) {
            component.set("v.contacts", a.getReturnValue());
        });
        
        console.log(component.get("v.contacts"));
        $A.enqueueAction(action);
    },      
    
    showalert:function(component,event){
        var z =  component.find("link1");
        alert(z.get("v.value"));
        
    },
    searchKeyChange2: function(component, event) {
        //   console.log('event handled');
        //   console.log(event.getName());
        var searchKey = event.getParam("searchkey1");        
        var action1 = component.get("c.findByName");//method name should match word and case in controller method definiction.
        action1.setParams({
            "searchKey": searchKey 
            //parameters of methods should be in exact same word and case,as defined in the controller method.
        });
        action1.setCallback(this, function(a) {     
            component.set("v.contacts", a.getReturnValue());
        });
        $A.enqueueAction(action1);
    }
    
})