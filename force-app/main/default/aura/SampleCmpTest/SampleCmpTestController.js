({
	buttonClick : function(cmp, event, helper) {
        var clickedBtn = event.getSource().getLocalId();
        
        if(clickedBtn && (helper.Abc == 1)){
            
            console.log('#######',clickedBtn,helper.Abc);
            helper.Abc++;
            
        }
        cmp.set("v.clickedButton", clickedBtn);
    }
})