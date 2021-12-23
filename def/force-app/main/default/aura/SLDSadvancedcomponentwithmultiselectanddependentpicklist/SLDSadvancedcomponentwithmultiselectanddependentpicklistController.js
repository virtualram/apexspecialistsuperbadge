({  
    save : function(component, event, helper) {
      
        var Contact  = component.get("v.Contact"); 
        var Base  = component.get("v.Base"); 
        var Type = component.get("v.Type");
        var Category = component.get("v.Category");
        var Resource = component.get("v.Resource");
        var Location = component.get("v.Location");
        var TravelRequired = component.get("v.TravelRequired");
        var Office = component.get("v.BernsteinOffice");
        var x ='' ;
        var action = component.get("c.Save");
        action.setParams({ cont           : component.get("v.Contact"), 
            			   base           : component.get("v.Base"), 
                           type           : component.get("v.Type"),
                           category       : component.get("v.Category"),
                           resource        : component.get("v.Resource"),
                           location       : component.get("v.Location"),
                           travel         : component.get("v.TravelRequired"),
                           office         : component.get("v.BernsteinOffice"),
                          });  
        
        action.setCallback(this, function(response) {
            console.log(response.getState());
               if (response.getState() == "SUCCESS"){
                   console.log('success'); 
                   x = response.getReturnValue();
                 console.log(x);
                   x="/"+x;
                   console.log(x) ;
                  
   				var event = $A.get('e.force:navigateToObjectHome');

                    event.setParams({
                        scope: 'WPA_SPM_Request__c'
                    });

					event.fire();
                   
              }else{console.log('failure');}
       } );
      //  debugger;
         $A.enqueueAction(action);
	},
	 
    onSelectChange: function(component, event, helper) {
   
       var s1 = event.getSource().toString();
       console.log(s1);
       console.log(s1.search('selectid'));
     
    /*   if(s1.search('selectType') >0){
           console.log('46');
       component.set("v.Type",event.getSource().get("v.value"));
       }
     if(s1.search('selectCategory') >0){
           console.log('46');
       component.set("v.Category",event.getSource().get("v.value"));
       } */
      if(s1.search('selectlocation') >0){
           console.log('46');
       component.set("v.Location",event.getSource().get("v.value"));
       }
      if(s1.search('selectOffice') >0){
           console.log('46');
       component.set("v.BernsteinOffice",event.getSource().get("v.value"));
       }
    },
    
      // function call on change tha controller field  
   onControllerFieldChange: function(component, event, helper) {
     // alert(event.getSource().get("v.value"));
      // get the selected value
      var controllerValueKey = event.getSource().get("v.value");
 
      // get the map values   
      var Map = component.get("v.depnedentFieldMap");
 
      // check if selected value is not equal to None then call the helper function.
      // if controller field value is none then make dependent field value is none and disable field
      if (controllerValueKey != '--- None ---') {
 
         // get dependent values for controller field by using map[key].  
         // for i.e "Internal" is controllerValueKey so in the map give key Name for get map values like 
         // map['Internal'] = its return all dependent picklist values.
         var ListOfDependentFields = Map[controllerValueKey];
         helper.fetchDepValues(component, ListOfDependentFields);
 
      } else {
         var defaultVal = [{
            class: "optionClass",
            label: '--- None ---',
            value: '--- None ---'
         }];
         component.find('conState').set("v.options", defaultVal);
         component.set("v.isDependentDisable", true);
      }
   },
 
   // function call on change tha Dependent field    
   onDependentFieldChange: function(component, event, helper) {
   //   alert(event.getSource().get("v.value"));
   },
    
    doInit: function(component, event, helper) {
   
		//helper.getStatusVal(component, 'Type__c', 'selectType');
        //helper.getStatusVal(component, 'Category__c', 'selectCategory');
        helper.getStatusVal(component, 'Location__c', 'selectlocation');
        helper.getStatusVal(component, 'Bernstein_Office__c', 'selectOffice');
        helper.fetchPicklistValues(component, 'Type__c', 'Category__c');
    }
 
})