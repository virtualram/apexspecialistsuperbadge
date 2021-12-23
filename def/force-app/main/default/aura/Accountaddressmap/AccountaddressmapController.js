( {
       
    jsLoaded: function(component, event, helper) {  
 
    
        var map = L.map('map', {zoomControl: false}).setView([37.784173, -122.401557],14);
    
       L.tileLayer('https://server.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer/tile/{z}/{y}/{x}',
           {
               attribution: 'Tiles © Esri'
           }).addTo(map);

        // Add marker
        L.marker([37.784173, -122.401557]).addTo(map)
            .bindPopup('Home of Dreamforce');
       
        
    }
,
    
    
    getcoords : function(component,event,helper){
    //this call server side controller action
    ////first get action variable intialised with controller method apex function
   //this.superRerender();

        var lat1= event.getParam("lat");
          debugger;
   		var long1 = event.getParam("long");
        
  
     
    } ,

    
        
    getaccountdetailscmp : function(component,event,helper){
    //this call server side controller action
    ////first get action variable intialised with controller method apex function
        var action = component.get("c.retaccountdetails");
    	action.setParams({ id: component.get("v.accid") });
        action.setCallback(this, function(a) {
           // component.set("v.accountName", a.getReturnValue());
          alert(a.getReturnValue());
        });
        $A.enqueueAction(action);
    }
    
}