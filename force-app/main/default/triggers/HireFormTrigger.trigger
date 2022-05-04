trigger HireFormTrigger on Hire_Form_c__c (before insert,after insert ,before update) {
    List<Hire_Form_c__c> hireList = Trigger.New;
    Date DateofBirth ;
    DateofBirth = Date.newInstance(2000,2,24);
    public string contactID{get;set;}
    List<Contact> contactList = new List<Contact>();
     List<Case> caseList = new List<Case>();
    if(Trigger.isBefore && Trigger.isInsert){
        for(Hire_Form_c__c hireform :hireList){
            if(hireform.Status__c == 'In Progress'){
                Contact contact=new Contact();
                Case cases =new Case();
                contact.FirstName = hireform.Name;
                contact.LastName = hireform.Last_Name__c;
                contact.Email = hireform.Email__c;
                contact.Phone = hireform.Phone__c;
                contact.Birthdate =DateofBirth;
                contactList.add(contact);
                insert contactList;
             	hireform.Candidate__c = contact.id;
                 cases.Status='New';
                cases.ContactId=contact.Id;            
            	caseList.add(cases); 
           		insert caseList;
            }
        }
    } 
     
    if(Trigger.isUpdate){
        for(Hire_Form_c__c hireform : hireList){
            contactID= hireform.Candidate__c;
            caseList=[select id,ContactId,Status from Case where ContactId =:contactID];
            if(hireform.Status__c == 'Completed'){
                for(Case caseItem : caseList){
                    caseItem.Status ='Closed';
                }
            }
            
        }
        update caseList;
        
    }
    

    
}