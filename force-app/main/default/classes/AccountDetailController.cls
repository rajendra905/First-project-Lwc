public class AccountDetailController {
    public string detailid {get;set;}
    public Account acc {get;set;}
   
    public List<Account> DetailList{get;set;}
    
    
    public AccountDetailController() {
        acc= New Account();
        DetailList= new List<Account>();
        detailid=ApexPages.currentPage().getParameters().get('id');
        acc=[SELECT Id, IsDeleted, MasterRecordId, Name, Type, ParentId, BillingStreet, BillingCity, BillingState, BillingPostalCode, 
             BillingCountry, BillingLatitude, BillingLongitude, BillingGeocodeAccuracy, BillingAddress, ShippingStreet, ShippingCity, 
             ShippingState, ShippingPostalCode, ShippingCountry, ShippingLatitude, ShippingLongitude, ShippingGeocodeAccuracy, 
             ShippingAddress, Phone, Fax, AccountNumber, Website, PhotoUrl, Sic, Industry, AnnualRevenue, NumberOfEmployees,
             Ownership, TickerSymbol, Description, Rating, Site, OwnerId, CreatedDate, CreatedById, LastModifiedDate, LastModifiedById, 
             SystemModstamp, LastActivityDate, LastViewedDate, LastReferencedDate, Jigsaw, JigsawCompanyId, CleanStatus, AccountSource, 
             DunsNumber, Tradestyle, NaicsCode, NaicsDesc, YearStarted, SicDesc, DandbCompanyId, OperatingHoursId, CustomerPriority__c, 
             SLA__c, Active__c, NumberofLocations__c, UpsellOpportunity__c, SLASerialNumber__c,
             SLAExpirationDate__c, Billing_Address__c, Total_Opportunity__c FROM Account where Id=:detailid];
        
        
        
    }
    
    
    public PageReference UpdateAccount() {
        update acc;
        PageReference myPage = new PageReference('/apex/account_list?core.apexpages.request.devconsole=1');
        myPage.setRedirect(true);
        return myPage;
       
        
    }
    
    public PageReference Cancel() {
        PageReference myPage = new PageReference('/apex/account_list?core.apexpages.request.devconsole=1');
        myPage.setRedirect(true);
        return myPage;
    }
    
   public PageReference CloneAccount() {
       	acc.Id=null;
        insert acc;
        PageReference myPage = new PageReference('/apex/account_list?core.apexpages.request.devconsole=1');
        myPage.setRedirect(true);
        return myPage;
       
        
    }
    
    
}