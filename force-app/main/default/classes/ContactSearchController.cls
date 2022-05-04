public class ContactSearchController {
    public List<Contact> contactList{get;set;}
    public List<Contact> tempContactList;
    public String getTextVlaue{get;set;}
    public Integer pageSize{get;set;}
    public Integer pageNumber{get;set;}
    public ContactSearchController() {
        pageNumber = 0;
        pageSize = 100;
        tempContactList = new List<Contact>();
        contactList = new List<Contact>();
        tempContactList = [SELECT Id, Name, Email, Account.Name, Phone, Type__c FROM Contact];
        contactList = tempContactList;
    }
    
    public void doSerach() {
        tempContactList = new List<Contact>();
        tempContactList = [SELECT Id, Name, Email, Account.Name, Phone, Type__c
                           FROM Contact 
                           where Name LIKE:'%'+ getTextVlaue +'%' or Email LIKE:'%'+ getTextVlaue +'%'];
        serachandLimit();
    }
    public void serachandLimit() {
        contactList = new List<Contact>();
        Integer executeValue = pageSize;
        pageNumber = 1;
        if(tempContactList.size() < executeValue) {
            executeValue = tempContactList.size();
        }
        for(integer count = 0; count < executeValue; count++ ) {
            contactList.add(tempContactList.get(count));
        }
    }
    
    public void limitContactData() {
        serachandLimit();
    }
    
    public void firstPage() {
        pageNumber = 0;
        pagination();
    }
    
    public  void pagination() {
        Integer count = pageSize * pageNumber;
        pageNumber++;
        Integer lastSize = pageSize * pageNumber;
        if(tempContactList.size() < lastSize) {
            lastSize = tempContactList.size();
        }
        contactList = new List<contact>();
        for(; count < lastSize; count++) {
            contactList.add(tempContactList.get(count));
        }
    }
    
    public void previousPage() {
        pageNumber--;
        pageNumber--;
        pagination();
    }
    
    public void nextPage() {
        pagination();
    }
    public void lastPage() {
        pageNumber = ((tempContactList.size() - math.mod(tempContactList.size(),pageSize)) / pageSize);
        pagination();
    }
    public Boolean getfirst() {
        if(pageNumber == 0 || pageNumber == 1) {
            return true;
        } else {
            return false;
        }
    }
    public Boolean getlast(){
        Integer totalcontact = tempContactList.size();
        Integer lastPageNumber = ((totalcontact - math.mod(totalcontact,pageSize)) / pageSize);
        if(pageNumber ==  lastPageNumber + 1 || totalcontact < pageSize ) {
            return true;
        } else {
            return false;
        }
    }
}