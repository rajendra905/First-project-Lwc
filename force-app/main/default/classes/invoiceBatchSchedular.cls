global  class invoiceBatchSchedular implements Schedulable{
    
	public Static String CRON_EXPR01 = '0 3 11 * * ? 2021';
    global static String scheduleDate(){
        invoiceBatchSchedular invoiceSchedule =new invoiceBatchSchedular();
        return system.schedule('Invoice', CRON_EXPR01, invoiceSchedule);
    }
     global void execute(SchedulableContext sc)
    {
        invoiceBatchClass batch = new invoiceBatchClass();
		Database.executeBatch(batch);
    }  
}