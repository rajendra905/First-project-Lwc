public class MyCustomerController {
    public List<Customer__c> customerList{get;set;}
    Customer__c customer = new Customer__c();
    public String first_name {get;set;}
    public String last_name {get;set;}
    public String gender {get;set;}
    public String email {get;set;}
    public String city {get;set;}
    public String nationality {get;set;}
    public String phone {get;set;}
    /* public String ismarried {get;set;}*/
    public String address {get;set;}
    public string customerid {get;set;}
    public String flag {get;set;}
    public String ButtonValue {get;set;}
    
    
    
    public MyCustomerController()
    {
        customerList= new List<Customer__c>();
        customerid=ApexPages.currentPage().getParameters().get('id');
        flag=ApexPages.currentPage().getParameters().get('flag');
        ButtonValue=ApexPages.currentPage().getParameters().get('ButtonValue');
        
        if(customerid!=null)
        {
            customer =[SELECT Id,Gendre__c, Address__c, City__c, E_mail__c, Phone__c, Nationality__c, First_Name__c, 
                       Last_Name__c from Customer__c where Id=:customerid];
            first_name =customer.First_Name__c;
            
            last_name=customer.Last_Name__c;
            gender=customer.Gendre__c;
            email=customer.E_mail__c;
            city=customer.City__c;
            nationality=customer.Nationality__c;
            phone=customer.Phone__c;
            address=customer.Address__c;
            
        }
        
        else
        {
            customerList =[SELECT Name, First_Name__c, Last_Name__c, Full_Name__c ,Address__c  FROM Customer__c];
        }
        
        
    }
    
    public PageReference save() {
        
        customer.First_Name__c=first_name;
        customer.Last_Name__c=last_name;
        customer.Gendre__c=gender;
        customer.E_mail__c=email;
        customer.City__c=city;
        customer.Nationality__c=nationality;
        customer.Phone__c=phone;
        customer.Address__c=address;
        
        
        
        if(ButtonValue!='Edit'){
            customer.Id=null;
           /* insert customer;*/
            system.debug('customer clone'+customer.Id);
            PageReference myPage = new PageReference('/apex/customer_list');
            myPage.setRedirect(true);
            return myPage;
        }
        else{
             /*upsert customer;*/
            system.debug('customer edit'+customer.Id);
            PageReference myPage = new PageReference('/apex/customer_list');
            myPage.setRedirect(true);
            return myPage;
        }
        
        
      
        
        
        
    }
    
    public PageReference EditCustomer(){
        flag='false';
        ButtonValue='Edit';
        PageReference myPage = new PageReference('/apex/add_new_customer?id='+customerid +'&'+ 'flag='+flag +'&'+ 'ButtonValue='+ButtonValue);
        myPage.setRedirect(true);
        return myPage;
    }
    public PageReference DetailCustomer(){
        flag='true';
        ButtonValue='Detail';
        PageReference myPage = new PageReference('/apex/add_new_customer?id='+customerid +'&'+ 'flag='+flag);
        myPage.setRedirect(true);
        return myPage;
    }
    
    
    public PageReference cancel(){
        PageReference myPage = new PageReference('/apex/customer_list');
        myPage.setRedirect(true);
        return myPage;
    }
    
    public PageReference DeteleCustomer() {
        
        delete [select Id from Customer__c where Id=:customerid];
        PageReference myPage = new PageReference('/apex/customer_list');
        
        myPage.setRedirect(true);
        return myPage;
    }
    
    public PageReference CloneCustomer() {
        flag='false';
        ButtonValue='Clone';
        PageReference myPage = new PageReference('/apex/add_new_customer?id='+customerid +'&'+ 'flag='+flag +'&'+ 'ButtonValue='+ButtonValue);
        
        myPage.setRedirect(true);
        
        return myPage;
    }
    
    
    
}