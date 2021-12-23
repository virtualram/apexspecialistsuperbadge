({
	doInit: function(component, event, helper) {
      var m = new Date().toLocaleString();
      //  component.set("v.RFPDueDate",m);
      //  alert('date'+m);
      helper.fetchPickListValue(component, 'Client_Type__c', 'typeid');
      helper.fetchPickListValue(component, 'Delivery_Method__c', 'methodid');
      helper.fetchPickListValue(component, 'Difficulty__c', 'difficultid');
      helper.fetchPickListValue(component, 'Length__c', 'lengthid');
      helper.fetchPickListValue(component, 'Request_Type__c', 'requesttypeid');
      helper.fetchPickListValue(component, 'Finals_Presentation__c', 'finalspresentationid');
      helper.fetchPickListValue(component, 'Lost_or_Won__c', 'lostorwonid');
      
    },
    
    save : function(component, event, helper) {
        
            var context = component.get("v.myUserContext");
            var errMsg = '';
            var RRId ='' ;
            var action = component.get("c.Save");
            
            console.log('RFPDueDate'+component.get("v.RFPDueDate"));
            action.setParams({ 
                				//advisor				: ,
                				//secadvisor			: ,
                				
                				//cont                : component.get("v.selContact"), 
                                //base                : component.get("v.Base"), 
                				clienttype  		: component.get("v.ClientType"),
                                consultant   		: component.get("v.Consultant"),
                                consultantforopp 	:component.get("v.ConsultantForOpp"),
                                deliverymethod 		:component.get("v.DeliveryMethod"),
                                difficulty 			: component.get("v.Difficulty"),
                                knowCompetitor		: component.get("v.knowCompetitor"),
                                finalpresentation	: component.get("v.FinalPresentation"),
                                howcomeacrossopp	: component.get("v.HowYouComeAcrossThisOpp"),
                                howtodifferenciate	: component.get("v.HowtoDifferenciate"),
                                length				: component.get("v.Length"),
                                lostorwon			: component.get("v.LostOrWon"),
                                //mdname				: component.get("v.MDName"),
                                //nontaxsubclitype	: component.get("v.NonTaxableSubclientType"),
                                //opportunity			: component.get("v.Opportunity"),
                                rfprequestreason	: component.get("v.RFPRequestReason"),
                                requesttype			: component.get("v.RequestType"),
                                //status				: component.get("v.Status"),
                                rfpduedate			: component.get("v.RFPDueDate"),
                                //teamcontact			: component.get("v.TeamContact"),
                                issues				: component.get("v.Issues"),
                                relationshiptothem	: component.get("v.RelationshipToThem"),
                                theirposition		: component.get("v.theirPosition"),
                                keydescisionmaker	: component.get("v.KeyDescisionMaker"),
                                competitordetails	: component.get("v.CompetitorDetails"),
                             });  
            
            action.setCallback(this, function(response) {
                console.log(response.getState());
                if (response.getState() == "SUCCESS"){
                    console.log('success100' +response.getReturnValue()+'valueof'+response.getReturnValue().search('EXCEPTION') ); 
                    if(response.getReturnValue().search('EXCEPTION') > -1 || response.getReturnValue().search('exception')> -1){
                       
                        alert(response.getReturnValue().substring(10,response.getReturnValue().length));
                    }else{
                    
                    	var returnvalueobj = JSON.parse(response.getReturnValue());                    
                    	RRId = returnvalueobj.Id;  
                        	if(RRId.length > 18){                        
                    	    }else{                        
                                if(context != undefined) {
                                    if(context == 'Theme4t' || context == 'Theme4d') {
                                        console.log('VF in S1 or LEX');
                                        sforce.one.navigateToSObject(RRId.Id);
                                    } else {
                                        console.log('VF in Classic');
                                        window.location.assign('/'+RRId.Id);                                
                                    }
                                } else {
                                    console.log('standalone Lightning Component x.Id: ' + response.getReturnValue());
                                    var event = $A.get('e.force:navigateToSObject');
                                    
                                    event.setParams({"recordId": RRId,"tabname" :  returnvalueobj.Name});
                                    event.fire();
                                }   				  		       
                    		}
                    }
                }
                else if(response.getState() == "ERROR")
                {
                    var errors = response.getError();
                    if (errors) {
                        if (errors[0] && errors[0].message) {
                            console.log("Error message: " + errors[0].message);
                        }
                    } else {
                        console.log("Unknown error");
                    }
                    console.log('failure');
                    alert('Some Error occured! Please Try again, if problem persists contact adminnistrator');
                    errMsg = '<span><b>Some Error occured!<br/>Please Try again, if problem persists contact adminnistrator </b></span>';
                    
                    component.find("txtErrid").set("v.value", errMsg);
                    
                    
                }
            });
            $A.enqueueAction(action);
        
    },
   
    handleUploadFinished: function (cmp, event) {
        // Get the list of uploaded files
        var uploadedFiles = event.getParam("files");
        alert("Files uploaded : " + uploadedFiles.length);
    },
    
    onpicklistChange1: function(component, event, helper) {
        component.set("v.ClientType",event.getSource().get("v.value"));
    },
    onpicklistChange2: function(component, event, helper) {
        component.set("v.DeliveryMethod",event.getSource().get("v.value"));
    },
    onpicklistChange3: function(component, event, helper) {
        component.set("v.Difficulty",event.getSource().get("v.value"));
    },
    onpicklistChange4: function(component, event, helper) {
        component.set("v.Length",event.getSource().get("v.value"));
    },
    onpicklistChange5: function(component, event, helper) {
        component.set("v.RequestType",event.getSource().get("v.value"));
    },
    onpicklistChange6: function(component, event, helper) {
        component.set("v.FinalPresentation",event.getSource().get("v.value"));
    },
    onpicklistChange7: function(component, event, helper) {
        component.set("v.LostOrWon",event.getSource().get("v.value"));
    }
    
})