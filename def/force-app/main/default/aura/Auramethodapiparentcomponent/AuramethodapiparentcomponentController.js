({
	myAction : function(component, event, helper) {
        console.log("parent comp method");
		var childcomp = component.find("x");
        childcomp.execute1();
	}
})