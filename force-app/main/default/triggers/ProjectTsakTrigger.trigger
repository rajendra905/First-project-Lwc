trigger ProjectTsakTrigger on Project_Task__c (before update, after update) {
    List <Project_Task__c> projectTask = Trigger.New;
    List<Project_Task__c>previousProjectTaskList = new List<Project_Task__c>();
    Map<Id, Project_Task__c> previousProjectTaskMap = ProjectTaskTriggerHelper.createProjectMap(Trigger.New);
    
    
    if(previousProjectTaskMap.keySet().size() > 0){
        previousProjectTaskList = ProjectTaskTriggerHelper.previousProjectTaskList(previousProjectTaskMap.keySet());
    }
    if(Trigger.isBefore && Trigger.isUpdate){
        
        ProjectTaskTriggerHelper.isComplete(projectTask);
        ProjectTaskTriggerHelper.attachmentRequired(projectTask);
        ProjectTaskTriggerHelper.comapletedTaskMapping(projectTask);
        // ProjectTaskTriggerHelper.prevoiusTaskCheck(projectTask);
        ProjectTaskTriggerHelper.sendEmailLastTaskCompleted(projectTask);
        // ProjectTaskTriggerHelper.testingMethod(projectTask);
        
    }
    if(trigger.isAfter && Trigger.isUpdate){
        if(previousProjectTaskList.size()>0){
            ProjectTaskTriggerHelper.previousTaskCompleted(Trigger.new, previousProjectTaskList);
        }
    }
}