({
 doInit : function(component, event, helper) {
 var loading = component.find("loading");
 $A.util.toggleClass(loading, "slds-hide");
 //helper.getAllAccounts(component);
 },
 submitForm : function(component, event, helper){
 var loading = component.find("loading");
 $A.util.toggleClass(loading, "slds-hide"); 
 var account = component.get("v.account"); 
 helper.saveAccount(component,account); 
 },
 changeTab : function(component, event, helper){
 var tab = event.detail.selectedTab;
 var tabId = tab.get('v.id');
 if(tabId === 'allAccount'){
 var loading = component.find("loading");
 $A.util.toggleClass(loading, "slds-hide");
 helper.getAllAccounts(component);
 }
 
 }
})