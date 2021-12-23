public class Contactlookupcontroller {


   @AuraEnabled
 public static List < Contact > fetchContact(String searchKeyWord) {
  String searchKey = searchKeyWord + '%';
  List < Contact > returnList = new List < Contact > ();
  List < Contact > lstOfContact = [select id, Name from Contact where Name LIKE: searchKey];
 
  for (Contact con : lstOfContact) {
     returnList.add(con);
     }
  return returnList;
 
}
}