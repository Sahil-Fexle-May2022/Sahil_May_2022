public with sharing class MapOfCountryStateAndDistrict{  

    public static void insertDataValues(){
        Map<String, Map<String, Map<String, List<String>>>> mapOfCountry = new Map<String, Map<String, Map<String,List<String>>>>();
       
        //Create List of District with State Of India
        List<String> biharDistrict = new List<String>{'Patna','Nalanda','Motihari'};
        List<String> rajasthanDistrict = new List<String>{'Ajmer','Alwar','Bundi'};
        List<String> gujaratDistrict = new List<String>{'Ahmedabad','Bharuch','Gandhinagar'};

        //Create List of District with State Of Bangladesh
        List<String> dhakaDistrict = new List<String>{'Tangail','Faridpur','Rajbari'};
        List<String> rajshalDistrict = new List<String>{'Pabna','Bogra','Rajshahi'};
        List<String> barishalDistrict = new List<String>{'Bhola','Jhalokati','Patuakhali'};

        //Create List of District with State Of America
        List<String> texasDistrict = new List<String>{'Houston','Dallas','Austin'};
        List<String> floridaDistrict = new List<String>{'Bradford','Brevard','Calhoun'};
        List<String> alaskaDistrict = new List<String>{'Bering','Annette','Chatham'};
        
        // Assigning List of district according to state
        Map<String, List<String>> indiaStateMap = new  Map<String, List<String>>{'Rajasthan' => rajasthanDistrict, 'Bihar' => biharDistrict, 'Gujarat' => gujaratDistrict};
        Map<String, List<String>> bangladeshStateMap = new  Map<String, List<String>>{'Dhaka' => dhakaDistrict, 'Rajshal' => rajshalDistrict, 'Barishal' => barishalDistrict};
        Map<String, List<String>> americaStateMap = new  Map<String, List<String>>{'Texas' => texasDistrict, 'Florida' => floridaDistrict , 'Alaska' => alaskaDistrict};

        // Assigning List of state according to Country
        Map<String, Map<String, List<String>>> indiaMap = new  Map<String,  Map<String, List<String>>>{'India' => indiaStateMap};
        Map<String, Map<String, List<String>>> bangladeshMap = new  Map<String,  Map<String, List<String>>>{'Bangladesh' => bangladeshStateMap};
        Map<String, Map<String, List<String>>> americaMap = new  Map<String,  Map<String, List<String>>>{'America' => americaStateMap};

        // Assigning List of Country Code
        // mapCountryCode = new Map<Integer, Map<String, Map<String, List<String>>>>{91 => IndiaMap, 880 => BangladeshMap, 1 => AmericaMap};
        mapOfCountry.put('91',indiaMap);
        mapOfCountry.put('880',bangladeshMap);
        mapOfCountry.put('1',americaMap);
        
        // Find The Combination Of Country State and District
        for(String countryCode : mapOfCountry.keySet()){
        //Get Country Name   
            Map<String,Map<String,List<String>>> countriesName = mapOfCountry.get(countryCode); 

            for(String country : countriesName.keySet()){
            
                if(country.startsWith('B')){
                //Get State Name   
                   Map<String,List<String>> stateNames = countriesName.get(country);
                    
                    for(String state : stateNames.keySet()){
                                                 
                        if(state.startsWith('B')){
                        //Get District Name    
                            List<String> districtList = stateNames.get(state);
                             
                            for(String district : districtList){
                                 
                                if(district.startsWith('B')&&district.length()>=5){
                                    System.debug('Country Name  : ' + country);
                                    System.debug('State Name : ' + state);
                                    System.debug('District Name  : ' + district);
                                }
                            }
                        }
                    }
                }
            }
        }
       
        // Finding  Districts which length is more or equal to some number
        List<String> allDistricts = new List<String>();
        for(String countryCode : mapOfCountry.keySet()){
    
            Map<String,Map<String,List<String>>> countriesName = mapOfCountry.get(countryCode);
            for(String country : countriesName.keySet()){
                // get state map
                Map<String,List<String>> stateNames = countriesName.get(country); 
                for(String state : stateNames.keySet()){
                    // get district name list 
                    List<String> districtList = stateNames.get(state);
                        // add all district in districtList
                        allDistricts.addAll(districtList);
                }
            }
        }

        // get districts from all district list
        for(String districtLength : allDistricts){
            // cheacking district length 
            if(districtLength.length()>=1 && districtLength.length()>=5){
                // print the district  given length
                System.debug('District of Given Length : ' +districtLength);
            }
        }
    }
}