public with sharing class DMLSingleVSBulkOperations {
    public DMLSingleVSBulkOperations() {
        //Use Try and Catch Method
        try {
        List<Contact> updateOfTheList = new List<Contact>();
            for(Contact con : [Select Title , Description from Contact]) {
                if (con.Title == 'CFO') {
                    con.Description = 'Newest description';
                    // Add updated contact sObject to the list.
                    updateOfTheList.add(con);                    
                }
            }
            update updateOfTheList;
            system.debug('Contact List' +updateOfTheList);
        }
        catch(Exception e)
        {
           System.debug('An unexpected error has occurred: ' + e.getMessage());   
        }
    }
}