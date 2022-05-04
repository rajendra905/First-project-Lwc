({
	doInit : function(component, event, helper) {
		
	},
    sampleMethod : function(component, event, helper) {
        console.log('Hiiii');
        var params = event.getParam('arguments');
        console.log(params.selectedObjectName);
        console.log(params.seletedFiledQuery);
        console.log(params.seletedFiledName);
        if (params) {
            var param1 = params.selectedObjectName;
            var param2 = params.seletedFiledQuery;
            var action = component.get("c.getObjectData");
        action.setParams({
            objectName : param1,
            selectedField : param2
        });
        action.setCallback(this, function(response){
            var state = response.getState(); // get the response state
            if(state == 'SUCCESS') {
                var conts = response.getReturnValue();
                console.log('response.getReturnValue() : ',response.getReturnValue());
                if(conts.length != 0){
                    console.log('custs',conts);
                    component.set('v.columns',params.seletedFiledName);
                    component.set('v.data',conts);
                    component.set('v.showDataTabels',true);
                }else{
                    component.set('v.showDataTabels',false);
                }
            }
        });
        $A.enqueueAction(action);

        }
            }
})