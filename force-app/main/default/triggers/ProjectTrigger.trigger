trigger ProjectTrigger on Project__c (after insert, before update) {
    ProjectTriggerHelper.isFiveProjectTask(Trigger.new);
    ProjectTriggerHelper.isStatusDisable(Trigger.New, Trigger.old, Trigger.oldMap);
    
}