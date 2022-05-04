@isTest
private class DeveloperTestApexControllerTestClass {
    
    @testSetup static void setupmethod() {
        Account account = new Account(Name = 'test account' , Rating = 'Hot');
        insert account;
    }
    
    static testMethod void getAccountListTest(){
        List<Account> accountList = new List<Account>();
        accountList =  DeveloperTestApexController.getAccountList();
        System.assertEquals(1, accountList.size());
    }
}