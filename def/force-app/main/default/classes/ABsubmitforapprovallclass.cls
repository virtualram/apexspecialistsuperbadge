/**
 * @File Name          : ABsubmitforapprovallclass.cls
 * @Description        : 
 * @Author             : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Group              : 
 * @Last Modified By   : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Last Modified On   : 30/5/2019, 7:55:52 PM
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      		      Modification
 *==============================================================================
 * 1.0    30/5/2019, 7:55:52 PM   ChangeMeIn@UserSettingsUnder.SFDoc     Initial Version
**/
global with sharing class ABsubmitforapprovallclass {
    
    webservice static string submitforapproval(Id idd, String statusvalue){
        //test
        if (statusvalue =='Approved' ){
            Approval.ProcessSubmitRequest req1 =new Approval.ProcessSubmitRequest();
            req1.setComments('Submitting request for approval.');
            req1.setObjectId(idd);
             req1.setSubmitterId( UserInfo.getUserId());
             req1.setProcessDefinitionNameOrId('WPA_Approval');
            req1.setSkipEntryCriteria(true);
        
        // Submit the approval request for the account
            Approval.ProcessResult result = Approval.process(req1);
            
            if(result.isSuccess()){
              //  List<Id> newWorkItemIds = result.getNewWorkitemIds();

               return 'Approval process submitted successfully';
            }else{ return 'Approval proccess submission failed';}
           
    }else{
        return 'Approval proccess submission failed';
    }

    }

}
/*

and buttong code add this detail page button javascrtip to any object and submit for approval
from apex
{!REQUIRESCRIPT('/soap/ajax/29.0/connection.js')} 
{!REQUIRESCRIPT('/soap/ajax/29.0/apex.js')} 
{!REQUIRESCRIPT('/support/console/33.0/integration.js')} 


var val1 = sforce.apex.execute("ABsubmitforapprovallclass","submitforapproval",{idd:"{!WPA_SPM_Request__c.Id}", statusvalue:"{!WPA_SPM_Request__c.Status__c}"}); 

alert(val1);

*/