public class BulkInsertAccountController {
    public List<Account> accountData{get;set;}
    
    public BulkInsertAccountController() {
        accountData = new List<Account>();
        accountData.add(new Account());
    }
    
    public PageReference cancel() {
        PageReference myPage = new PageReference('/apex/account_list');
        myPage.setRedirect(true);
        return myPage;
    }
    
    public void addRow() {
        accountData.add(new Account());
    }
    
    public PageReference saveAccount(){
        System.debug('hiii'+accountData);
        insert accountData;
        PageReference myPage = new PageReference('/apex/account_list');
        myPage.setRedirect(true);
        return myPage;
    }
}