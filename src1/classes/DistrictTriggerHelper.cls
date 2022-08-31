public with sharing class DistrictTriggerHelper {
    public static void countOfDistrictOnStates(List<District__c> newData, List<District__c> oldData){
        try{
            //Create a list of State
            List<State__c> stateList = new List<State__c> ();
            // Set to Hold Records Of Related Records
            Set<Id> setOfData = new Set<Id>();
            //Here we are add district in setOfData
            for(District__c district : newData) {
                if(district.State__c != null){
                setOfData.add(district.State__c);
                }                
            } 
            //Here we are checking if oldData is not null than add in setOfData
            if(oldData !=null){
                for(District__c dis : oldData){
                    if(dis.State__c != null){
                    setOfData.add(dis.State__c);
                    }                                    
                }
            }
            system.debug('setOfData' + setOfData);
            List<State__c> updateStateList = new List<State__c>();
            //Here we are using Aggregate to get Id,total distrcits and name 
            AggregateResult[] aggregateResult = [SELECT Count(Id) Total_Districts__c, Count(Name) , State__c FROM District__c  GROUP BY State__c];
            //Create a new Map of Id State and fill the Id ,Name and total district from setOfData
            Map<Id,State__c > newmap = new  Map<Id,State__c >([SELECT Id, Name,Total_Districts__c FROM State__c WHERE Id IN: setOfData]);
            system.debug('aggregateResult' + aggregateResult);
            
            
            for(AggregateResult ar : aggregateResult){
                Id stateIds = (Id)ar.get('State__c');
                
                if(newmap.containsKey(stateIds)){
                    newmap.get(stateIds).Id = stateIds;
                    newmap.get(stateIds).Total_Districts__c = (Integer)ar.get('Total_Districts__c');
                }
            }
            update newmap.values();
            system.debug('newmap' + newmap);
            
            Map<Id, Country__c> mapOfData = new Map<Id, Country__c>([SELECT Id, Name,CountryCode__c,Total_District__c,Total_States__c,(SELECT Id, Total_Districts__c  FROM States__r) FROM Country__c]); 
            for (AggregateResult country : [SELECT Count(Id) Total_States__c , Sum(Total_Districts__c) Total_Districts__c , Country__c FROM State__c  GROUP BY Country__c])
            {
                Id countryId = (Id)country.get('Country__c');
                for(Country__c con : mapOfData.values()){
                    if(countryId == con.Id){
                        con.Id = countryId;
                        con.Total_District__c = (Decimal)country.get('Total_Districts__c');
                        jsonUpdate(con.Name,(Integer)con.CountryCode__c);
                    }
                }
            }
            update mapOfData.values();
            system.debug('mapOfData' + mapOfData);
        }
        catch(DmlException e)
        {
            system.debug('An unexpected error has occurred: ' + e.getMessage());
        }
    }   
    //Create a method to update json data 
    public static void jsonUpdate(String countryName,Integer countryCode){
        try{
            CountryStateDataMapProcess processOfMap = new CountryStateDataMapProcess();
            processOfMap.CountryStateJSonGenerator(countryName,countryCode);                
        }
        catch(DmlException e)
        {
            system.debug('An unexpected error has occurred: ' + e.getMessage());
        }
    }
}