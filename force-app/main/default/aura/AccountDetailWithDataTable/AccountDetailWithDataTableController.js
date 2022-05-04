({
    fetchAcc : function(component, event, helper) {
        helper.fetchAccHelper(component, event, helper);
    },
    handleSort  : function(component, event, helper) {
        var sortBy = event.getParam("fieldName");
        //returns the direction of sorting like asc or desc
         console.log('sortBy',sortBy);
        var sortDirection = event.getParam("sortDirection");
        //Set the sortBy and SortDirection attributes
        component.set("v.sortBy",sortBy);
        component.set("v.sortDirection",sortDirection);
        helper.sortData(component,sortBy,sortDirection);
    },
    
    handleRowAction: function (component, event, helper) {
        var recId = event.getParam('row').Id;
        var action = event.getParam('action');
        switch (action.name) {
            case 'view':
                helper.viewRecord(component, event);
                break;
            case 'Edit':
                var editRecordEvent = $A.get("e.force:editRecord");
                editRecordEvent.setParams({
                    "recordId": recId
                });
                editRecordEvent.fire();
                break;
            case 'delete':
                //helper.deleteRecord(component, event);
                break;
        }
    },
    
    onSave : function (component, event, helper) {
        console.log('hiii');
    }
})