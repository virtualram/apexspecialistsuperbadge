({
	render : function(component, helper) {
  var returnVal = this.superRender();
  console.log('render ran');
        
   return returnVal; 
},
    rerender : function(component, helper) {
   this.superRerender();//whenver data is refreshed from server
   console.log('rerender ran');
},
    afterRender : function(component, helper) {
  this.superAfterRender();
   console.log('after render ran');
},
    unRender : function(component, helper) {
         console.log('unrende ran');
  this.superUnrender();
        
   // Write your custom code here. 
}
})