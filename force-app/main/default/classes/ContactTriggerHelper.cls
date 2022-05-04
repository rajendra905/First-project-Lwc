public class ContactTriggerHelper {
    public Static void isBirthEmpty(List<Contact> contactList){
        for(Contact contact : contactList){
            if(Trigger.isInsert || Trigger.isUpdate){
                if(contact.Birthdate == Null){
                    contact.Birthdate.addError('birthdate is required field');
                }
            }
            
        }
    }
    public Static void isDesginationSalary(List<Contact> contactList){
        
        for(Contact contact :contactList){
            if(contact.Designation__c =='Clerk' ){
                if((contact.Salary__c >= 5000 && contact.Salary__c <= 15000)){
                }
                else{
                    contact.Salary__c.addError('5000 - 15000 - Clerk');
                }
            }
            if(contact.Designation__c =='Manager' ){
                if((contact.Salary__c >= 12000 && contact.Salary__c <= 50000)){
                }else{
                    contact.Salary__c.addError('12000 - 50000 - Manager');  
                }
            }
            if(contact.Designation__c =='Accountant' ){
                if((contact.Salary__c >= 10000 && contact.Salary__c <= 30000)){
                    
                }else{
                    contact.Salary__c.addError('10000 - 30000 - Manager');
                } 
            }
            
        }
    }
    public Static void ConcatDescription(List<Contact>contactList){
        Set<Id> accountIds = new Set<Id>();
        Map<Id,Account> accountMap = new Map<Id,Account>();
        Account acc = new Account();
        for(Contact c : contactList) {
            if(c.AccountId != Null) { 
                accountIds.add(c.AccountId);
            }
        }
        
        if (accountIds.size() > 0){
            accountMap.putAll([SELECT Id, Name,Description FROM Account WHERE Id IN :accountIds]); 
        }
        
        for (Contact c : contactList){
            acc.Id= c.AccountId;
            
            if(accountMap.get(c.AccountId).Description == null){
                acc.Description = c.LastName;
            }
            else{
                acc.Description = accountMap.get(c.AccountId).Description + ' '+ c.LastName;
            }
            
        }
        update acc;
    }
}