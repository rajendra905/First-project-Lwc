public class OpportunityTriggerHelper {
    public static void isOpportunity(List<Opportunity>opportunityList){
        
        List<Account> accountList = new List<Account>();
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
        }
    }
    public static void totalOppotunityAmount(List<Opportunity>opportunityList){
        Set<Id> accountIds = new Set<Id>();
        Map<Id,Account> accountMap = new Map<Id,Account>();
        for(Opportunity opp : opportunityList) {
            if(opp.AccountId != Null) { 
                accountIds.add(opp.AccountId);
            }
        }
        
        if (accountIds.size() > 0){
            accountMap.putAll([SELECT Id, Total_Opportunity_Amount__c,Name FROM Account where Id IN :accountIds]); 
        }
        for (Opportunity opp : opportunityList){
           // acc.Id = opp.AccountId;
           accountMap.get(opp.AccountId).Total_Opportunity_Amount__c = accountMap.get(opp.AccountId).Total_Opportunity_Amount__c + opp.Amount;
           System.debug('AccountMap'+accountMap);
           System.debug('Opportunity amount'+accountMap.get(opp.AccountId).Total_Opportunity_Amount__c);
           System.debug('Total Opportunity Amount '+(accountMap.get(opp.AccountId).Total_Opportunity_Amount__c + opp.Amount));
            System.debug('hiii'+accountMap.get(opp.AccountId));
        }
        
        //update accountMap.values();
        
    }
}