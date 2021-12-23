public class UserLookupController {
   @AuraEnabled
 public static List < User > fetchUser(String searchKeyWord) {
  String searchKey = searchKeyWord + '%';
  List < User > returnList = new List < User > ();
  List < User > lstOfUser = [select id, Name from User where Name LIKE: searchKey];
 
  for (User us: lstOfUser) {
     returnList.add(us);
     }
  return returnList;
 }
    
 @AuraEnabled
 public static String userName()
 {
     return UserInfo.getName();
  }

  @AuraEnabled
    public static User getCurrentUser() {
      system.debug('getCurrentUser: ' + UserInfo.getUserId());
      return [SELECT Id, Name FROM User WHERE Id = :UserInfo.getUserId()];
  }
}