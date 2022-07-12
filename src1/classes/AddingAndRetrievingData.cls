public with sharing class AddingAndRetrievingData {
    public static void addingAndRetrievingDataWithDml() {

        //Use Try and Catch Method
        try {
        //Query existing account   
        Account a = [SELECT ID,Name,Industry FROM Account WHERE Name='Harry' LIMIT 1];
        system.debug('Account Name before update: ' + a.Name);
        system.debug('Account Industry before update: ' + a.Industry);

        a.Name = 'Account of the Day';
        a.Industry = 'Technology';

        update a;
        system.debug(a);
        }
        catch(DmlException e) {
            system.debug('An unexpected error has occurred: ' + e.getMessage());
        }
        // Get a new copy of the account from the database with the two fields.
        Account a = [SELECT Name,Industry FROM Account WHERE Name='Account of the Day' LIMIT 1];
        
        // Verify that updated field values were persisted.
        System.assertEquals('Account of the Day', a.Name);
        System.assertEquals('Technology', a.Industry);
    }
}