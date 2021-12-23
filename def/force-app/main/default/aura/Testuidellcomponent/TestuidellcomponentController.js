({
	calculate1 : function(component, event, helper) {
       sessionStorage.setItem("lastvalue", 500);
        helper.helperMethod1(component,helper);  
        },
		
	
 
 checksession :function(component){
     console.log(sessionStorage.getItem("lastvalue"));
}
 

}

)