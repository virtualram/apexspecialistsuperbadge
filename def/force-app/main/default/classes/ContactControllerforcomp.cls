public class ContactControllerforcomp {
@AuraEnabled
    public static String getcontactname(Id id){
        
        return [select name from contact where id  =:id].name;
    }
}