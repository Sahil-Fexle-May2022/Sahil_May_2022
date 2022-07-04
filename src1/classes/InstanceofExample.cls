public with sharing class InstanceofExample{

    public static void instanceofExample(){
    sObject s =  new Account();
    //This one is correct typecasting
    Account a = (Account)s;
    //It is wrong,Run Time Error
    Contact c = (Contact)s;

    if (s instanceof Account){
        Account acc = (Account)s;
    }
    else if (s instanceof Contact){
        Contact con = (Contact)s;
    }
    System.debug(s);
  }
}