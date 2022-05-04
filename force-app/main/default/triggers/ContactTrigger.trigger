trigger ContactTrigger on Contact (before insert, before update) {
    /*List<Contact> contactList = Trigger.New;
    for(Contact contact : contactList){
        if(Trigger.isInsert || Trigger.isUpdate){
            if(contact.Birthdate == Null){
                contact.Birthdate.addError('birthdate is required field');
            }
            if(contact.Designation__c =='Clerk' ){
                if((contact.Salary__c >5000 && contact.Salary__c<15000)){
                }
                else{
                    contact.Salary__c.addError('5000 - 15000 - Clerk');
                }
            }
            if(contact.Designation__c =='Manager' ){
                if((contact.Salary__c>12000 && contact.Salary__c<50000)){
                }else{
                    contact.Salary__c.addError('12000 - 50000 - Manager');  
                }
            }
            if(contact.Designation__c =='Accountant' ){
                if((contact.Salary__c>10000 && contact.Salary__c<30000)){
                    
                }else{
                    contact.Salary__c.addError('10000 - 30000 - Manager');
                } 
            }
            
        }
    }*/
    
    ContactTriggerHelper.isBirthEmpty(Trigger.new);
    ContactTriggerHelper.isDesginationSalary(Trigger.new);
    ContactTriggerHelper.ConcatDescription(Trigger.new);
}