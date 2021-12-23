({
	helperMethod1 : function(component) {
		 
      
        var opts = [];
       // 
        var action =component.get("c.getpickvals");
        action.setParams({"Fieldname" : "Type"});        
        action.setCallback(this, function(a) {
              var  picklistvals =  a.getReturnValue();
            console.log('test'+picklistvals);
             if (picklistvals != undefined && picklistvals.length > 0) {
                    opts.push({
                        class: "optionClass",
                        label: "--- None ---",
                        value: ""
                    });
                }
                for (var i = 0; i < picklistvals.length; i++) {
                    opts.push({
                        class: "optionClass",
                        label: picklistvals[i],
                        value: picklistvals[i]
                    });
                }
            
              component.set("v.options",opts);     
            if(component.get("v.accObj.Type") != ''){
              // debugger;
                console.log("inside if"+ component.find("mySelect").get("v.value") +":"+component.get("v.accObj.Type"));
                 
                
                //the below code is needed because the dom is not fully done,so we wait for the dom to get created
                //https://salesforce.stackexchange.com/questions/154899/lightningselect-set-default-value-based-on-sobject-list-from-apex-controller/154906
                
               window.setTimeout(
                $A.getCallback( function() {
                    // Now set our preferred value
                    component.find("mySelect").set("v.value",component.get("v.accObj.Type"));
                }
               ));

            }
        });
        $A.enqueueAction(action);
	},
    helperMethod2: function(component) {
		 
      
        var opts1 = [];
       // 
        var action =component.get("c.getpickvals");
        action.setParams({"Fieldname" : "Industry"});        
        action.setCallback(this, function(a) {
              var  picklistvals =  a.getReturnValue();
            console.log('test'+picklistvals);
             if (picklistvals != undefined && picklistvals.length > 0) {
                    opts1.push({
                        class: "optionClass",
                        label: "--- None ---",
                        value: ""
                    });
                }
                for (var i = 0; i < picklistvals.length; i++) {
                    opts1.push({
                        class: "optionClass",
                        label: picklistvals[i],
                        value: picklistvals[i]
                    });
                }
            console.log('ind'+opts1);
              component.set("v.options1",opts1);     
            if(component.get("v.accObj.Industry") != ''){
              // debugger;
                console.log("inside if"+ component.find("mySelect1").get("v.value") +":"+component.get("v.accObj.Industry"));
                 
                
                //the below code is needed because the dom is not fully done,so we wait for the dom to get created
                //https://salesforce.stackexchange.com/questions/154899/lightningselect-set-default-value-based-on-sobject-list-from-apex-controller/154906
                
               window.setTimeout(
                $A.getCallback( function() {
                    // Now set our preferred value
                    component.find("mySelect1").set("v.value",component.get("v.accObj.Industry"));
                }
               ));

            }
        });
        $A.enqueueAction(action);
	}

})