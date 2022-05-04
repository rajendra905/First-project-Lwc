public with sharing class productController {

    @AuraEnabled(cacheable = true)
    Public static List<Product2> getProductList(){
        return [select Id, Name, ProductCode from Product2];
    }
    
}