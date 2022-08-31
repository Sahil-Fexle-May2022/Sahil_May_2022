public with sharing class Contact_TriggerHandler {
    public static void statusOfProperty(List<Contact> newList){    
        try{    
            //Create a new list of Account
            List<Account> acc = new List<Account>();
            //Create a Set that holds ids of related recrods
            set<Id> setOfID = new set<Id>();
            for(Contact con : newList){
                //if contact status is null and account status is not null than fill contact status with account status   
                if(con.Status__c == null){
                    if(acc != null){
                        setOfID.add(con.AccountId);
                    }
                }
            }
            //Create a new map of id and Account and query on Account
            Map<Id,Account> MapOfIdAndAccount = new Map<Id,Account>([SELECT Id, Status__c, Property__r.Status__c FROM Account WHERE Id IN: setOfID]);
            for(Contact cont : newList){
                if(MapOfIdAndAccount.get(cont.AccountId).Status__c != null){
                    cont.Status__c = MapOfIdAndAccount.get(cont.AccountId).Status__c;
                }
                else if(MapOfIdAndAccount.get(cont.AccountId).Property__r.Status__c != null){
                    cont.Status__c = MapOfIdAndAccount.get(cont.AccountId).Property__r.Status__c;                
                }
            }
        }
        catch(DmlException e)
        {
            system.debug('An unexpected error has occurred: ' + e.getMessage());
        }
    }    
}