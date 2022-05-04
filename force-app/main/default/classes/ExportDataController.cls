public with sharing class ExportDataController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getAccountDataToExport(){
        List<Contact> lstContacts = [SELECT Id, FirstName, LastName, Email 
FROM Contact ];
        return lstContacts;
    }
}