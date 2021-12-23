public with sharing class apexcomponentcontroller {
       @AuraEnabled
    public static String getcontactname(Id id){
        String contactname;
       	List<Contact> con = new List<Contact>();
        con = [select id,name from contact limit 1];
        contactname =con[0].name;
        return contactname;
    }
}