public class BulkInsertContactController {
    public List<Contact> contactData{get;set;}
    public BulkInsertContactController() {
        contactData= new List<Contact>();
        for (Integer i = 1 ; contactData.size() <> 3 ; i++ ){
            contactData.add(new Contact());
        }
    }
    public PageReference cancel() {
        PageReference myPage = new PageReference('/apex/contact_list');
        myPage.setRedirect(true);
        return myPage;
    }
    
    public void addRow() {
        if(contactData.size() == 10){
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,' Limit only ten row  '));
        }
        else{
            contactData.add(new Contact());
        }
    }
    
    public void removeRow() {
        if(contactData.size() == 3){
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,' Three row must be required '));
        }
        else{
            contactData.remove(contactData.size() - 1);
            System.debug(contactData.size());
        }
    }
    
    public PageReference save() {
        insert contactData;
        PageReference myPage = new PageReference('/apex/contact_list');
        myPage.setRedirect(true);
        return myPage;
    }
}