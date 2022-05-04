public class GoogleTranslateApi {
    public static Google_Translate__mdt endPointGoogleTranslate = Google_Translate__mdt.getInstance('End_Point'); 
    
    //get Languange 
    @AuraEnabled(cacheable = true)
	public static Object getLanguage(){
        string word='', target='en';
        string getbody = setBody(word, target);
     	List<Object> responseList = new List<Object>();
        HttpResponse response = httpMethodCall(endPointGoogleTranslate.End_Point__c + '/languages',getbody);
        if(response.getStatusCode() == 200){
          	Map<String, Object> responseMap = (Map<String, Object>) System.JSON.deserializeUntyped(response.getBody());
            if(responseMap.containsKey('data')){
                Map<String, Object> dataMap = (Map<String, Object>) responseMap.get('data');
                if(dataMap.size() > 0){
                   responseList	 = (List<Object>) dataMap.get('languages');
                }  
            }
        }
        System.debug('YYYYY'+responseList);
        return responseList;
    }
    
    //Translate the word
    @AuraEnabled
    public static Object getTranslate(string word , string target){
        string getbody = setBody(word, target);
       	List<Object> responseList = new List<Object>();
       	HttpResponse response = httpMethodCall(endPointGoogleTranslate.End_Point__c, getbody);
      	if(response.getStatusCode() == 200){
           	Map<String, Object> responseMap = (Map<String, Object>) System.JSON.deserializeUntyped(response.getBody());
            if(responseMap.containsKey('data')){
                Map<String, Object> dataMap = (Map<String, Object>) responseMap.get('data');
                if(dataMap.size() > 0){
                   responseList	 = (List<Object>) dataMap.get('translations');
                }  
            }           
        }
        return responseList.get(0);
    }
    
    //hit the api and return the response 
    Private static HttpResponse httpMethodCall(string endPoint, string body){
       	Google_Translate__mdt authorizeGoogle = Google_Translate__mdt.getInstance('Authorize_Google');
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endPoint);
        req.setMethod('GET');
        req.setHeader('RapidAPI-Host',authorizeGoogle.RapidAPI_Host__c);
        req.setHeader('RapidAPI-Key',authorizeGoogle.RapidAPI_Key__c);
       	req.setBody(body);
        return Http.send(req);  
    }
    
    //set body 
    Private static string setBody(string query, string target){
        string setQuery = 'q=' + query + '&target='+ target;
        return setQuery;
    }
}