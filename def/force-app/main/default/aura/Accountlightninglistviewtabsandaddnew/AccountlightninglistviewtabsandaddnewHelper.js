({
 getAllAccounts : function(component) {
 var action = component.get("c.getAllAccounts");
 action.setCallback(this, function(response) {
 var state = response.getState();
 if (component.isValid() && state === "SUCCESS") {
 component.set("v.accounts", response.getReturnValue()); 
 var loading = component.find("loading");
 $A.util.toggleClass(loading, "slds-hide");
 }
 });
 $A.enqueueAction(action);
 },
 saveAccount : function(component,acc){
 var action = component.get("c.createAccount");
 action.setParams({
 "acc": acc
 });
 action.setCallback(this, function(response) {
 var state = response.getState();
 if (component.isValid() && state === "SUCCESS") {
 var loading = component.find("loading");
 $A.util.toggleClass(loading, "slds-hide"); 
 }
 });
 $A.enqueueAction(action);
 }
})