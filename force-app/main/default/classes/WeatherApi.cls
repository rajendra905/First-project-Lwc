public class WeatherApi {
    public static void getWeatherApi(){
        Http http=new Http();
        HttpRequest req=new HttpRequest();
        req.setEndpoint('https://weatherbit-v1-mashape.p.rapidapi.com/forecast/3hourly?lat=35.5&lon=-78.5');
        req.setMethod('GET');
        req.setHeader('X-RapidAPI-Host', 'weatherbit-v1-mashape.p.rapidapi.com');
        req.setHeader('X-RapidAPI-Key','3e9edee5a2msh1f36ce1757c4ec9p14dd0fjsnf7ccf986002b');
        HttpResponse res=Http.send(req);
        if(res.getStatusCode()==200){
            system.debug(JSON.deserializeUntyped(res.getBody()));
        }
    }
    
    
    public static List<String> getPicklistValues(String Field_name){ 
        
        List<String> lstPickvals=new List<String>();
       // Schema.SObjectType targetType = Schema.getGlobalDescribe().get(ObjectApi_name);//From the Object Api name retrieving the SObject
       // Sobject Object_name = targetType.newSObject();
        Schema.sObjectType sobject_type = Account.getSObjectType(); //grab the sobject that was passed
        Schema.DescribeSObjectResult sobject_describe = sobject_type.getDescribe(); //describe the sobject
        Map<String, Schema.SObjectField> field_map = sobject_describe.fields.getMap(); //get a map of fields for the passed sobject
        List<Schema.PicklistEntry> pick_list_values = field_map.get(Field_name).getDescribe().getPickListValues(); //grab the list of picklist values for the passed field on the sobject
        for (Schema.PicklistEntry a : pick_list_values) { //for all values in the picklist list
            lstPickvals.add(a.getValue());//add the value  to our final list
        }
        
        return lstPickvals;
    }
}