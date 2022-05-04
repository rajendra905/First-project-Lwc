({
    
    doAction : function(component, event, helper) {
       // helper.getFiledNamehelper(component, event, helper);
    },
    sampleMethod : function(component, event, helper) {
        var params = event.getParam('arguments');
        component.set('v.selectedobject',params.selectedObjectName);
        if (params) {
            var param1 = params.selectedObjectName;
            var action = component.get("c.getAllFiledsName");
            action.setParams({
                objectName : param1
            });
            action.setCallback(this, function(response){
                var state = response.getState(); // get the response state
                if(state == 'SUCCESS') {
                    var conts = response.getReturnValue();
                    var custs = [];
                    for ( var key in conts ) {
                        custs.push({value:key, label:conts[key]});
                    }
                    component.set('v.objectFiledName',custs);
                    component.set('v.showDataTabels',false);
                }
            });
            $A.enqueueAction(action);
        }
    },
    
    handleChangeFiledName :  function(component, event, helper) {
        helper.helperHandleChangeFiledName(component, event, helper);
    }
})