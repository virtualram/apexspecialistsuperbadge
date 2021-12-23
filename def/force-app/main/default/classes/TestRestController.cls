@RestResource(urlMapping='/TestRest/*')
global with sharing class TestRestController{

    
  @HttpPost
    global  static String createnecase(String var1){
    System.debug('Call from rest was successfull'+var1);
    return 'hi ';
    
 }   
 


}