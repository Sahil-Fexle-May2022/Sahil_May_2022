trigger OpportunityTrigger on Opportunity (after insert,after update) {
    if(Trigger.isAfter){
        if(Trigger.isInsert){
            OpportunityTriggerHelper.insertingAutomobileRecord(Trigger.New,Trigger.OldMap);
            OpportunityTriggerHelper.sendRecordEmails(Trigger.New);
        }    
        if(Trigger.isUpdate){
            OpportunityTriggerHelper.updateRecords(Trigger.New,Trigger.OldMap);
        }
    }
}