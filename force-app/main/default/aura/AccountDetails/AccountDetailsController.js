({
    
    doInit : function(component, event, helper) {
        helper.getObjectDetails(component, event, helper);
    },
    
    handleChangeObjectOptions: function (component, event,helper) {
        helper.helperhandleChangeObjectOptions(component, event, helper);
    },
    
    // handleChangeFiledName: function (component, event,helper) {
    //     // This will contain an array of the "value" attribute of the selected options
    //     helper.helperHandleChangeFiledName(component, event, helper);
        
    // }
    
})