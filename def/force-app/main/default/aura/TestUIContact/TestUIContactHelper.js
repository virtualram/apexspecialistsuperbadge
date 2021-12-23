({sendMessage : function(component, event, helper) {
        var msg = {
            name: "General",
            value: "Test"
        };
        component.find("AngularApp").message(msg);
    },
    handleMessage: function(component, message, helper) {
        console.log('message received');
        var payload = message.payload;
        var name = payload.name;
        if (name === "General") {
            var value = payload.value;
            component.set("v.messageReceived", value);
        }
        else if (name === "Foo") {
            // A different response
        }
    },

    showmessage1 : function(component) {
        
        console.log("this is debugging message");
        alert( component.get("v.Maturity"));
    },
    
    validate12: function(component,helper){
         var inputcmp = component.find("tenure");
         var val  =inputcmp.get("v.value"); 
        console.log(component);
       // console.log(inputcmp.get("v.label"));
        if (val <10){     
        inputcmp.set("v.errors",[{message :'Value cant be less than 10 '}]);
            
        }else{
             inputcmp.set("v.errors",[{message :''}]);
            helper.calculate2(component); 
        }  
            //add the line to remove class and show error message on text1
        
    },
   
    calculate2 : function(component) {     
        

        
        
        
        var x = component.get("v.Amount");
     
        var y = component.get("v.Tenure");
        var z =0; 
        if(y < 12){
            z = x +1000;            
        }
        if(y >12){            
            z = x -1000;
        }   
        component.set("v.Maturity",z);
        console.log(z);
         console.log('inside helper');
       
    }
    
    
})