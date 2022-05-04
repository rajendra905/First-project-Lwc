/**
Name		: userControllerLWC
Date		: 20 oct, 2021
Author		: Rajendra Singh Solanki
Description : find user List     
*/

public class UserComponentController {

    @AuraEnabled
    public static List < WapperUserTask > getUserList() {
        Map < Id, User > userDetailMap = new Map < Id, User > ([Select Id, Name, Email, MediumPhotoUrl from User WHERE IsActive =: True]);
        List < WapperUserTask > wapperUserData = new List < WapperUserTask > ();
        map < Id, List < Task >> taskMap = new map < Id, List < Task >> ();
        Map < Id, List < Task >> compeletedTaskMap = new Map < Id, List < Task >> ();

        for (Task taskData: [Select Id, Subject, Status, OwnerId, IsClosed from Task where OwnerID IN: userDetailMap.keySet()]) {
            if (taskMap.containsKey(taskData.OwnerId)) {
                if (taskData.Status == 'Completed' && compeletedTaskMap.containsKey(taskData.OwnerId)) {
                    compeletedTaskMap.get(taskData.OwnerId).add(taskData);
                } else {
                    if (taskData.Status == 'Completed') {
                        compeletedTaskMap.put(taskData.OwnerId, new List < Task > {
                            taskData
                        });
                    }
                }
                taskMap.get(taskData.OwnerId).add(taskData);
            } else {
                taskMap.put(taskData.OwnerID, new List < Task > {
                    taskData
                });
                
                if (taskData.Status == 'Completed') {
                    compeletedTaskMap.put(taskData.OwnerId, new List < Task > {
                        taskData
                    });
                }
                
            }
        }
        for (User userData: userDetailMap.values()) {
            integer countTask = taskMap.get(userData.Id) != null ? taskMap.get(userData.Id).size() : 0;
            Integer completeTaskCount = (compeletedTaskMap.get(userData.Id) != null) ? compeletedTaskMap.get(userData.Id).size() : 0;
            User userDetails = new User();
            userDetails = userData;
            wapperUserData.add(new WapperUserTask(countTask, userDetails, completeTaskCount));
        }
        return wapperUserData;
    }
    public class WapperUserTask {
        @AuraEnabled public Integer taskCount = 0;
        @AuraEnabled public Integer completedTask = 0;
        @AuraEnabled public Integer taskCompletedPercentage = 0;
        @AuraEnabled public User userDetail = new User();

        public WapperUserTask(Integer totalTaskCount, User userData, Integer completeTotalTask) {
            taskCount = totalTaskCount;
            userDetail = userData;
            completedTask = completeTotalTask;
            if (completedTask != 0) {
                taskCompletedPercentage = ((completedTask * 100) / taskCount);
            }
        }
    }

    // ******Get Task List With Realted User *******//
    @AuraEnabled
    public static List < Task > fetchUsersTask(String userId) {
        system.debug(userId);
        List < Task > taskList = [Select Id, Subject, OwnerId, Description, IsClosed, CreatedDate FROM Task where OwnerId =: userId ORDER BY CreatedDate DESC];
        System.debug(taskList);
        return taskList;
    }

    // ******Add Task Method *******//
    @AuraEnabled
    public static string addTask(Task newTask) {
        try {
            insert newTask;
            return 'success';
        } catch (Exception e) {
            return 'error';
        }
    }

    // ******Delete Task List *******//
    @AuraEnabled
    public static Task taskDelete(String taskId) {
        Task task = [Select Id, Status From Task Where Id =: taskId];
        delete task;
        return task;
    }

    // ******Completed task*******//
    @AuraEnabled
    public static Task completeTask(String Id) {
        Task task = [Select Id, Status From Task Where Id =: Id];
        task.Status = 'Completed';
        update task;
        return task;
    }

}