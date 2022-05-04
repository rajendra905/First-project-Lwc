public class ProjectTriggerHelper {
    public static void isFiveProjectTask(List<Project__c> projectList){
        List<Project_Task__c> projectTaskList = new List<Project_Task__c>(); 
        String[] projectTaskType = new String[] {'New Task', 'Planning Phase', 'Construction Work','Completion Step','Contract End'};
            if(trigger.isInsert){
                for(Project__c project : projectList){
                    if(project.Status__c == Null) {
                        for (Integer i = 0; i < 5; i++)  {
                            Project_Task__c projecttask  = new Project_Task__c ();
                            projecttask.Project__c = project.Id;
                            projecttask.Type__c = projectTaskType[i];
                            projectTaskList.add(projecttask);
                        }
                    }else {
                        project.Status__c.addError('Can Not be selected status field in mnually');
                    }
                    
                }
                insert projectTaskList;
            }
        
        for(integer i = 0; i < projectTaskList.size() - 1; i++) {
            projectTaskList[i+1].Project_Task__c = projectTaskList[i].Id;
        }
        update projectTaskList;
    }
    public static void isStatusDisable(List<Project__c>projectList , List<Project__c>oldProjectList, Map<id, Project__c> oldprojectMap){
        if(trigger.isUpdate){
            if(projectStatusHelpClass.statusField == true){
                for(Project__c projectNew : projectList) {
                    if(oldprojectMap.get(projectNew.Id).Status__c != projectNew.Status__c){
                        projectNew.Status__c.addError('Can not be change status field mnually');
                    }
                }
            }
        }
    }
}