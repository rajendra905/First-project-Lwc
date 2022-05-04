public class FieldsetCustomTableController {

    @AuraEnabled (cacheable=true)
    public static String getFieldAndRecords(String objectApiName, String fieldSetName){
        Map<String, String> returnMap = new Map<String,String>();
        if(!String.isEmpty(objectApiName) && !String.isEmpty(fieldSetName)){
            
            SObject sObj = (SObject)(Type.forName('Schema.'+ objectApiName).newInstance());
            List<Schema.FieldSetMember> lstFSMember = sObj.getSObjectType().getDescribe().fieldSets.getMap().get(fieldSetName).getFields();
    // all feilds are stored in 1stFSMember variable
    String query = 'SELECT ';
    for(Schema.FieldSetMember f : lstFSMember) { // now that data is in f now 
        query += f.getFieldPath() + ', ';
        }
        query += 'Id FROM ' + objectApiName ; // by entering object api name it will get the id 
        List<SObject> Records = Database.query(query); // here records are stored in list
        returnMap.put('FIELD_LIST', JSON.serialize(lstFSMember)); //all the feilds are kept in map
        returnMap.put('RECORD_LIST', JSON.serialize(Records));// and also the records
        return JSON.serialize(returnMap); // finally map is returned :)
        }
        return null;
    }
}