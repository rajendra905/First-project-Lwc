@isTest
public class AccountControllerTest {
	@isTest
    public static void DeteleAccount(){
        AccountController accountController = new AccountController(); 
        Account account = new Account(Name = 'New 1' , Rating = 'Hot');
        insert account;
        system.assert(account.Id != NUll);
        accountController.detailid = account.id;
        accountController.DeteleAccount();
        System.assertEquals(0, accountController.accountList.size());
        
    }
    @isTest 
    public Static void saveAccount(){
        AccountController accountController = new AccountController();
        Account account = new Account(Name = 'New 1' , Rating = 'Hot');
        Test.startTest();
      	accountController.saveAccount();
        Test.stopTest();
        System.assert(account.Id != NUll , 'Record is Inserted');
        
        System.assertEquals(1,accountController.accountList.size());
        
        
        
    }
    @isTest
    public static void addRow(){
         AccountController accountController = new AccountController();
        accountController.addRow();
    }
    @isTest
    public static void detail(){
         AccountController accountController = new AccountController();
        accountController.detail();
    }
    
}