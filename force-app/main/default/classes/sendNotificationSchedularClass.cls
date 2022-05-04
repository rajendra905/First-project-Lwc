global class sendNotificationSchedularClass implements Schedulable{
    public Static String CRON_EXPR01 = '0 40 11 * * ? 2021';
    global static String scheduleDate(){
        sendNotificationSchedularClass m =new sendNotificationSchedularClass();
        return system.schedule('Email',CRON_EXPR01,m);
    }
    global void execute(SchedulableContext sc)
    {
        System.debug('Hiii calll schedual');
        sendNotificationBatchClass batch = new sendNotificationBatchClass(); // Your batch class
        //System.Schedule('Bacth Job' ,CRON_EXPR01, batch);
        database.executeBatch(batch);
    }  
}