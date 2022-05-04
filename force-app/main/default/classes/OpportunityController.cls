public class OpportunityController {
    public List<Opportunity> opportunityData{get;set;}
    public OpportunityController() {
        opportunityData= new List<Opportunity>();
        Opportunity opportunity= new Opportunity();
        for (Integer i = 1 ; opportunityData.size() <> 3 ; i++ ){
            opportunityData.add(new Opportunity());
        }
    }
    public PageReference cancel() {
        PageReference myPage = new PageReference('/apex/List_of_opportunity');
        myPage.setRedirect(true);
        return myPage;
    }
    
    public void addRow() {
        if(opportunityData.size() == 10){
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,' Limit is ten '));
        }
        else{
            opportunityData.add(new Opportunity());
        }
        
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