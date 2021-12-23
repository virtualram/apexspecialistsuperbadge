public class sendemailfromapex
{
private final Contact con;
public sendemailfromapex(ApexPages.StandardController controller)
{
this.con=(Contact)controller.getRecord();
}

public void SendEmail()
{
Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
mail.setTargetObjectId(con.Id);
mail.setTemplateId('00X90000002BBkk');
Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
}
}