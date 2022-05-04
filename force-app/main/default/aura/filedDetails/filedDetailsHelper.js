({
    getFiledNamehelper : function(component, event, helper) {
        var action = component.get("c.getAllFiledsName");
        action.setParams({
            objectName : component.get('v.selectedobject')
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
                
            }
        });
        $A.enqueueAction(action);
        
    },
    
    
    helperHandleChangeFiledName: function(component, event, helper){
        var fieldName = event.getParam("value");
        var filedInString = '';
        var custs = [];
        for ( var key in fieldName) {
            custs.push({fieldName:fieldName[key], label:fieldName[key]});
            if(filedInString == ''){
                filedInString = fieldName[key];
            }else{
                filedInString = filedInString +','+fieldName[key];
            }     
        }
        component.set('v.showDataTabels',true);
        var childCmp = component.find('childCmp');
        childCmp.sampleMethod(component.get('v.selectedobject'),filedInString,custs);
        
        
    }
})