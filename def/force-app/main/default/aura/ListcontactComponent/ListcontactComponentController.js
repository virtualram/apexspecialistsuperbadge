({
	doInit : function(component, event, helper){
        var action = component.get("c.getrecs");
        action.setCallback(this, function(response){
            var accs = response.getReturnValue();
              console.log(accs+'accs');
            if (accs.length >0 ) {               
                 console.log('ssssssss');
                
                var wrappers=new Array();
                        for (var idx=0; idx<accs.length; idx++) {
                            console.log(accs[idx]);
                            var wrapper = { 'acc' : accs[idx],
                                           'selected' : false
                                                    };
                             wrappers.push(wrapper);
                        }
                console.log(wrappers+'wrappers');
				component.set("v.Contactwrapper", wrappers);               
            }
             console.log(component.get("v.Contactwrapper"));
        });
        $A.enqueueAction(action); 
    },
    storeval: function(component){
     
      var x= new Array();
        x= component.get("v.Contactwrapper");
        console.log(x);
    }
})