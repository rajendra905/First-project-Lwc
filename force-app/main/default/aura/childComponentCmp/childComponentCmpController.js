({
    handleClick : function(component, event, helper) {
        var compEvent = component.getEvent("sampleComponentEvent");
        console.log('component.get("v.enteredText")'+component.get("v.enteredText"));
        compEvent.setParams({
            "message" : component.get("v.enteredText") 
        });
        compEvent.fire();
    }
})