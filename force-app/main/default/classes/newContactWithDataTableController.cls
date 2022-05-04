public with sharing class newContactWithDataTableController {
    public newContactWithDataTableController() {
        
    }
    @AuraEnabled (cacheable=true)
        public static List<Contact> getContactList(){
            List<Contact> contactList = [Select Id, Name, Account.Name, Phone, Email From Contact Where Name !=null];
            return contactList;
    }   

    @AuraEnabled
    public static List<Contact> searchContactList(string textValue){
        return [SELECT Id, Name, Email, Account.Name, Phone
        FROM Contact 
        where Name LIKE:'%'+ textValue +'%' or Email LIKE:'%'+ textValue +'%'];
    }
}