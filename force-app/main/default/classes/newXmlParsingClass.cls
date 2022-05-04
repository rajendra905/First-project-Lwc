//@RestResource(urlMapping='/getAccountDetails/*')
/*global with sharing class newXmlParsingClass {
    public static void getXmlParsing(String strResp){
        Dom.Document doc = new Dom.Document();  
        doc.load( strResp );  
        Dom.XMLNode rootElement = doc.getRootElement();  
        for ( Dom.XMLNode childElement : rootElement.getChildElements() ) {    
            for ( Dom.XMLNode detailElement : childElement.getChildElements() )  
                system.debug( detailElement.getName() + '-' + detailElement.getText() );  
            
        }  
    }
}*/
@RestResource(urlMapping='/Account/*')
global with sharing class newXmlParsingClass {
    @HttpGet
    global static String getAccounts() {
        RestRequest request = RestContext.request;
        list<Account> result = new list<Account>();
        result =  [SELECT Name,Website FROM Account];
        return 'Get Request Working';
       // return JSON.serialize(result);
    }
    @HttpPost
    global static Id getAccounts(String AccountName) {
        Account acc = new account();
        acc.Name = AccountName ;
        acc.Website = 'www.'+ AccountName +'.com' ;
        Insert acc ;
        return acc.Id;
    }
}