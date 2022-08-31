trigger Contact_Trigger on Contact (before insert,before update) {
    if(Trigger.isBefore){
        if(Trigger.isInsert || Trigger.isUpdate){
            Contact_TriggerHandler.statusOfProperty(Trigger.new);            
        }
    }    
}