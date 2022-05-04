global class sendNotificationBatchClass implements Database.Batchable<sObject>,Schedulable,Database.Stateful{
    global List<String> errorMessages = new List<String>();
    global sendNotificationBatchClass() { 
        //this.project = getBatchQuery();
    }
    
    global Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator([select Id, Name,Status__c,Project_Owner__c,OwnerId,(select Id from Project_Tasks__r order by Name )  
                                         From Project__c 
                                         where Status__c='Deployment']);
    }
    
    global void execute(Database.BatchableContext BC, List<Project__c> projectList) {
        for(Project__c Project : projectList){
            if(Project.Project_Owner__c != null){
                String lastTask = Project.Project_Tasks__r[4].Id;
                EmailTemplateData.reminderOwner(Project.Project_Owner__c,Project.OwnerId,Project.Id);
                EmailTemplateData.LastTask(lastTask,Project.OwnerId);
            }
        }
    }
    
    global void finish(Database.BatchableContext BC) {
        
    }
    global void execute(SchedulableContext sc) { 
        sendNotificationBatchClass newbatch = new sendNotificationBatchClass();
        Database.executeBatch(newbatch);
    }
}