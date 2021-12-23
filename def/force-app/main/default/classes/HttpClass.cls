public class HttpClass {
    
    
     public static Httpresponse calloutpost(){
        http htp = new Http();
        httprequest htr = new httprequest();
        
        htr.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        htr.setMethod('POST');
        htr.setHeader('Content-Type', 'application/json;charset=UTF-8');
        htr.setBody('{"name":"mighty moose"}');
        
        httpresponse resp =  htp.send(htr);
        system.debug(resp.getStatusCode()); 
        // If the request is successful, parse the JSON response.
        if (resp.getStatusCode() == 200) {
            system.debug(resp.getBody());
                
        }
        return resp;
    }
    
    
   
    
    
    
    public static Httpresponse callout1(){
        http htp = new Http();
        httprequest htr = new httprequest();
        
        //htr.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        htr.setEndpoint('https://www.google.com/search?q=weather');
        htr.setMethod('GET');
        
        
        httpresponse resp =  htp.send(htr);
        // If the request is successful, parse the JSON response.
        if (resp.getStatusCode() == 200) {
            // Deserializes the JSON string into collections of primitive data types.
         //   Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(resp.getBody());
            // Cast the values in the 'animals' key as a list
         //   List<Object> animals = (List<Object>) results.get('animals');
            System.debug('Received the following animals:'+resp.getBody());
         //   for (Object animal: animals) {
          //      System.debug(animal);
         //   }
            
        }
        return resp;
    }


}