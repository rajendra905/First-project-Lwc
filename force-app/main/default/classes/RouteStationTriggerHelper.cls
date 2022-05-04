public class RouteStationTriggerHelper {
    public static set<Id>routeStationId=new set<Id>();
    public static List<Route__c> lstAcc = new List<Route__c>();
    public static double val = 0;
    
    public Static void isTotalDistance(List<Route_Station__c> routeStation,List<Route_Station__c> oldRouteStation){
        if(trigger.isinsert || trigger.isundelete){
            for(Route_Station__c c : routeStation){
                routeStationId.add(c.Main_Route__c);
            }
        }
        else if(trigger.isDelete){
            for(Route_Station__c c : oldRouteStation){
                routeStationId.add(c.Main_Route__c);
            }
        }
        else if(trigger.isUpdate){
            for(Route_Station__c c : routeStation){
                if(c.Main_Route__c != null){
                    if(c.Main_Route__c != c.Main_Route__c){
                        routeStationId.add(c.Main_Route__c);     
                    }
                } 
                routeStationId.add(c.Main_Route__c);
            }
        }
        if(routeStationId.size() > 0){
            lstAcc = [Select id,Total_Distance__c,
                      (Select id,Distance__c from Route_Stations__r) 
                      from Route__c 
                      where id IN : routeStationId];
        }
        for(Route__c acc : lstAcc){
            for(Route_Station__c con : acc.Route_Stations__r){
                if(con.Distance__c!=Null){
                    val += con.Distance__c;}
            }
            acc.Total_Distance__c = val;
        }
        update lstAcc;
        
    }
}