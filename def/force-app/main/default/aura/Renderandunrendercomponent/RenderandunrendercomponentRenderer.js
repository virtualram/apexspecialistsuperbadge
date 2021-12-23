({
    render: function(cmp, helper) {
       console.log('render');
     cmp.changeValue(cmp);
       return this.superRender()
    },
})