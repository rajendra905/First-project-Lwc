public class EmailTemplateData {
    //@AuraEnabled
    public static void sendEmail(string contactId,string project){
        Contact emailId = [Select Id,Email from Contact where Id =: contactId];
        List<String> contactIds = new List<String>();
        contactIds.add(emailId.Email);
        emailSend(project,emailId.Id,contactIds,'ProjectTaskComplete');
        
    }
    
    public static void LastTask(string project,string OwnerId){
        User ownerEmail = [Select Id,Email from user where Id =: OwnerID];      
        List<String> contactIds = new List<String>();
        contactIds.add(ownerEmail.Email);
        emailSend(project,ownerEmail.Id,contactIds,'LastProjectTaskCompleted');
    }
    
    public static void emailSend(string whatid, Id targetObjectId, List<string>setToEmail, string templateName){
        Messaging.SingleEmailMessage emailTo = new Messaging.SingleEmailMessage();
        list<Messaging.SingleEmailMessage> mail = new list<Messaging.SingleEmailMessage>();
        EmailTemplate templateId = [Select id from EmailTemplate where Name =: templateName];
        emailTo.setWhatId(whatid);
        emailTo.setTargetObjectId(targetObjectId);
        emailTo.setToAddresses(setToEmail);
        emailTo.setTemplateID(templateId.Id);
        emailTo.setSaveAsActivity(false);
        mail.add(emailTo);
        Messaging.sendEmail(mail);
    }
    
    public static void reminderOwner(string contactId,string ownerID,string project){
        User ownerEmail = [Select Id,Email from user where Id =: ownerID];
        Contact contactIds = [Select Id,Email from Contact where Id =: contactId];
        list<string> totalEmail = new List<string>();
        totalEmail.add(ownerEmail.Email);
        totalEmail.add(contactIds.Email);
        //EmailTemplate templateId = [Select id from EmailTemplate where Name ='ReminderEmailToOwner'];
        emailSend(project,contactIds.Id,totalEmail,'ReminderEmailToOwner');
    }   
}