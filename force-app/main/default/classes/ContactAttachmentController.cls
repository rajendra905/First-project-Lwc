public class ContactAttachmentController {
     public  List<SelectOption> contactName{get;set;}
    public List<Contact> contactList{get;set;}
    Public String getName{get;set;}
    
    public  ContactAttachmentController(){
        contactName = new List<SelectOption>();
        contactList = new List<Contact>();
         contactList =[Select id,Name, LastName, AccountID, Phone, Email, FirstName, Account.Rating  From Contact];
         contactName.add(new SelectOption('' , '--None--'));
        for(Contact con : contactList){
            contactName.add(new SelectOption(con.Id,con.Name));
        }
    }
    public void getContactList(){
        System.debug('Name'+getName);
    }
 }