public class BulkUpdateOppController {
    public List<Opportunity> opportunityList{get;set;}
    public BulkUpdateOppController() {
        Opportunity opportunity= new Opportunity();
        opportunityList = [SELECT AccountId, Name,  StageName, Amount, CloseDate FROM Opportunity];
    }
    public PageReference cancel() {
        PageReference myPage = new PageReference('/apex/List_of_opportunity');
        myPage.setRedirect(true);
        return myPage;
    }
    
    public void addRow() {
        opportunityList.add(new Opportunity());
    }
    
    public void removeRow() {
        opportunityList.remove(opportunityList.size() - 1);
    }
    
    public PageReference save() {
        upsert opportunityList;
        PageReference myPage = new PageReference('/apex/List_of_opportunity');
        myPage.setRedirect(true);
        return myPage;
    }
}