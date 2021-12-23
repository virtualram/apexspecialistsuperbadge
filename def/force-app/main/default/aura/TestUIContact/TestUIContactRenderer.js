({
	afterRender: function (cmp, helper) {
   this.superAfterRender();
    //var cmpTarget = cmp.find("text1");
     //   $A.util.addClass(cmpTarget , 'toggle2');
       alert('After Render fired');
    }
    
})