public class callout1 {

//@Future(callout=true)
    public static void callexternal(){
        
        /*
        Http h = new Http();
        HttpRequest hr = new HttpRequest();
        hr.setEndpoint('http://localhost:8080');
        hr.setHeader('content-type', 'application/text; charset=utf-8');
        hr.setMethod('POST');
        hr.setBody('test');  
        HttpResponse  res= h.send(hr);
         system.debug(res+'this is the result');*/
         
         
         HttpRequest r = new HttpRequest();
r.setMethod('GET');
r.setEndpoint('https://www.youtube.com/watch?v=IjHgzkQM2Sg');
Http http = new Http();
HttpResponse res = http.send(r);
blob image = res.getBodyAsBlob();
Document d = new Document();
d.name = 'logo.mp4';
d.body = image;
d.folderId = UserInfo.getUserId();
insert d;
system.debug(d.id);
        
    }

}