public class Customer360Lightning{
@AuraEnabled
public static List<Account> getAllAccounts(){
 try{
 return [SELECT 
 Id,Name,Type,Industry,Website,LastModifiedDate 
 FROM Account LIMIT 10];
 }catch(Exception e){
 system.debug(e.getMessage());
 return null;
 } 
 
 }
 
 // Create Account
 @AuraEnabled
 public static void createAccount(Account acc){
    try{
 insert acc;
 }catch(Exception e){
 system.debug(e.getMessage());
 } 
 
 }}