public class ContactInlineController {
    public List<Contact> contactList {get;set;}
    public string accountId{get;set;}
    public List<ContactWrapperClass> contactWrapperList {get;set;}
    public string pageurl{get;set;}
    public Boolean isLoad{get;set;}
    public Date DateofBirth{get;set;}
    
    public ContactInlineController(ApexPages.StandardController controller){
        DateofBirth = Date.newInstance(2000,2,24);
        contactList = [SELECT  Id, Email,Name,AccountId,Birthdate FROM Contact where AccountId=Null];
        accountId = controller.getId();
        contactWrapperList = new List<ContactWrapperClass>();        
        for(Contact contact : contactList) {
            ContactWrapperClass contactWrapperClass =new ContactWrapperClass();
            contactWrapperClass.contact = contact;
            
            contactWrapperList.add(contactWrapperClass);
        }
    }
    
    public void accountIdSave() {       
        for(ContactWrapperClass contactWrapper : contactWrapperList){
            if(contactWrapper.isSelected){
                contactWrapper.contact.AccountId=accountId;
                contactWrapper.contact.Birthdate = DateofBirth; 
            }
            else if(contactWrapper.isSelected==false){
                contactWrapper.contact.AccountId=null;
            }
        } 
    }
    public void saveId(){
        List<Contact> contactList1 = new List<Contact>();
        for(ContactWrapperClass contactWrapper : contactWrapperList){
            if(contactWrapper.isSelected){
                contactList1.add(contactWrapper.contact);
            }
        }
        try{
            upsert contactList1;
            pageurl='/' + accountId;
            isLoad=true;
        }catch(Exception ex){
            ApexPAges.addMessages(ex);
        }
    }
    
    public class ContactWrapperClass {
        public Boolean isSelected {get;set;}
        public Contact contact {get;set;}   
    }
}