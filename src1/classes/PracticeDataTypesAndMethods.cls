public with sharing class PracticeDataTypesAndMethods{    
    // ***************************Data Types**********************************************

    //Boolean
    public static void bolleanExample(){
        Boolean isWinner = True;
        system.debug(isWinner);
    }
   
    // Double
    public static void doubleExample(){
        Double d = 4.5689;
        system.debug(d);
    }
   
    // ID
    public static void idExample(){
        Id i = '00300000003T2PGAA0';
        system.debug(i);
    }
   
    // Integer
    public static void integerExample(){
        Integer i = 10;
        system.debug(i);
    }
   
    // Object
    public static void objectExample(){
        Object obj = 10;
        Integer i = (Integer)obj;
        system.debug(obj);
        system.assertEquals(10, i);
    }

    // String
    public static void stringExample(){
        String str1 = 'I am learning apex.';
        system.debug(str1);
    }

    //********************************Collections*******************************

    //List Method
    public static void listMethod(){
        List<String> myList = new List<String>();
        myList.add('Sahil');
        myList.add('Steve');
        system.debug(myList);
    }

    // Set Method
    public static void setMethod(){
        Set<Integer> setInt = new Set<Integer>();
        setInt.add(88);
        setInt.add(56);
        setInt.add(11);
        system.debug(setInt);      
    }

    //Map Method
    public static void mapMethod(){
        Map<Integer,String> rollNumber_Name = new Map<Integer,String>();

        rollNumber_Name.put(01,'Sahil Sharma');
        rollNumber_Name.put(02,'Harry Singh');
        rollNumber_Name.put(02,'Steven Saini');
        system.debug(rollNumber_Name);
    }

    //****************************Date Methods**************************

    //Month Method
    public static void monthMethod(){
        date myDate = date.newInstance(2004, 11, 21);
        Integer month = myDate.month();
        system.debug(month);
    }

    //Day Method
    public static void dayMethod(){
        date myDate = date.newInstance(1989, 4, 21);
        Integer day = myDate.day();
        system.debug(day);
    }

    //Day Of Year Method
    public static void dayOfYear(){
        date myDate =date.newInstance(2015,04,22);
        Integer day = myDate.dayOfYear();
        system.debug(day);
    }

    //*************************DateTimeMethod*******************************

    //DateTimeMethod
    public static void dateTime(){
       DateTime myDateTime = DateTime.now();
       system.debug(myDateTime);
    }

    // HourMethod
    public static void dateTimeMethod(){
        DateTime myDateTime = DateTime.newInstance(1998, 11, 21, 3, 3, 3);
        System.debug(myDateTime.hour());
    }

    //Minute Method
    public static void minuteMethod(){
        DateTime myDateTime = DateTime.newInstance(2001, 2, 27, 3, 3, 3);
        system.debug(myDateTime.minute());
    }

    //*********************StringMethods**********************************

    //LeftLengthMethod
    public static void leftLengthMethod(){
        String s1 = 'abcdaacd';
        String s2 = s1.right(3);
        System.debug(s2);
    }

    //RightLengthMethod
    public static void rightLengthMethod(){
        String s1 = 'Sahil';
        String s2 = s1.right(4);
        System.debug(s2);
    }
    //Capitalize Method
    public static void capitalizeMethod(){
        String s = 'hello people';
        String s2 = s.capitalize();
        System.debug(s2);
    }  
  }