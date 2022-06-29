public with sharing class PracticeLoops {
    //Conditional (If-Else) Statements
    public static void logIN(String userNameInput,String passwordInput){
        String userName = 'sahilsharma@fexle.com';
        String password = '@Sahilsharma1';
        if(userName == userNameInput && password == passwordInput){
            System.debug('You are loged in');
    }
            System.debug('UserName and Password is wrong');
    }

    //Example 2
    public static void leftTrianglePattern(){
        for(integer i=1;i<=5;i++){
        string s='  ';
        for(integer j=1;j<=5;j++)
        {
            if(j>=6-i )
            {
                s = s + 'x';
            }
            else
            {
                 s = s + '_';
            }
        }
        
        System.debug(s);
    }
  }

    //Do While Loop
    public static void factorial(){
    integer i = 1,num=5; 
    integer fact = 1; 
    do {  
        fact = fact * i;   
        i++;   
    } while( i <= num );  

    System.debug('Factorial of ' + num + ' is: ' + fact);
    }
    
    //While Loop
    public static void factorial(Integer value)
    {
        Integer count=2, result=2;
        while(count<=value)
        {
            result=result*count;
            count++;        
        }
        System.debug('factorial of given number is: '+result);
    }

    //For Loop
    public static void downTrianglePattern(){
    for(integer i=1;i<=5;i++)
    {
        string s='  ';
        for(integer j=1;j<=5;j++)
        {
            if(j<=6-i)
            {
                s = s + 'x';
            }
            else
            {
                 s = s + '_';
            }
        }
        
        System.debug(s);
        }
    }

    //For Each Loop
    public static void forEachLoop(){
        List<Account>  accList = [SELECT ID, Name FROM ACCOUNT LIMIT 20];
        for(Account acc : accList){
         System.debug('##'+acc);
        }
    }
}