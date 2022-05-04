public class RequiredPartTriggerHelper {
    public Static void calculateTotalPriceOnProduct(List<Required_Part__c> newRequiredPartList, List<Required_Part__c> oldrequiredPartList, Map<Id,Required_Part__c> requiredPartOldMap) {
        set<Id> requiredPartId = new set<Id>();
        List<Product2> productList = new List<Product2>();
        for(Required_Part__c requiredPartData : Trigger.isDelete ? oldrequiredPartList : newRequiredPartList) {
            if(requiredPartData.Motor_Type__c != Null) {
                requiredPartId.add(requiredPartData.Motor_Type__c);
                system.debug('IDd'+requiredPartId);
            }
            if(trigger.isDelete  || trigger.isUpdate) {
                requiredPartId.add(requiredPartOldMap.get(requiredPartData.Id).Motor_Type__c);
                system.debug('IDd'+requiredPartId);
            }
        }
        
        if(requiredPartId.size() > 0) {
            for(AggregateResult aggregateResult : [SELECT SUM(Cost__c) totalAmount, Motor_Type__c Id 
                                                   FROM Required_Part__c 
                                                   WHERE Motor_Type__c =: requiredPartId 
                                                   GROUP BY Motor_Type__c ]) {   
                                                       productList.add(new Product2(Id = (Id)aggregateResult.get('Id'), Total_Price__c = (Decimal)aggregateResult.get('totalAmount')));
                                                   }
        }
        update productList; 
    } 
}