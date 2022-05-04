public class EmailController {
    public List<wrapContact> wrapContactList {get; set;}
    public List<String> selectedContacts{get;set;}
    public Boolean mainBoxValue{get;set;}
    public String contactCC{get;set;}
    public string contactBcc{get;set;}
    public string contactSubject{get;set;}
    public string contactBody{get;set;}
    
    public EmailController(){
        
        if(wrapContactList == null) {
            wrapContactList = new List<wrapContact>();
            for(Contact contact: [select Id, Name,Email from Contact]) {
                
                wrapContactList.add(new wrapContact(contact));
            }
        }
        
    }
    
    
    public void processSelected() {
        
        selectedContacts = new List<String>();
        
        for(wrapContact wrapContactObj : wrapContactList) {
            if(wrapContactObj.selected) {
                
                selectedContacts.add(wrapContactObj.con.Email);
                
            }
        }
        
        System.debug('call'+ selectedContacts);
        // System.debug('ssssssss'+ exMap);
    }
    
    public class wrapContact {
        public Contact con {get; set;}
        public Boolean selected {get; set;}
        
        public wrapContact(Contact contact) {
                con = contact;
            selected = false;
        }
    }
    public void checkUncheckAll(){
         selectedContacts = new List<String>();
        for(wrapContact wrapContactObj : wrapContactList){
            wrapContactObj.selected = mainBoxValue;
            if(wrapContactObj.selected){
             selectedContacts.add(wrapContactObj.con.Email);
            }
        }
    }
    
    public void sendEmail(){
        Messaging.SingleEmailMessage singleEmailMessage = new Messaging.SingleEmailMessage();
        singleEmailMessage.setToAddresses(selectedContacts);
        //singleEmailMessage.setCcAddresses(contactCC);
        singleEmailMessage.setSubject(contactSubject);
        singleEmailMessage.setPlainTextBody(contactBody);
        Messaging.SingleEmailMessage[] emailMessages = new Messaging.SingleEmailMessage[]{singleEmailMessage};
            Messaging.SendEmailResult[] emailResult = Messaging.sendEmail(emailMessages);
        //  Messaging.sendEmail(emailMessages);
        if(emailResult[0].success){
            System.debug('email send successfully');
        }
        else{
            System.debug('Errors: '+emailResult[0].errors[0].message);
        }
        
    }
    
}