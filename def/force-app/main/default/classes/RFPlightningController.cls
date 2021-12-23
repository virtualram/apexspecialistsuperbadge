public class RFPlightningController {
    
    public static String errmessage;
    public static Integer errindex;
    public static Integer errindex2;


  /*public static void Save(  String clienttype,String consultant,Boolean consultantforopp,String deliverymethod,String difficulty,
                            Boolean knowCompetitor,String finalpresentation,String howcomeacrossopp,String howtodifferenciate,
                            String length,String lostorwon,String mdname,String nontaxsubclitype,String opportunity,
                            String rfprequestreason,String requesttype,String status,Date rfpduedate,String teamcontact,String issues,
                            String relationshiptothem,String theirposition,String keydescisionmaker,String competitordetails
                         ) {  */
  /*public static String Save(  String clienttype,String consultant,Boolean consultantforopp,String deliverymethod,String difficulty,
                            Boolean knowCompetitor,String finalpresentation,String howcomeacrossopp,String howtodifferenciate,
                            String length,String lostorwon,
                            String rfprequestreason,String requesttype,Date rfpduedate,String issues,
                            String relationshiptothem,String theirposition,String keydescisionmaker,String competitordetails
                         ) {  
                             
								RFP_Request__c RFP =new RFP_Request__c();
                             
                             	RFP.Client_Type__c = clienttype;
                                RFP.Consultant__c = consultant;
                                RFP.consultant_for_this_opportunity__c = consultantforopp;
                                RFP.Delivery_Method__c = deliverymethod;
                                RFP.Difficulty__c = difficulty;
                                RFP.Do_we_know_who_the_other_competitors_are__c = knowCompetitor;
                                RFP.Finals_Presentation__c = finalpresentation;
                                RFP.How_did_you_come_across_this_opportunity__c = howcomeacrossopp;
                                RFP.How_to_differentiate_ourselves_in_this__c = howtodifferenciate;
                                RFP.Length__c = length;
                                RFP.Lost_or_Won__c = lostorwon;
                                RFP.Reason_For_RFP__c = rfprequestreason;
                                RFP.Request_Type__c = requesttype;
                                //RFP.RFP_Due_to_Prospect__c = rfpduedate;
                                RFP.What_are_the_issues__c = issues;
                                RFP.What_is_our_relationship_to_them__c = relationshiptothem;
                                RFP.What_is_their_position__c = theirposition;
                                RFP.What_key_decision_makers_do_we_know__c = keydescisionmaker;
                                RFP.Who_are_the_competitors__c = competitordetails;
                             
                                try{
                                     insert RFP;
                                         
                                    } catch (DMLException e){
                                        system.debug('Line number 52'+e.getMessage());
                                        errindex =   e.getMessage().IndexOf('EXCEPTION');
                                        errindex2 =   e.getMessage().lastIndexOf('[');
                                        // errmessage =   e.getMessage();
                                        
                                        errmessage =   e.getMessage().subString(errindex, errindex2-2);
                                        
                                        system.debug(errmessage +'5000');
                                        //rrWrap.msg = errmessage;
                                        //return rrWrap;
                                        return errmessage;           
                                   }
                             
                                     String idd = RFP.id;
               						 RFP = [select id,name from RFP_Request__c where id =:idd];
                					 String RFPdetails = JSON.serialize(RFP);
                 					 return RFPdetails;                           
                         }  
  
 */

 @AuraEnabled   
 //public static List <String> statuslist(sObject objObject, string fld) {
    //Need to convert this to all prupose library
  public static List <String> getselectOptions(sObject objObject, string fld) {
  List < String > allOpts = new list < String > ();  
  Schema.sObjectType objType = objObject.getSObjectType(); 
  Schema.DescribeSObjectResult objDescribe = objType.getDescribe();
  map < String, Schema.SObjectField > fieldMap = objDescribe.fields.getMap();
 
  list < Schema.PicklistEntry > values = fieldMap.get(fld).getDescribe().getPickListValues();
         
    for (Schema.PicklistEntry a: values) {
         allOpts.add(a.getValue());
    }
  
  allOpts.sort();
  return allOpts;
 }
/*
  @AuraEnabled  
  public static Map<String,List<String>> getDependentOptionsImpl(string objApiName , string contrfieldApiName , string depfieldApiName){
        system.debug(objApiName + '##' + contrfieldApiName + '###' + depfieldApiName);
        String objectName = objApiName.toLowerCase();
         System.debug('objectnameis'+objectName);
        String controllingField = contrfieldApiName.toLowerCase();
        String dependentField = depfieldApiName.toLowerCase();
        
        Map<String,List<String>> objResults = new Map<String,List<String>>();
            //get the string to sobject global map
        Map<String,Schema.SObjectType> objGlobalMap = Schema.getGlobalDescribe();
         
        if (!Schema.getGlobalDescribe().containsKey(objectName)){
            System.debug('OBJNAME NOT FOUND --.> ' + objectName);
            return null;
         }
        
        Schema.SObjectType objType = Schema.getGlobalDescribe().get(objectName);
        if (objType==null){
            return objResults;
        }
       Bitset bitSetObj = new Bitset();
        Map<String, Schema.SObjectField> objFieldMap = objType.getDescribe().fields.getMap();
        //Check if picklist values exist
        if (!objFieldMap.containsKey(controllingField) || !objFieldMap.containsKey(dependentField)){
            System.debug('FIELD NOT FOUND --.> ' + controllingField + ' OR ' + dependentField);
            return objResults;     
        }
        
        List<Schema.PicklistEntry> contrEntries = objFieldMap.get(controllingField).getDescribe().getPicklistValues();
        List<Schema.PicklistEntry> depEntries = objFieldMap.get(dependentField).getDescribe().getPicklistValues();
         objFieldMap = null;
        List<Integer> controllingIndexes = new List<Integer>();
        for(Integer contrIndex=0; contrIndex<contrEntries.size(); contrIndex++){            
            Schema.PicklistEntry ctrlentry = contrEntries[contrIndex];
            String label = ctrlentry.getLabel();
            objResults.put(label,new List<String>());
            controllingIndexes.add(contrIndex);
        }
        List<Schema.PicklistEntry> objEntries = new List<Schema.PicklistEntry>();
        List<PicklistEntryWrapper> objJsonEntries = new List<PicklistEntryWrapper>();
        for(Integer dependentIndex=0; dependentIndex<depEntries.size(); dependentIndex++){            
               Schema.PicklistEntry depentry = depEntries[dependentIndex];
               objEntries.add(depentry);
        } 
        objJsonEntries = (List<PicklistEntryWrapper>)JSON.deserialize(JSON.serialize(objEntries), List<PicklistEntryWrapper>.class);
        List<Integer> indexes;
        for (PicklistEntryWrapper objJson : objJsonEntries){
            if (objJson.validFor==null || objJson.validFor==''){
                continue;
            }
            indexes = bitSetObj.testBits(objJson.validFor,controllingIndexes);
            for (Integer idx : indexes){                
                String contrLabel = contrEntries[idx].getLabel();
                objResults.get(contrLabel).add(objJson.label);
            }
        }
        objEntries = null;
        objJsonEntries = null;
        system.debug('objResults--->' + objResults);
        return objResults;
    }
*/
}