public class Httpcalloutjson {
/*public static HttpResponse makeGetCallout() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        //request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setEndpoint('http://dummy.restapiexample.com/api/v1/employees');
        request.setMethod('GET');
        HttpResponse response = http.send(request);   
    
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            // Deserializes the JSON string into collections of primitive data types.
            system.debug(response.getBody());
        //    Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
          // system.debug(results);
            // Cast the values in the 'animals' key as a list
            //List<Object> animals = (List<Object>) results.get('animals');
            // List<string> animals  = new List<STring>();
            //List<Object> animals =   JSON.deserializeUntyped(response.getBody());
           
      //      System.debug('Received the following animals:');
           for (Object animal: animals) {
               System.debug(animal);
           }
        }
        return response;
    }*/
public static HttpResponse makePostCallout() {
       
 Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody('{"name":"mighty moose1"}');
        HttpResponse response = http.send(request);
        // Parse the JSON response
        if (response.getStatusCode() != 201) {
            System.debug('The status code returned was not expected: ' +
                response.getStatusCode() + ' ' + response.getStatus());
        } else {
            System.debug(response.getBody());
        }
        return response;
    }

}