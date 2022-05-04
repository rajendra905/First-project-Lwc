public class LeadController {
    public Lead lead{get;set;}
    public List<Lead> leadList{get;set;}
    public Id leadId{get;set;}
	public Integer pageSize;
	public List<Lead> tempLeadList;
	public Integer pageNumber; 
    public String searchText{get;set;}
    public LeadController() {
        System.debug('LeadController execute !!');
        lead = new Lead();
        leadList = new List<Lead>();
                
        listPagination();
        
        Id recordId = Apexpages.currentPage().getParameters().get('editId');
        Id cloneId = Apexpages.currentPage().getParameters().get('cloneId');
        if(recordId != NULL) {
            lead = [Select Id, FirstName, LastName, Company, Status, Phone From Lead Where Id =: recordId];
        } else if(cloneId != NULL) {
            lead = [Select Id, FirstName, LastName, Company, Status, Phone From Lead Where Id =: cloneId];
            lead.Id = NULL;
        }
    }
    
    private void listPagination() {
        pageSize = 10;
        pageNumber = 1;
            
        tempLeadList = [Select Id, FirstName, LastName, Company, Status, Phone From Lead];
		System.debug(tempLeadList.size());                
        for(Integer count = 0; count < pageSize; count++) {
            leadList.add(tempLeadList.get(count));
        }
    }
    
    public PageReference addLead() {
        System.debug('@@ '+lead);
        PageReference pg = new PageReference('/apex/lead_list');
        pg.setRedirect(true);
        try {
            /*
            if(lead.Id == NULL) {
        		insert lead;
            } else {
                update lead;
            }
			*/
            upsert lead;
        } catch(Exception ex) {
            ApexPages.addMessages(ex);
        }
        return pg;
    }
    
    public PageReference editLead() {
        System.debug(leadId);
        PageReference pg = new PageReference('/apex/add_new_lead?editId='+leadId);
        pg.setRedirect(true);
        return pg;
    }
    
    public PageReference deleteLead() {
        delete [Select Id From Lead Where Id =: leadId];
        PageReference pg = new PageReference('/apex/lead_list');
        pg.setRedirect(true);
        return pg;
    }
    
    public void handleNext() {
        Integer count = pageSize * pageNumber;
        pageNumber++;
        Integer lastSize = pageSize * pageNumber;
        if(tempLeadList.size() < lastSize) {
            lastSize = tempLeadList.size();
        }
        leadList = new List<Lead>();
        for(; count < lastSize; count++) {
            leadList.add(tempLeadList.get(count));
        }
    }
    
    public PageReference cloneLead() {
        PageReference pg = new PageReference('/apex/add_new_lead?cloneId=' + leadId);
        pg.setRedirect(true);
        return pg;
    }
    
    public void doSearch() {
        System.debug(searchText);
        if(!String.isEmpty(searchText)) {
        	//	leadList = [Select Id, FirstName, LastName, Company, Status, Phone From Lead Where FirstName =: searchText];
            //	leadList = [Select Id, FirstName, LastName, Company, Status, Phone From Lead Where FirstName =: searchText OR LastName =: searchText];
            leadList = [Select Id, FirstName, LastName, Company, Status, Phone 
                        From Lead 
                        Where FirstName LIKE : + '%' + searchText + '%'
                        	OR LastName LIKE : + '%' + searchText + '%'];
        } else {
            listPagination();
        }
    }
}