public with sharing class AccountTriggerHelper{
    //In This Method We Are Set a Prefix On Saving Account And FD Account
    public static void setPrefixOnAccount(List<Account> newAccountList){
        try{
            if(newAccountList.size() > 0){
                for(Account acc : newAccountList){
                    if(acc.Account_Type__c == 'Saving-Account'){
                        acc.AccountNumber = 'SA-' +acc.AccountNumber;
                    }
                    else if(acc.Account_Type__c == 'Fixed-Deposit'){
                        acc.AccountNumber = 'FD-'+acc.AccountNumber;
                    }
                }
            }
        }
        catch(DmlException e){
            system.debug('An unexpected error has occurred: ' + e.getMessage());
        }
    }
    //In This Method We Are Sending an Email To Customer
    public static void sendingEmail(List<Account> newAccountList){
        try{
            //Creating a Master List To Hold The Emails We Want To Send       
            List<Messaging.SingleEmailMessage> emailsend = new List<Messaging.SingleEmailMessage>();
            for(Account acc : newAccountList){              
                Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage(); 
                if(acc.Email__c != null){
                //Set a Email Address
                email.setToAddresses(new List<String>{acc.Email__c});
                //Set a Subject Of Email
                email.setSubject('Congratulations:'+ acc.Name);
                //Set a Email Body
                String body = ('Mr/Ms' + acc.Name + 'Welcome to the Axis Bank' + '<br>' + 'You Successfully Open a Account'+ '<br>' + 'Your Account Number is' + acc.AccountNumber);
                email.setHtmlBody(body);
                //Add Email to Master List
                emailsend.add(email);
            }
        }
            //Send Email to MasterList
            if(emailsend.size() > 0)
            {
                Messaging.sendEmail(emailsend);
            }
        }
        catch(DmlException e) {
            system.debug('An unexpected error has occurred: ' + e.getMessage());
        }
    }
}