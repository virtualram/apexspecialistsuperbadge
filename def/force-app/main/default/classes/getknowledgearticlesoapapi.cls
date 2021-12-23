global with sharing class getknowledgearticlesoapapi{
  webservice static String getKAsoap(){
   List<devlight1973__faq__kav > blist = new List<devlight1973__faq__kav >(); 
    blist= [SELECT KnowledgeArticleId, devlight1973__Fielattachmenta__Body__s,ArticleNumber,devlight1973__ArticleBody__c FROM devlight1973__faq__kav where id ='ka39000000092ABAAY' limit 1];
     String s = EncodingUtil.base64Encode(blist[0].devlight1973__Fielattachmenta__Body__s);
    return s;
   
   
   }





}