trigger DistrictTrigger on District__c (after insert, after update, after delete) {
    if(Trigger.isAfter){
        if(Trigger.isInsert || Trigger.isUpdate || Trigger.isDelete){
        DistrictTriggerHelper.countOfDistrictOnStates(Trigger.New, Trigger.Old);
        }
    }
}