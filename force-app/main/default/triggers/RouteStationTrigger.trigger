trigger RouteStationTrigger on Route_Station__c (after insert, after update, after delete, after undelete) {
	RouteStationTriggerHelper.isTotalDistance(Trigger.new,Trigger.old);
}