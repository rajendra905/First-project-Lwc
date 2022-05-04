@isTest
private class invoiceBatchSchedularTest {
    static testmethod void schedulerTest() 
    {	
        Integer month = System.Today().MOnth();
        Integer year = System.Today().Year();	
        DateTime dt = Datetime.now();
        String CRON_EXP = '0 38 19 * * ? 2021'; 
        Account acc = new Account();
        acc.name= 'testAccount';
        insert acc;
        
        Contact con = new Contact();
        con.AccountId = acc.Id;
        con.LastName = 'testContact';
        con.Phone_No__c = '7742381657';
        insert con;
        
        Invoice__c invoice = new Invoice__c();
        invoice.Account__c = acc.Id;
        invoice.Contact__c = con.Id;
        invoice.Amount__c = 1000;
        invoice.Month__c = dt.format('MMMM');
        invoice.Year__c = String.valueOf(year);
        
        
        
        Test.startTest();
        	List<Contact> contactList = new List<Contact>();
        	contactList = [select Id, name, createdDate,AccountId 
                                         from contact  
                                         where   Id not In (SELECT Contact__c FROM Invoice__c) And 
                                         createdDate = THIS_YEAR AND createdDate = THIS_MONTH AND AccountId !=Null];
        	invoiceBatchSchedular.scheduleDate();
        	
			/*String jobId = System.schedule('invoice',  CRON_EXP, new invoiceBatchSchedular());
            CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE id = :jobId];
            System.assertEquals(CRON_EXP, ct.CronExpression);
            System.assertEquals(0, ct.TimesTriggered);*/
        Test.stopTest();
    }
}