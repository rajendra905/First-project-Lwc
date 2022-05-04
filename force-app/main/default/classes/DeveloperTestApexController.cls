/**
Name		: DeveloperTestApexController
Date		: 06 Nov, 2021
Author		: Kavya Kothari
Description : Get Account list limit is 5    
*/

public without sharing class DeveloperTestApexController {
    
    @AuraEnabled
    public static List<Account> getAccountList(){
        return [SELECT Id , Name, AccountNumber, Phone, Website, Rating 
                FROM Account LIMIT  5];
    }
    
    public static List<List< SObject>> searchContactsAndLeads1() {
        string userName = UserInfo.getUserName();
        string userId = UserInfo.getUserId();
        return [FIND :userId IN ALL FIELDS 
                   RETURNING User(FirstName, LastName),Task(OwnerId,Subject)];
    }
}