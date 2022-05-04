@isTest
public class OpportunityControllerTest {
	@isTest
    public Static void addRow(){
        OpportunityController oppcontroller = new OpportunityController();
       // oppcontroller.opportunityData = [];
        oppcontroller.addRow();
        if(oppcontroller.opportunityData.size() == 10){
           // ApexPagesMessage[] pageMessages = ApexPages.getMessages();
        }
        
    }
    @isTest
    public Static void removeRow(){
        OpportunityController oppcontroller = new OpportunityController();
       // oppcontroller.opportunityData.add(new Opportunity());
        //oppcontroller.opportunityData.add(new Opportunity());
        //oppcontroller.opportunityData.add(new Opportunity());
        oppcontroller.removeRow();
        //system.debug('hiiii'+oppcontroller.opportunityData.size());
        if(oppcontroller.opportunityData.size() == 3){
            
        }
        
        oppcontroller.opportunityData.add(new Opportunity());
        oppcontroller.removeRow();
        oppcontroller.opportunityData.remove(oppcontroller.opportunityData.size() - 1);
       // System.debug('hiii'+oppcontroller.opportunityData.size());
        
    }
    @isTest
    public static void save(){
       
         Date closeDate;
         closeDate = Date.newInstance(2021,09,06);
        // Opportunity opp1 = new Opportunity(Name = 'new Test 1', CloseDate =closeDate, StageName='Prospecting');
       //  Opportunity opp2 = new Opportunity(Name = 'new Test 2', CloseDate =closeDate, StageName=null);
        // Opportunity opp3 = new Opportunity(Name = null, CloseDate =closeDate, StageName='Needs Analysis');
         OpportunityController oppcontroller = new OpportunityController();
         oppcontroller.save();
       //  oppcontroller.opportunityData = new oppcontroller.opportunityData(Name = 'new Test 1');
       //  oppcontroller.opportunityData.add(opp2);
       //  oppcontroller.opportunityData.add(opp3);
       
         List<Opportunity> oppList = new List<Opportunity>();
        System.debug('new'+oppcontroller.opportunityData.size());
        for (Opportunity opportunity : oppcontroller.opportunityData) {
            if(opportunity.Name != null && opportunity.CloseDate != null && opportunity.StageName != null ){
                //oppList.add(opportunity);
            }
        }
        System.debug('@@@@@@@'+oppList.size());
        if(oppList.size() > 0){
           // insert oppList;
        }        
       // oppcontroller.opportunityData.Name = 'Raj';
    }
    
}