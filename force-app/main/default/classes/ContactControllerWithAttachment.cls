public class ContactControllerWithAttachment {
    public List<Contact> contactList{get;set;}
    public Id attachId{get;set;}
    public String NameList {get;set;}
    public Boolean withAttach{get;set;}
    public List<String> selectedContacts{get;set;}
    public List<ContactWrapperClass> contactWrapperList {get;set;}
    public List<SelectOption> Names{get;set;}
    public ContactControllerWithAttachment(){
        contactWrapperList =new List<ContactWrapperClass>();
        Names=new List<SelectOption>();
        Names.add(new SelectOption('','--Display Contact Name--'));
        for(Contact con : [select Id, Name,Email from Contact]){
            Names.add(new SelectOption(con.Id,con.Name));}
    }
    
    public void addContact(){
        contactList = new List<Contact>();
        contactList = [select id , Name , Email,(select Id ,ParentId,Name from Attachments where ParentId =: NameList Limit 1) from Contact where Id =: NameList];
        for(Contact con : contactList){
            contactWrapperList.add(new ContactWrapperClass(con));
        }      
    }
    
    public void displaySelected() {
        selectedContacts = new List<String>(); 
        for(ContactWrapperClass contactWrapper : contactWrapperList) {
            if(contactWrapper.selected) {
                selectedContacts.add(contactWrapper.con.Email);
            }
        }  
    }
    public void send(){
        for(ContactWrapperClass contactWrapper : contactWrapperList) {
            if(contactWrapper.selected) {
                if(withAttach == true){
                    sendEmail2(contactWrapper.con.Id);
                }
                else{
                    sendEmail(contactWrapper.con.Id);
                }
            }
        } 
    }
    public  void sendEmail2(Id id){
        Contact contact = [select Id, Name, Email from Contact where Id =:id];
        Messaging.SingleEmailMessage singleEmailMessage = new Messaging.SingleEmailMessage();
        List<string> toEmail= New List<string>();
        toEmail.add(contact.Email);
        singleEmailMessage.setToAddresses(toEmail);////To
        List<String> ccEmails =new List<String>();
        ccEmails.add('srajendrasingh455@gmail.com');
        singleEmailMessage.setCcAddresses(ccEmails);/////CC
        singleEmailMessage.setSubject('subjectTo');//Subject
        singleEmailMessage.setPlainTextBody('Please Find the attachment file');//Plain Text
        List<Attachment> files =new List<Attachment>();
        files= [SELECT Name, Body, ContentType FROM Attachment WHERE ParentId =:id Limit 1];
        Messaging.EmailFileAttachment emailFileAttachment =new Messaging.EmailFileAttachment();
        for(Attachment attch: files){
            emailFileAttachment.setFileName(attch.Name);
            emailFileAttachment.setBody(attch.Body);
            emailFileAttachment.setContentType(attch.ContentType);
        }
        List<Messaging.EmailFileAttachment> emailFileAttachments = new List<Messaging.EmailFileAttachment>{emailFileAttachment};
            singleEmailMessage.setFileAttachments(emailFileAttachments);
        Messaging.SingleEmailMessage[] emailMessage = new Messaging.SingleEmailMessage[]{singleEmailMessage};
            Messaging.sendEmail(emailMessage);
        
    }
    public void sendEmail(Id id) {
        Contact contact = [select Id, Name, Email from Contact where Id =:id];
        Messaging.SingleEmailMessage singleEmailMessage = new Messaging.SingleEmailMessage();
        List<string> toEmail= New List<string>();
        toEmail.add(contact.Email);
        singleEmailMessage.setToAddresses(toEmail);////To
        List<String> ccEmails =new List<String>();
        ccEmails.add('srajendrasingh455@gmail.com');
        singleEmailMessage.setCcAddresses(ccEmails);/////CC
        singleEmailMessage.setSubject('WithOut Attachment');//Subject
        singleEmailMessage.setPlainTextBody('Without Attachment');//Plain Text
        Messaging.SingleEmailMessage[] emailMessage = new Messaging.SingleEmailMessage[]{singleEmailMessage};
            Messaging.sendEmail(emailMessage);
    }
    public class ContactWrapperClass {
        public Contact con {get; set;}
        public Attachment attach{get;set;}
        public Boolean selected {get; set;}
        public ContactWrapperClass(Contact contact) {
            con = contact;
            
            selected = false;
        }
        
    }
}