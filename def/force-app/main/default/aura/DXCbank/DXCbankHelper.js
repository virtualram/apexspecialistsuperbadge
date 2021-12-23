({
	helperMethod : function() {
		
	},
    calchelper : function(component, event, helper) {
          if (component.find("tenure").get("v.value") <=9 ){
            var x = component.get("v.Amount");
        var y = component.get("v.Tenure");
        var a = x * y;
        component.set("v.Maturity",a);
              sessionStorage.setItem("xx",component.get("v.Maturity"));
        }
		
	},
     tenurecheckhelper :function(component,event,helper){
        if (component.find("tenure").get("v.value") >9 ){
            component.find("tenure").set("v.errors",[{"message":"Tenure cannot be greater than 9"}]);
            
        }
    }
})