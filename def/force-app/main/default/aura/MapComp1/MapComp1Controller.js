({
    setmapcoords: function(component, event, helper) {
      //  debugger;
	var myEvent = $A.get("e.c:MapEvent");
   //  var myEvent2 = $A.get("e.c:MapEvent");
console.log('fir');
   myEvent.setParams({"lat": component.get("v.lat")});
        //    
     myEvent.setParams({"long": component.get("v.long")});
       // debugger;
      myEvent.fire();
        //alert(myEvent.getParam("searchkey1"));
       // alert(component.get("long"));
    }
})