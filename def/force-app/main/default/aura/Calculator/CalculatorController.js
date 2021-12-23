({
	adddata : function(component, event, helper) {
		var x = component.get("v.firstvalue");
        alert(x.toString().length);
        var y = 0;
        y++;
        sessionStorage.removeItem("lastvalue");
        sessionStorage.setItem("lastvalue", x);
        
        
	},
    showdata : function(component, event, helper) {
	var z= 	parseInt(sessionStorage.getItem("lastvalue")) + +parseInt(component.get("v.firstvalue"));
     console.log(z);
       
        
    }})