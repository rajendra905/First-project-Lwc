public class AccountController {
    public List<Account> accountList{get;set;}
    public List<Account> accountData{get;set;}
    public List<Account> DetailList{get;set;}
    public string detailid {get;set;}
    
    @AuraEnabled
    public static List<Account> getAllActiveAccounts() {
    return [SELECT Id,Name,Active__c,Industry,Type,phone,Rating,AccountNumber FROM Account WHERE Active__c = 'Yes'];
  	}
    public AccountController() {
        accountData = new List<Account>();
        accountData.add(new Account());
        accountList = new List<Account>();
        accountList = [Select Id, Name, Rating, Phone, Website  From Account];
        System.debug('size of account List: ' + accountList.size());
    }
    
    public PageReference detail() {
        PageReference myPage = new PageReference('/apex/account_detail?id='+detailid);
        myPage.setRedirect(true);
        return myPage;
    }
    
    public PageReference Editaccount() {
        PageReference myPage = new PageReference('/apex/edit_account?id='+detailid);
        myPage.setRedirect(true);
        return myPage;
    }
    
    public void DeteleAccount() {
        Account AC =[select Id from Account where Id=:detailid];
        delete AC;
        accountList=[select Id , Name,rating ,Phone,Website from Account];
    }
    
    public PageReference CloneAccount() {
        PageReference myPage = new PageReference('/apex/clone_account?id='+detailid);
        myPage.setRedirect(true);
        return myPage;
    }
    
    public PageReference cancel() {
        PageReference myPage = new PageReference('/apex/account_list');
        myPage.setRedirect(true);
        return myPage;
    }
    
    public void addRow() {
        accountData.add(new Account());
    }
    
    public void removeRow() {
        if(accountData.size()==1){
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,' Three row must be required '));
        }
        else{
            accountData.remove(accountData.size()-1);
            System.debug(accountData.size());
        }
    }
    
    public PageReference updateAccount() {
        System.debug('hiii'+accountList);
        update accountList;	
        PageReference myPage = new PageReference('/apex/account_list');
        myPage.setRedirect(true);
        return myPage;
    }
    
    public PageReference saveAccount(){
        System.debug('hiii'+accountData);
        insert accountData;	
        
        PageReference myPage = new PageReference('/apex/account_list');
        myPage.setRedirect(true);
        return myPage;
    }
    
}