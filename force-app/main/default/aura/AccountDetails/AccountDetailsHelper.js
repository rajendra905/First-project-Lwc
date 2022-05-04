({
    selectedObject : '',
    helperMethod : function() {
        
    },
    getObjectDetails : function(component, event, helper){
        var action = component.get("c.getAllObjectName");
        action.setCallback(this, function(response) {
            var conts = response.getReturnValue();
            var custs = [];
            for ( var key in conts ) {
                custs.push({value:key, label:conts[key]});
            }
            console.log('custs',custs)
            component.set("v.objectOptions",custs);
        });
        $A.enqueueAction(action);
    },
    
    helperhandleChangeObjectOptions : function(component, event, helper){
        component.set('v.showFiledName',true);
        var childCmp = component.find('childCmp');
        childCmp.sampleMethod(event.getParam("value"));
        //component.set('v.selectedObject',event.getParam("value"));
        
       // component.set('v.showDataTabels',false);
        /*var action = component.get("c.getAllFiledsName");
        action.setParams({
            objectName : helper.selectedObject 
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
                component.set('v.showFiledName',true);
                component.set('v.showDataTabels',false);
            }
        });
        $A.enqueueAction(action);*/
    },
    
    // helperHandleChangeFiledName: function(component, event, helper){
    //     var fieldName = event.getParam("value");
    //     var filedInString = '';
    //     var custs = [];
    //     for ( var key in fieldName) {
    //         custs.push({fieldName:fieldName[key], label:fieldName[key]});
    //         console.log('fieldName[key]',key);
    //         if(filedInString == ''){
    //             console.log('if');
    //             filedInString = fieldName[key];
    //         }else{
    //             console.log('else');
    //             filedInString = filedInString +','+fieldName[key];
    //         }     
    //     }
    //     console.log(filedInString);
    //     //console.log(filedInString.getChars());
        
    //     var action = component.get("c.getObjectData");
    //     console.log('action',action);
    //     console.log(helper.selectedObject);
        
    //     action.setParams({
    //         objectName : helper.selectedObject,
    //         selectedField : filedInString
    //     });
    //     console.log('action',action.setParams);
    //     action.setCallback(this, function(response){
    //         var state = response.getState(); // get the response state
    //         if(state == 'SUCCESS') {
    //             var conts = response.getReturnValue();
    //             if(conts.length != 0){
    //                 component.set('v.columns',custs);
    //                 component.set('v.data',conts);
    //                // component.set('v.showDataTabels',true);
    //             }else{
    //                // component.set('v.showDataTabels',false);
    //             }
    //         }
    //     });
    //     $A.enqueueAction(action);
    // }
})