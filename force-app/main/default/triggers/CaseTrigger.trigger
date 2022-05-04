trigger CaseTrigger on Case (before Update) {
     List<Case> caseList = Trigger.New;
     List<Hire_Form_c__c> hireList = new List<Hire_Form_c__c>();
    
    for(Case c : caseList){
         hireList=[SELECT Id, Status__c FROM Hire_Form_c__c  where Candidate__c =:c.ContactId];
        if(c.Status =='Closed'){
            for(Hire_Form_c__c hire : hireList){
                if(hire.Status__c != 'Completed'){
                    c.Status.addError('You can not close the case until hire form  is completed');
                }
            }
        }
    }

}