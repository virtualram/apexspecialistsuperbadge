({
	helperMethod1 : function(component,helper) {
        var inputcmp = component.find("tenure");
        var a = inputcmp.get("v.value");
        console.log(a);
        if (a >9){
            inputcmp.set("v.errors",[{message :'Value cant be more  than 9'}]);
        }else{
            helper.helpercalculate(component);
        }},
    
    helpercalculate:function(component){
            var inputcmp = component.find("tenure");
   			 inputcmp.set("v.errors",[{message :''}]);
                var x = component.get("v.Amount");
                var y = component.get("v.Tenure");    
                console.log(y);
                var z = x*y/100;  
                console.log(z);
                component.set("v.Maturity",z);
		}
})