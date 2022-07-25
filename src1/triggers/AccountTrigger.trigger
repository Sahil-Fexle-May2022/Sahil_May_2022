trigger AccountTrigger on Account (before insert,after insert){ 
    if(Trigger.isInsert){
        if(Trigger.isBefore){
            AccountTriggerHelper.setPrefixOnAccount(Trigger.new);
        }
        if(Trigger.isAfter){
            AccountTriggerHelper.sendingEmail(Trigger.new);
        }
    }
}