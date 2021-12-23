// In a separate class so that it can be used elsewhere
public class emailHelper1 {

public static void sendEmail() {

  //New instance of a single email message
 Messaging.SingleEmailMessage mail = 
        new Messaging.SingleEmailMessage();
 


mail.setReplyTo('ramnarayan.r01@mphasis.com');
mail.setSenderDisplayName('HR Recruiting');
mail.setSaveAsActivity(false);  
 
Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });

  }  
}