trigger OpportunityProductTrigger on OpportunityProduct__c (before insert,after Insert) {
    set<String> oppname =new set<string>();
    List<OpportunityProduct__c> productList = new List<OpportunityProduct__c>();
    for (OpportunityProduct__c name : Trigger.New){
         oppname.add(name.Opportuity_Name__c);
    }
    System.debug('name'+oppname);
    productList =[select id ,Opportuity_Name__c,Primary_Product__c  from OpportunityProduct__c where Opportuity_Name__c IN :oppname];
    for(OpportunityProduct__c product : productList){
        product.Primary_Product__c = false;
    }
    System.debug('before insert'+productList);
    
    if(productList.size() == 0){
        for(OpportunityProduct__c product : Trigger.new){
            product.Primary_Product__c = true;
        }
       insert productList;
    }
    else{
         for(OpportunityProduct__c product : Trigger.new){
            product.Primary_Product__c = true;
        }
       insert productList;
    }
	   	
    
    
   
   
}