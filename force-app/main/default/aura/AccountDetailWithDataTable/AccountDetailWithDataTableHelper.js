({
    fetchAccHelper : function(component, event, helper) {
        console.log('hiii');
        component.set('v.mycolumns', [
            {
                label: 'Account Name', 
                fieldName: 'linkName', 
                type: 'url', 
                sortable : true,
                typeAttributes: {label: { fieldName: 'Name' },
                                 target: '_blank',
                                 tooltip: { fieldName: 'Name' }
                                }, 
                sortable: true
            },{
                label : 'Contact Name',
                fieldName : 'ContactNameLink',
                type: 'url', 
                sortable : true,
                typeAttributes: {label: { fieldName: 'ContactName' },
                                 target: '_blank',
                                 tooltip: { fieldName: 'ContactName' }
                                }, 
                sortable: true
            },
            {label: 'Industry', fieldName: 'Industry', type: 'text', sortable : true},
            {label: 'Phone', fieldName: 'Phone', type: 'Phone', sortable : true},
            {label: 'Website', fieldName: 'Website', type: 'url ', sortable : true},
            {type: "button", typeAttributes: {
                label: 'Edit',
                name: 'Edit',
                title: 'Edit',
                disabled: false,
                value: 'edit',
                iconPosition: 'left'
            }}
        ]);
        var action = component.get("c.fetchAccounts");
        action.setParams({
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                //component.set("v.acctList", response.getReturnValue());
                let nameUrl;
                var result = response.getReturnValue();
                console.log('result',result);
                result.forEach(function(record){
                    record.linkName = '/'+record.Id;
                    record.ContactNameLink = '/'+record.ContactId;
                    //console.log(result.Contacts[0].Name);
                });
                
                component.set("v.acctList", result);
                console.log('component.set',component.get("v.acctList"));
            }else if(state == "Error"){
                console.log(response.getError());
            }
        });
        $A.enqueueAction(action);
        
        
        
       // component.addEventHandler("force:recordChange", component.getReference("fetchAccHelper"));
    },
    
    sortData: function (cmp, fieldName, sortDirection) {
        var fname = fieldName;
        var data = cmp.get("v.acctList");
        var reverse = sortDirection !== 'asc';
        if(fieldName == 'linkName'){
            data.sort(this.sortBy('Name', reverse))
        }else if(fieldName == 'ContactNameLink'){
            data.sort(this.sortBy('ContactName', reverse))
        }else{
            data.sort(this.sortBy(fieldName, reverse))   
        }
        
        cmp.set("v.acctList", data);
    },
    
    sortBy: function (field, reverse) {
        var key = function(x) {return x[field]};
        reverse = !reverse ? 1 : -1;
        return function (a, b) {
            a = key(a) ? key(a).toLowerCase() : ''; // handling null values
            b = key(b) ? key(b).toLowerCase() : '';
            // sorting values based on direction
            return reverse * ((a > b) - (b > a));
            //return a = key(a).toLowerCase(), b = key(b).toLowerCase(), reverse * ((a > b) - (b > a));
        }
    },
    
    viewRecord : function(component, event) {
        var row = event.getParam('row');
        var recordId = row.Id;
        var viewRec=$A.get("event.force:navigateToSObject");
        viewRec.setParams({
            "recordId": recordId,
            "slideDevName": "detail"
        });
        viewRec.fire();
    },
    
    editRecord :  function(component, event) {
        
    }
})