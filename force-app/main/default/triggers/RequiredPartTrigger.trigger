trigger RequiredPartTrigger on Required_Part__c (after insert, after update, after delete) {
	RequiredPartTriggerHelper.calculateTotalPriceOnProduct(Trigger.new,Trigger.old,Trigger.oldMap);
}