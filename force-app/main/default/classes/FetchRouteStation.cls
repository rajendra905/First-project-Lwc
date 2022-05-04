@RestResource(urlMapping='/Route_Station__c/*')
global with sharing class FetchRouteStation {
	@HttpGet
    global static List<Route_Station__c> fetchRouteStation(){
        string DepName;
        String arrName;
        List<Route_Station__c> routeStationList = new List<Route_Station__c>();
        List<Route_Station__c> apalist = new List<Route_Station__c>();
        set<Route_Station__c> depaututerId = new set<Route_Station__c>();
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String routeStationId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        String[] stringArray = routeStationId.split(',');
        system.debug(routeStationId);
       	DepName = stringArray[0];
        arrName = stringArray[1];
      	routeStationList = [SELECT Id FROM Route_Station__c WHERE Name =:DepName];
        for(Route_Station__c depId : routeStationList){
            depaututerId.add(depId);
        }
        apalist = [SELECT Id, Name, Previous_Station__r.Name, main_Route__r.Name, main_Route__r.Total_Distance__c, Distance__c   FROM Route_Station__c WHERE Name =:arrName and Previous_Station__c in :depaututerId];
        for(Route_Station__c routeDetail : apalist){
            System.debug('Detail of Route Detail'+routeDetail);
        }
        system.debug('apalist'+apalist);
        System.debug('hii'+apaList);
        return apalist;
    }
}