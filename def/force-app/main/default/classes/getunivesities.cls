global with sharing class getunivesities{

  
  @RemoteAction
  global static List<devlight1973__University_locations__c> getunivs(){
  
  
  List<devlight1973__University_locations__c> un = [Select Id,Name, Location__Latitude__s, Location__Longitude__s from devlight1973__University_locations__c];
  return un;
  
  }
  
}