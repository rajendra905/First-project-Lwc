public class GetObjectDetailsController {
    @AuraEnabled
    public static Map<string,string> getAllObjectName(){
        List<String> sObjectList = new List<String>();
        Map<string,string> objectMap  = new Map<string, string>();
        for(Schema.SObjectType objTyp : Schema.getGlobalDescribe().Values())
        {
            Schema.DescribeSObjectResult describeSObjectResultObj = objTyp.getDescribe();
            //System.debug('describeSObjectResultObj'+describeSObjectResultObj);
            //System.debug('objTyp.getDescribe()'+objTyp.getDescribe().getName());
            //System.debug('objTyp.getDescribe()'+objTyp.getDescribe().getLabel());
            String objectLabelName = objTyp.getDescribe().getLabel();
            string objectApiName  = objTyp.getDescribe().getName();
            // Exclude all the unwanted Sobjects e.g. History, Share etc.
            if(!objectLabelName.containsignorecase('history') && !objectLabelName.containsignorecase('tag')&&
               !objectLabelName.containsignorecase('share') && !objectLabelName.containsignorecase('feed'))
            {
                objectMap.put(objectApiName,objectLabelName);
                //sObjectList.add(objectLabelName);
                //System.debug('name'+name);
            }
            
        }
        return objectMap;
        
    }
    
    @AuraEnabled
    public static Map<String, String> getAllFiledsName(string objectName){
        List<String> fieldList = new List<String>();
        Map<String, String> filedMap = New Map<String, String>();
        Schema.SObjectType targetType = Schema.getGlobalDescribe().get(objectName);
        Map<String, Schema.SObjectField> fieldMap = targetType.getDescribe().fields.getMap();
        for (Schema.SObjectField field : fieldMap.values()) {
           filedMap.put(field.getDescribe().getName(),field.getDescribe().getLabel());
            //fieldList.add(field.getDescribe().getName());
        }
      	//System.debug('fieldList'+fieldList);
        return filedMap;
    }
    
    @AuraEnabled 
    public static List<SObject> getObjectData(string objectName, string selectedField){
       string soqlQuery = 'SELECT '+selectedField+ ' FROM ' + objectName;
       System.debug(soqlQuery);
       //System.debug('###33'+Database.Query(soqlQuery));
       //Map<Id, SObject> dataMap =new Map<Id, SObject>((List<sObject>)Database.Query(soqlQuery));
       List<SObject> dataList = Database.Query(soqlQuery);
       System.debug('getData'+dataList);
       return dataList;
    }
}