public with sharing class MethodOverloading {
    public static Integer sum(Integer a,Integer b){
        Integer s = a+b;
        System.debug(s);
        return s;
    }
    public static Integer sum(Integer a,Integer b,Integer c){
        Integer s = a+b+c;
        System.debug(s);
        return s;
    }
}