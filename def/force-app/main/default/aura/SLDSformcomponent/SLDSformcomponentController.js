({	myAction : function(component, event, helper) {		
	},
    removecomponent: function(component,event,helper){        
	var targetCmp = component.find("body1");                
                    targetCmp.set("v.body",'');         
    },
    getCompnent: function(component, event, helper) {
        //Create component dynamically
        $A.createComponent(
            "c:TestUIContact",{},
            function(newcomponent){
                alert(component+':'+newcomponent);
                if (component.isValid()){                   
                    var targetCmp = component.find("body1");                
                    targetCmp.set("v.body",newcomponent);    
                }
            }            
        );
    },
})