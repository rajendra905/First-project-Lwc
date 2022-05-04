trigger ProductTrigger on Product2 (after insert) {
    if(Trigger.isInsert){
        ProductTriggerHelper.createdRequiredPart(Trigger.NewMap);
    }
}