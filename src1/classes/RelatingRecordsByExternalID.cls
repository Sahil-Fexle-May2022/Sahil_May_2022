public with sharing class RelatingRecordsByExternalID {
    public RelatingRecordsByExternalID() {
        Opportunity newOpportunity = new Opportunity(Name = 'OpportunityWithAccountInsert',StageName = 'Prospecting',CloseDate = Date.today().addDays(7));
        Account accountReference = new Account(MyExtID__c = 'SAP111111');                

    // Add the account sObject to the opportunity
    newOpportunity.Account = accountReference;

    // Create the opportunity
    Database.SaveResult results = Database.insert(newOpportunity);

    }
}