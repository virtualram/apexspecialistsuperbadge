({
	execute1 : function(component, event, helper) {
		//alert('Calling child method,value passed from parent'+component.get("v.childattr1"));
        console.log("child comp method");
        component.set("v.childattr1","child comp changed my value");
	}
})