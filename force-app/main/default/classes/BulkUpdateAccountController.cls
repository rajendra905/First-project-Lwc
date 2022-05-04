public class BulkUpdateAccountController {
    public List<Account> accountList{get;set;}
    public BulkUpdateAccountController() {
        accountList = new List<Account>();
        accountList = [Select Id, Name, Rating, Phone, Website  From Account];
        System.debug('size of account List: ' + accountList.size());
    }
    public PageReference cancel() {
        PageReference myPage = new PageReference('/apex/account_list');
        myPage.setRedirect(true);
        return myPage;
    }
    public PageReference updateAccount() {
        System.debug('hiii'+accountList);
        update accountList;	
        PageReference myPage = new PageReference('/apex/account_list');
        myPage.setRedirect(true);
        return myPage;
    }
}