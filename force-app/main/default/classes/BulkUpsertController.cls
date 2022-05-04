public class BulkUpsertController {
    public List<Opportunity> opportunityData{get;set;}
    public List<Opportunity> listopportunityData{get;set;}
    public BulkUpsertController() {
        opportunityData= new List<Opportunity>();
        Opportunity opportunity= new Opportunity();
        opportunityData.add(new Opportunity());
        opportunityData.add(new Opportunity());
        opportunityData.add(new Opportunity());
        
    }
    public PageReference cancel() {
        PageReference myPage = new PageReference('/apex/List_of_opportunity');
        myPage.setRedirect(true);
        return myPage;
    }
    
    public void addRow() {
        opportunityData.add(new Opportunity());
    }
    
    public void removeRow() {
        if(opportunityData.size()==3){
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,' Three row must be required '));
        }
        else{
            opportunityData.remove(opportunityData.size()-1);
            System.debug(opportunityData.size());
        }
    }
    
    public PageReference save() {
        List<Opportunity> oppList = new List<Opportunity>();
        for (Opportunity opportunity : opportunityData) {
            if(opportunity.Name != null && opportunity.CloseDate != null && opportunity.StageName != null ){
                oppList.add(opportunity);
            }
        }
        if(oppList.size() > 0){
            insert oppList;
        }
        PageReference myPage = new PageReference('/apex/List_of_opportunity');
        myPage.setRedirect(true);
        return myPage;
    }
}