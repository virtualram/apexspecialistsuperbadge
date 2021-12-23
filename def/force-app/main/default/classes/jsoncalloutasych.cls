public class jsoncalloutasych {
    
    public void callout1(){
HttpRequest req = new HttpRequest();
    HttpResponse res = new HttpResponse();
req.setTimeout(60000);
    Http http = new Http();
  
//req.setEndPoint(system.label.endpoint);
 
req.setEndpoint('http://ausiwgptdwb02.aus.amer.dell.com/GPTExternalWebAPI/GatewayServicesAPI/api/FMTServices/GetRegion');
    req.setMethod('POST');
JSONGenerator gen = JSON.createGenerator(true);    
	
	gen.writeStartObject();      
	gen.writeStringField('ToolName', 'FMT');
	gen.writeStringField('SI', 'BM3K05');
		gen.writeEndObject();    
	 
	String jsonS = gen.getAsString();
System.debug('jsonMaterials'+jsonS);

// Sening the http body with JSON 



    req.setCompressed(false);
 req.setBody(jsonS );
  //  req.setBody('ToolName=FMT&SI=BM3K05');
    req.setHeader('Content-Type', 'application/json'); 
req.setHeader('Authorization','AUTHKEYTEMPORARY');

    try {
        res = http.send(req);
       // string statuscode = res.getStatus();
        } catch(System.CalloutException e) 
        {
        System.debug('Callout error: '+ e);
           // System.debug('The value is: ' + statuscode);
              }
    System.debug(res.getBody());
    }}