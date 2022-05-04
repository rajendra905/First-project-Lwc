public class ProjectTaskTriggerHelper {
    public static Set<Id> taskIdSets = new Set<Id>();
    public static  Map<Id,Project_Task__c> projectTaskMap = new Map<Id,Project_Task__c>();
    public static  Map<Id,Project_Task__c> previousTaskMap = new Map<Id,Project_Task__c>();
    public static Map<Id,Project__c> projectMap =  new Map<Id ,Project__c>();
    public static List<Attachment> attchList = new List<Attachment>([select Id, Name, Description, parentId, Parent.Type from Attachment]);
    public static  Map<Id,Attachment> attachmentMap = new Map<Id, Attachment>();
    public static Map<Id,Project__c> lastProjectMap = new Map<Id,Project__c>();
    public static Set<Id> projectIdSets = new Set<Id>();
    
    public static void isComplete(List<Project_Task__c> projectTaskList){
        if(trigger.isUpdate){
            projectStatusHelpClass.statusField = false;
            for(Project_Task__c projectTask : projectTaskList) {
                projectIdSets.add(projectTask.Project__c);
                if(projectTask.Project_Task__c != NULL) {
                    taskIdSets.add(projectTask.Project_Task__c);
                    //previousTaskMap.put(projectTask.Project_Task__c , projectTask);
                    // system.debug('previous map'+previousTaskMap);
                }
            }
            for(Attachment att:attchList) {
                attachmentMap.put(att.Parent.ID,att);
            }
            if(!projectIdSets.isEmpty()) {
                projectMap =  new Map<Id,Project__c>([Select Id,Name,Status__c From Project__c where Id in: projectIdSets]);
                lastProjectMap = new Map<Id,Project__c>([select id, Name, Project_Owner__c, 
                                                         (select Id,Name,Type__c from Project_Tasks__r order by Name ) 
                                                         from project__c ]);
            }
            if(!taskIdSets.isEmpty()){
                projectTaskMap = new Map<Id,Project_Task__c>([Select Id, Name, Completed__c From Project_Task__c where Id IN : taskIdSets]);
                system.debug('Project Task Map 33'+projectTaskMap);
                previousTaskMap = new Map<Id, Project_Task__c>([Select Id, Name, Completed__c From Project_Task__c where Project_Task__c IN : taskIdSets]);
                system.debug('previous task Map 35 line'+previousTaskMap);
            }
        }
    }
    //four assigment start
    public static void sendEmailLastTaskCompleted(List<Project_Task__c> projectTaskList){
        for(Project_Task__c project : projectTaskList) {	
            if(project.Project_Task__c != Null) {
                if(lastProjectMap.get(project.Project__c).Project_Tasks__r[4].Id == project.Id){
                    String contactId = lastProjectMap.get(project.Project__c).Project_Owner__c;
                    String projectId = lastProjectMap.get(project.Project__c).Id;
                    if(project.Completed__c == true){
                        EmailTemplateData.sendEmail(contactId, projectId);
                    }
                }   
            }
        } 
    }
    
    public static void attachmentRequired(List<Project_Task__c> projectTaskList){
        for(Project_Task__c project : projectTaskList) {
            if(project.Project__c != Null && project.Completed__c == true) {
                if(attachmentMap.get(project.Id) == Null) {
                    project.Completed__c.addError('Attachment is Required');
                }else if(attachmentMap.get(project.Id).Description  != 'Terms & Conditions') {
                    project.Completed__c.addError('Please Field Attachment Description is Terms & Conditions'); 
                }
            }
        }
    } //four assigment end
    
    public static void comapletedTaskMapping(List<Project_Task__c> projectTaskList){
        for(Project_Task__c project : projectTaskList) {
            if(project.Project__c != Null && project.Completed__c == true) {
                if(project.Type__c == 'New Task') {
                    projectMap.get(project.Project__c).Status__c = 'New'; 
                }else if(project.Type__c == 'Planning Phase') {
                    projectMap.get(project.Project__c).Status__c = 'Planning';   
                }else if(project.Type__c == 'Construction Work') {
                    projectMap.get(project.Project__c).Status__c = 'Construction';  
                }else if(project.Type__c == 'Completion Step') {
                    projectMap.get(project.Project__c).Status__c = 'Deployment';  
                }else if(project.Type__c == 'Contract End') {
                    projectMap.get(project.Project__c).Status__c  ='Signoff';
                }
            }
        }
        update  projectMap.values();
    }
    
    public static List<Project_Task__c> previousProjectTaskList(Set<Id> projectTask) {
        return [SELECT Id, Name, Type__c, Completed__c FROM Project_Task__c WHERE Id IN : projectTask];
    }
    
    public static Map<Id, Project_Task__c> createProjectMap(List<Project_Task__c> taskList) {
        Map<Id, Project_Task__c> previousProjectTaskMap = new Map<Id, Project_Task__c>();
        for(Project_Task__c projectTask : taskList) {
            if(projectTask.Project_Task__c != NULL) {
                previousProjectTaskMap.put(projectTask.Project_Task__c, projectTask);
            }
        }
        return previousProjectTaskMap;
    }
    
    public static void previousTaskCompleted(List<Project_Task__c> currentTaskList, List<Project_Task__c> previousTaskList) {
        for(Project_task__c currentTask : currentTaskList) {
            if(currentTask.Project_Task__c != Null){
                for(Project_task__c previousTask : previousTaskList) {
                    if( currentTask.Completed__c == true && previousTask.Completed__c == false) {
                        currentTask.Completed__c.addError('Task cant be marked as complete unless the previous is completed');
                    }
                }
            }
        }
    } 
}