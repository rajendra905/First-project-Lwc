trigger OpportunityTrigger on Opportunity (before insert, before update) {
    List<Opportunity> opportunityList = Trigger.New;
    /*List<Account> accountList = new List<Account>();
set<String> accountid = New Set<String>();
Map<Id, Account> accountMap;
for(Opportunity opportunity : opportunityList){
accountid.add(opportunity.AccountId);
System.debug('id'+accountid);
}
accountMap=new Map<Id, Account>([select id,Account_Type__c from Account where Id In :accountid]);
if(Trigger.isInsert){
for(Opportunity opportunity : opportunityList){
Account account = accountMap.get(opportunity.AccountId);
if(account.Account_Type__c == null){
opportunity.Stage_Type__c ='0';
}else if(account.Account_Type__c =='Reseller'){
opportunity.Stage_Type__c = '10';
}else if(account.Account_Type__c == 'Buyer'){
opportunity.Stage_Type__c = '25';
}else if(account.Account_Type__c == 'Current Customer'){
opportunity.Stage_Type__c = '100';
}
}
}*/
    
    
    if(Trigger.isInsert || Trigger.isUpdate){
       // OpportunityTriggerHelper.isOpportunity(Trigger.new);
       // OpportunityTriggerHelper.totalOppotunityAmount(opportunityList);
    }
}