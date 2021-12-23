public with sharing class AttachmentController {
 
    @AuraEnabled
    public static List<Attachment> getAttachments(String parentId) {
        return [
       	    SELECT Id, Name
            FROM Attachment
            WHERE ParentId = :parentId
        ];
    }
}