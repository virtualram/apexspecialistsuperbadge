(/* ceHandlerController.js */
{
    handleApplicationEvent : function(cmp, event) {
      //  debugger;
      //  var apevent = $A.get("e.c:aeEvent"); one way to do this
 //       var message = apevent.getParam("message");
   //        var message = event.getParam("message");
        // set the handler attributes based on event data
//        cmp.set("v.messageFromEvent", message);
   //     var numEventsHandled = parseInt(cmp.get("v.numEvents")) + 1;
   //     cmp.set("v.numEvents", numEventsHandled);
    },
     addAppEventHandler : function(cmp, event) {
        
       //  debugger;
         cmp.addEventHandler("c:aeEvent", cmp.getReference("c.handleAppEvent"));
        // Can alternatively use anonymous function for handler
        //cmp.addEventHandler("devlight1973:appEvent", function(auraEvent) {
            // console.log("Handled the application event in anonymous function");
        //});
        console.log("Added handler for application event");
    },
     handleAppEvent : function(cmp, event) {
        // debugger;
        console.log("Handled the application event");
          var message = event.getParam("message");
        // set the handler attributes based on event data
        cmp.set("v.messageFromEvent", message);
        var numEventsHandled = parseInt(cmp.get("v.numEvents")) + 1;
        cmp.set("v.numEvents", numEventsHandled);

    }
    
    
    
})