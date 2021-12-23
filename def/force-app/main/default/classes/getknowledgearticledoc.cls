@RestResource(urlMapping='/GetKA/*')
global without sharing class getknowledgearticledoc {

    @HttpGet
    global static String getDocById() {
        RestRequest request = RestContext.request;
       
       try{
        String doc ='';
         String s ='';
        List<Map<String,String>> returnmaplist = new List<Map<String,String>>();
        // grab the caseId from the end of the URL
       String articleid = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
     //  devlight1973__Document__kav  kav =  [SELECT Id,devlight1973__Documentfilenam__Name__s from devlight1973__Document__kav WHERE Id = :kavid];
      //  Blob b;
        list<devlight1973__faq__kav> blist = new list<devlight1973__faq__kav>();
      
   //  blist= [SELECT KnowledgeArticleId, devlight1973__Fielattachmenta__Body__s,ArticleNumber,devlight1973__ArticleBody__c FROM devlight1973__faq__kav where id ='ka39000000092ABAAY' limit 1];
  
  
   

 
   blist =[SELECT ArticleNumber,ArticleType,CreatedById,CreatedDate,devlight1973__ArticleBody__c,devlight1973__Fielattachmenta__ContentType__s,devlight1973__Fielattachmenta__Length__s,devlight1973__Fielattachmenta__Name__s,IsLatestVersion,IsVisibleInApp,IsVisibleInCsp,IsVisibleInPkb,IsVisibleInPrm,KnowledgeArticleId,Language,Title,UrlName FROM devlight1973__FAQ__kav where knowledgearticleid =:articleid and language='en_US'  and publishstatus='online' ];
      system.debug('15'+JSON.serialize(blist));
      String z = '/servlet/fileField?entityId=' +blist[0].id+ '&field=devlight1973__Fielattachmenta__Body__s';
    s =JSON.serializepretty(blist);
    s = s+'::::' +z;
     ///servlet/fileField?entityId=ka0j0000000OfrlAAC&field=File_Attachment__Body__s  
     
 
     
   //   s =JSON.serializepretty(blist);  
       return s;
        }
        catch(Exception e){
        
        return e.getMessage();
        }
      
       //use this url to call from workbench /services/apexrest/devlight1973/GetCase/5009000001NxD87
       
       }
       }