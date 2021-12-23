(/* aeHandlerController.js */
{
    handleApplicationEvent : function(cmp, event) {
       // debugger;
       // var apevent = $A.get("e.c:aeEvent");
        //one way to do this
      //  var message = apevent.getParam("message");
           var message = event.getParam("message");
        // set the handler attributes based on event data
        cmp.set("v.messageFromEvent", message);
        var numEventsHandled = parseInt(cmp.get("v.numEvents")) + 1;
        cmp.set("v.numEvents", numEventsHandled);
    }
})