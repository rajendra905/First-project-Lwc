public class ProductTriggerHelper {
    public static void createdRequiredPart(Map<Id,Product2> productMap){
        List<Required_Part__c> requiredPart =new List<Required_Part__c>();
        Map<string,Motor_Part__mdt> motorPart = Motor_Part__mdt.getAll();
        
        if(Trigger.isInsert){
            for(Product2 productData : [SELECT Id, RecordType.Name FROM Product2 WHERE ID IN: productMap.keySet()]){
                for(Motor_Part__mdt motor : motorPart.values()){
                    if(productData.RecordType.Name == motor.Type__c){
                        requiredPart.add(new Required_Part__c(Cost__c = motor.Cost__c, Name = motor.Label, Motor_Type__c = productData.ID));
                    }
                }  
            }
        }    
        insert requiredPart; 
    }
}