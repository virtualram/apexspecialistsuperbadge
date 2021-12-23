({
    searchKeyChange: function(component, event, helper) {
      //  debugger;
	var myEvent = $A.get("e.c:searchbarcomp");
        //  in case of no namespace enabled: "e.devlight1973:eventname"

    console.log('fired keyboard event with the following value'+event.target.value);
           
        myEvent.setParams({"searchkey1": event.target.value});
       // debugger;
        myEvent.fire();
        //alert(myEvent.getParam("searchkey1"));
    }
})