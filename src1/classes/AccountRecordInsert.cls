public with sharing class AccountRecordInsert {
    public AccountRecordInsert() {
        Account acc = new Account();
        acc.id ='0015i00000AibcoAAB';
        acc.Name = 'Harry';
        acc.AccountNumber = '324964587673';
        acc.Phone = '5125562355';
        System.debug(acc);
        //insert acc;
        //delete acc;
        update acc;
    }
}