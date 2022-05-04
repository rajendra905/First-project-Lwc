public class accountDetailWithDataTableController {
    @AuraEnabled
    public static List <wrapperclassList> fetchAccounts() {
        //Qyery 10 accounts
        List<wrapperclassList> wrapperAccountList = new List<wrapperclassList>();
        List<Account> accList = [SELECT Id, Name, BillingState, 
                                 Website, Phone, Industry, Type,(select Id,Name from Contacts Limit 1) from Account];
        //return list of accounts
        for(Account acc :accList){
            wrapperclassList WrapperclassObj = new wrapperclassList();
            if(acc.Contacts.size() > 0){
                for(Contact con: acc.Contacts){
                    WrapperclassObj.Id = acc.Id;
                    WrapperclassObj.Name = acc.Name;
                    WrapperclassObj.BillingState = acc.BillingState;
                    WrapperclassObj.Phone = acc.Phone;
                    WrapperclassObj.Website = acc.Website;
                    WrapperclassObj.Industry = acc.Industry;
                    WrapperclassObj.Type = acc.Type;
                    WrapperclassObj.contactId = con.Id;
                    WrapperclassObj.ContactName = con.Name;
                }
                wrapperAccountList.add(WrapperclassObj);
            }
            
         }
        return wrapperAccountList;
    }
    
    public class wrapperclassList{
        @AuraEnabled public String Id;
        @AuraEnabled public String Name;
        @AuraEnabled public String BillingState;
        @AuraEnabled public String Website;
        @AuraEnabled public String Phone;
        @AuraEnabled public String Industry;
        @AuraEnabled public String Type;
        @AuraEnabled public String ContactId;
        @AuraEnabled public String ContactName;
    }
}