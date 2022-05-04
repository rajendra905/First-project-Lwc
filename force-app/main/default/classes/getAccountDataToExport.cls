public with sharing class getAccountDataToExport {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getAccountDataToExport(){
        List<Contact> lstContacts = [SELECT Id, FirstName, LastName, Email 
FROM Contact ];
        return lstContacts;
    }
}