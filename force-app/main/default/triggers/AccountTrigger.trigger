trigger AccountTrigger on Account (before update) {
    /*List<Account> accountList = Trigger.New;
    integer countHot =0;
    integer countCold =0;
    integer countWarm =0;
    set<String> accountid = New Set<String>();
    Map<Id, Opportunity> opportunityMap;
    for(Account account : accountList){
        accountid.add(account.Id);
    }
    opportunityMap=new Map<Id, Opportunity>([select id, Stage_Type__c, AccountId from Opportunity where AccountId In :accountid]);
    accountList=[SELECT Id,Rating FROM Account];
    for(Account account : accountList){
        if(account.Rating == 'Hot'){
            countHot= countHot + 1;
        }else if(account.Rating == 'Cold'){
            countCold = countCold + 1;
        }else if(account.Rating == 'Warm'){
            countWarm =countWarm + 1;
        } 
    }
    if(Trigger.isUpdate){
        for(Account account : Trigger.New) {
            account.Total_Hot__c =countHot;
            account.Total_Cold__c =countCold;
            account.Total_Warm__c =countWarm;
            
        } 
    }
    for(Opportunity opportunity : opportunityMap.values()){
        Account account = Trigger.newMap.get(opportunity.accountId);
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
    update opportunityMap.values();*/
}