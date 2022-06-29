public with sharing class CallByValueAndReference {
    public CallByValueAndReference() {
        Account a = new Account();
        a.Name = 'salessoft';
        a.Website = 'www.Sahilsales.com';
        changeWebsite(a);
        System.debug('Website -' +a.Website);
    }
    public Account changeWebsite(Account b) {
     //Create new Object and try to replace old
        b = new Account();
        b.Website = 'www.Salesforce.com';
        System.debug('Website = '+b.Website);
        return b;   
    }
}