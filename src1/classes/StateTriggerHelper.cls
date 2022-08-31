public class StateTriggerHelper {
    //In this we count states on country and also update new records
    public static void countStatesOnCountry(List<State__c> newData, List<State__c> oldData){
        try{
            //Create a list of country
            List<Country__c> countryList = new List<Country__c> ();
            // Set to Hold Records Of Related Records
            Set<Id> setOfData = new Set<Id>();
            //To fill Country Id into addState Set into newData  
            for(State__c state : newData) {
                if(state.Country__c !=null){
                setOfData.add(state.Country__c);
                }                
            } 
            //To fill Country Id into addState Set into oldData
            if(oldData !=null){
                for(State__c st : oldData){
                    if(st.Country__c !=null){
                    setOfData.add(st.Country__c); 
                    }                                   
                }
            }
            system.debug('setOfData' + setOfData);
            //Here we create a newlist to update records on country
            List<Country__c> updateStateList = new List<Country__c>();
            //Here we do query on aggregate result
            AggregateResult[] aggregateResult = [SELECT Count(Id) Total_States__c, Count(Name), Country__c FROM State__c  GROUP BY Country__c];
            Map<Id,Country__c > newmap = new  Map<Id,Country__c >([SELECT Id,Name,CountryCode__c,Total_States__c FROM Country__c WHERE Id IN: setOfData]);
            system.debug('aggregateResult' + aggregateResult);
            
            for(AggregateResult ar : aggregateResult){
                Id countryIds = (Id)ar.get('Country__c');
                for(Country__c con : newmap.values()){
                    if(newmap.containsKey(countryIds)){
                        newmap.get(countryIds).Id = countryIds;
                        newmap.get(countryIds).Total_States__c = (Integer)ar.get('Total_States__c');
                        jsonUpdate(con.Name,(Integer)con.CountryCode__c);
                    }
                }                        
            }
            update newmap.values();
            system.debug('newmap' + newmap);
        }
        catch(DmlException e)
        {
            system.debug('An unexpected error has occurred: ' + e.getMessage());
        }
    }
    //Create a new methods to update json data
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