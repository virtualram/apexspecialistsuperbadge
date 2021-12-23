({

    buildPicklistValues2 : function(component, event, helper) {
    var action = component.get("c.getcontactrels");
   // var contactId = component.get("v.childAttr");
        var conId=component.get('v.selConId');
    var inputMultiSel = component.find("leftSelectedValues");
      //  alert('contactId'+conId);
    var opts=[];
    action.setParams({
        'accid' : conId
        
    });
	action.setCallback(this, function(response) {
	var state=response.getState();
	if(state === "SUCCESS"){
		var res = response.getReturnValue();
        //alert('respvalue'+res);
        for(var i=0;i< res.length;i=i+1){
        opts.push({"class": "optionClass",
        label: res[i].substring(19, res[i].length),
        value: res[i]});
        var zz=  component.get("v.selectedrelidshidden");
        component.set("v.selectedrelidshidden",zz+res[i]);
        }
       // alert('relValued'+ opts);
        inputMultiSel.set("v.options", opts);
    }
});
$A.enqueueAction(action);
},
   
    primaryRelSelected : function(component, event, helper) {
    var action = component.get("c.updatePrimary");
   
    var selConId=component.get('v.selConId');
    var selRelId = component.find("rightSelectedValues").get("v.value").substring(0,18);
      //  alert('selectedrelid' + selRelId);
     
    var opts=[];
        console.log(component.find("rightSelectedValues").get("v.value")+'hi baba')
    action.setParams({
        'accnid' : selRelId ,
        'contid' : selConId
        
    });
        
    action.setCallback(this, function(response) {
	var state=response.getState();
	if(state === "SUCCESS"){
		alert("record saved");
       
      }
});

	
$A.enqueueAction(action);
},

 
shiftRight : function(component, event, helper) {
    var addSelValues = component.get("v.addSelectedValues").split(";");
    var leftOpts = [];
    var rightOpts = [];
    
   // alert("selected values : "+addSelValues);
	rightOpts = component.find("rightSelectedValues").get("v.options");
	leftOpts = component.find("leftSelectedValues").get("v.options");
    for(var i=0;i< addSelValues.length;i++)
    {
        rightOpts.push({"class": "optionClass",
        label: addSelValues[i].substring(19, addSelValues[i].length),
        value: addSelValues[i]});
       // value: addSelValues[i].substring(0,18)});
        for(var j=0;j< leftOpts.length;j++)
        {
            if(leftOpts[j]["value"] == addSelValues[i])
            {
                leftOpts.splice(j,1);
                break;
            }
    	}
    }
    component.find("rightSelectedValues").set("v.options", rightOpts);
    component.find("leftSelectedValues").set("v.options", leftOpts);
},
shiftLeft : function(component, event, helper) {
    var remSelValues = component.get("v.removeSelectedValues").split(";");
    var leftOpts = [];
    var rightOpts = [];
 
    rightOpts = component.find("rightSelectedValues").get("v.options");
    leftOpts = component.find("leftSelectedValues").get("v.options");
    for(var i=0;i< remSelValues.length;i++){
    leftOpts.push({"class": "optionClass",
    label: remSelValues[i].substring(19, remSelValues[i].length),
    value: remSelValues[i]});
    for(var j=0;j< rightOpts.length;j++)
    {
        if(rightOpts[j]["value"] == remSelValues[i])
        {
            rightOpts.splice(j,1);
            break;
        }
    }
    }
    component.find("leftSelectedValues").set("v.options", leftOpts);
    component.find("rightSelectedValues").set("v.options", rightOpts);
},
})