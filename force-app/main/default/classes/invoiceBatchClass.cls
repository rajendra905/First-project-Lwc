global class invoiceBatchClass implements Database.Batchable<sObject>{
    public Integer month = System.Today().MOnth();
    Public Integer year = System.Today().Year();	
    DateTime dt = Datetime.now();
    global Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator([select Id, name, createdDate,AccountId 
                                         from contact  
                                         where   Id not In (SELECT Contact__c FROM Invoice__c) And 
                                         createdDate = THIS_YEAR AND createdDate = THIS_MONTH AND AccountId !=Null]);
    }
    
    global void execute(Database.BatchableContext BC, List<Contact> contactList){
        
        
        if(contactList.size() > 0){
            List<Invoice__c> invoiceList = new List<Invoice__c>();
            for(Contact contact : contactList){
                invoiceList.add(New invoice__c(Month__c = dt.format('MMMM'), 
                                               Year__c = String.valueOf(year), 
                                               Amount__c = 1000, 
                                               Contact__c = contact.Id, 
                                               Account__c = contact.AccountId));      
            }
            if(invoiceList.size() > 0){
                insert invoiceList;
            }  
        }
        
    }
    
    global void finish(Database.BatchableContext BC) {
        System.debug('finish');
    }
    
}