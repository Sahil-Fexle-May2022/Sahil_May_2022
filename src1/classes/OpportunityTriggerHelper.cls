public class OpportunityTriggerHelper {
    static final String CONST_AUTOMOBILE_SENSOR = '00:11:CE:00';
    static final String CONST_AUTOMOBILE_PRESENSE_SENSOR  = '00:11:CE:D';
    static final String CONST_AUTOMOBILE_TAG = '00:11:CE:E';
    static final String CONST_AUTOMOBILE_TDU = '222-abc-xxx';
    
    public static Set<String> autoSensorsRecords = new Set<String>();
    public static List<String> listOfSensors = new List<String>();
    //In this method we are performing after insertion in Automobile sensor,Automobile presence sensor,Automobile Tdu and Automoble tag
    public static void insertingAutomobileRecord(List<Opportunity> newListOpp, Map<Id, Opportunity> oldMapOpp){
        try{
            Map<String, Automobile_Sensor__c> autoSensorMap = new Map<String, Automobile_Sensor__c>();
            Map<String, Automobile_Presence_Sensor__c> autoPresenseMap = new Map<String, Automobile_Presence_Sensor__c>();
            Map<String, Automobile_TDU__c> autoTDUMap = new Map<String, Automobile_TDU__c>();
            Map<String, Automobile_Tag__c> autoTagMap = new Map<String, Automobile_Tag__c>();                
            
            Map<String, List<String>> mapOfOppIdWithAutomobileTagDetails = new  Map<String,List<String>>();
            
            for(Opportunity opp : newListOpp){
                
                // Checking the condition
                Opportunity oldOpp = new Opportunity(); 
                if(oldMapOpp != null){
                    oldOpp = oldMapOpp.get(Opp.Id);
                }
                //Here we checking the condition if stage is this and installation account and Automobile tag deatils 1,2,3 and return to hq is not null            
                if((((opp.StageName == 'Shipped To Customer' || opp.StageName == 'Return To HQ' || opp.StageName == 'Return To Customer')
                     && opp.Installation_Account__c != null &&(opp.Automobile_Tag_Details_1__c != null || opp.Automobile_Tag_Details_2__c != null
                                                               || opp.Automobile_Tag_Details_3__c != null || opp.Return_To_HQ__c != null ))))             
                    
                {                 
                    //Here we are check if mapOfOppIdWithAutomobileTagDetails not contains opportunity id and installation then put the opportunity id and installion account id and  in map
                    //and also check if automobile tag details  1,2,3 and return to hq is not null then get the opportunity id and installion id from map and add in related feilds and also add in  listofSensors and autoSensorsRecords         
                    if(!mapOfOppIdWithAutomobileTagDetails.containsKey(opp.Id  + '-' + opp.Installation_Account__c)){
                        mapOfOppIdWithAutomobileTagDetails.put(opp.Id + '-' + opp.Installation_Account__c, new List<String>());
                    }
                    if(opp.Automobile_Tag_Details_1__c !=null){
                        mapOfOppIdWithAutomobileTagDetails.get(opp.Id +'-' + opp.Installation_Account__c).addAll(opp.Automobile_Tag_Details_1__c.split('\n'));
                        listOfSensors.addAll(opp.Automobile_Tag_Details_1__c.split('\n'));
                    }
                    if(opp.Automobile_Tag_Details_2__c !=null){
                        mapOfOppIdWithAutomobileTagDetails.get(opp.Id + '-' + opp.Installation_Account__c).addAll(opp.Automobile_Tag_Details_2__c.split('\n'));
                        listOfSensors.addAll(opp.Automobile_Tag_Details_2__c.split('\n'));
                    }
                    if(opp.Automobile_Tag_Details_3__c !=null){
                        mapOfOppIdWithAutomobileTagDetails.get(opp.Id + '-' + opp.Installation_Account__c).addAll(opp.Automobile_Tag_Details_3__c.split('\n'));
                        listOfSensors.addAll(opp.Automobile_Tag_Details_3__c.split('\n'));
                    }
                    if(opp.Return_To_HQ__c !=null){
                        mapOfOppIdWithAutomobileTagDetails.get(opp.Id + '-' + opp.Installation_Account__c).addAll(opp.Return_To_HQ__c.split('\n'));
                        listOfSensors.addAll(opp.Return_To_HQ__c.split('\n'));
                    }
                    autoSensorsRecords.addAll(listOfSensors);
                }                         
            }        
            if(mapOfOppIdWithAutomobileTagDetails !=null){
                for(String ids : mapOfOppIdWithAutomobileTagDetails.keySet()){
                    for(String oppNew :mapOfOppIdWithAutomobileTagDetails.get(Ids)){
                        
                        List<String> listOfids = new List<String>(ids.split('-'));
                        
                        // For Automobile sensor record                                      
                        if(oppNew.startsWith(CONST_AUTOMOBILE_SENSOR)){
                            Automobile_Sensor__c newSensorRecord = new Automobile_Sensor__c();
                            if(oppNew.length()>18){
                                newSensorRecord.Name = oppNew.substring(0, 18);
                            }
                            else{
                                newSensorRecord.Name = oppNew;
                            }                 
                            newSensorRecord.Account__c = listOfids[1];
                            newSensorRecord.Opportunity__c = listOfids[0];
                            
                            if(!autoSensorMap.ContainsKey(oppNew)){
                                autoSensorMap.put(oppNew, newSensorRecord);
                            }                                                                
                        }
                        // For Automobile presence sensor record
                        if(oppNew.startsWith(CONST_AUTOMOBILE_PRESENSE_SENSOR)){
                            Automobile_Presence_Sensor__c newPresenceRecord = new Automobile_Presence_Sensor__c();
                            if(oppNew.length()>18){
                                newPresenceRecord.Name = oppNew.substring(0, 18);
                            }
                            else{
                                newPresenceRecord.Name = oppNew;
                            }
                            newPresenceRecord.Account__c = listOfids[1];
                            newPresenceRecord.Opportunity__c = listOfids[0];
                            
                            if(!autoPresenseMap.ContainsKey(oppNew)){
                                autoPresenseMap.put(oppNew, newPresenceRecord);
                            }                              
                        }
                        // For Automobile Tag Record                       
                        if(oppNew.startsWith(CONST_AUTOMOBILE_TAG)){
                            Automobile_Tag__c newTagRecord = new Automobile_Tag__c();
                            if(oppNew.length()>18){
                                newTagRecord.Name = oppNew.substring(0, 18);
                            }
                            else{
                                newTagRecord.Name = oppNew;
                            }
                            newTagRecord.Account__c = listOfids[1];
                            newTagRecord.Opportunity__c = listOfids[0];
                            
                            if(!autoTagMap.ContainsKey(oppNew)){
                                autoTagMap.put(oppNew, newTagRecord);
                            }   
                            
                        }
                        // For Automobile TDU Record                    
                        if(oppNew.substring(0, 3).isNumeric()){
                            Automobile_TDU__c newTduRecord = new Automobile_TDU__c();
                            if(oppNew.length()>18){
                                newTduRecord.Name = oppNew.substring(0, 18);
                            }
                            else{
                                newTduRecord.Name = oppNew;
                            }
                            newTduRecord.Account__c = listOfids[1];
                            newTduRecord.Opportunity__c = listOfids[0];
                            
                            if(!autoTDUMap.ContainsKey(oppNew)){
                                autoTDUMap.put(oppNew, newTduRecord);
                            }                               
                        }
                    }
                }                      
            }                                                                                                       
            //Here we are checking the condition and perfrom DML Operation in all Sensors
            if(!autoSensorMap.values().isEmpty()){
                insert autoSensorMap.values();   
            }
            if(!autoPresenseMap.values().isEmpty()){
                insert autoPresenseMap.values();
            } 
            if(!autoTDUMap.values().isEmpty()){
                insert autoTDUMap.values();
            } 
            if(!autoTagMap.values().isEmpty()){
                insert autoTagMap.values();
            }  
        }
        catch(DmlException e)
        {
            system.debug('An unexpected error has occurred: ' + e.getMessage());
        }
    }
    //In this methods we are update records in Shipment Account from Installation Account if stage is changed shipped to customer to retrun to hq
    public static void updateRecords(List<Opportunity> newList, Map<Id,Opportunity> oldMap){
        try{
            List<Opportunity> listOfOpportunity = new List<Opportunity>();
            
            for(Opportunity opp : newList){
                if(oldMap == null || (oldMap != null && (opp.Automobile_Tag_Details_1__c != oldMap.get(opp.Id).Automobile_Tag_Details_1__c || opp.Automobile_Tag_Details_2__c != oldMap.get(opp.Id).Automobile_Tag_Details_2__c || opp.Automobile_Tag_Details_3__c != oldMap.get(opp.Id).Automobile_Tag_Details_3__c || opp.Return_To_HQ__c !=  oldMap.get(opp.Id).Return_To_HQ__c  || opp.StageName != oldMap.get(opp.Id).StageName || opp.Shipment_Account__c != oldMap.get(opp.Id).Shipment_Account__c)))
                {
                    listOfOpportunity.add(opp);
                }
            }
            //This map is used for get oldId records of automobile sensor,automobile presence sensor,automobille Tdu and Automobile tag
            if(listOfOpportunity.size() > 0){
                Map<String, Automobile_Sensor__c> autoSensorMap = new Map<String, Automobile_Sensor__c>();
                Map<String, Automobile_Presence_Sensor__c> autoPresenseMap = new Map<String, Automobile_Presence_Sensor__c>();
                Map<String, Automobile_Tag__c> autoTagMap = new Map<String, Automobile_Tag__c>();
                Map<String, Automobile_TDU__c> autoTDUMap = new Map<String, Automobile_TDU__c>();
                
                //query through list to get all Old records of automobile sensor,automobile presence sensor,automobille Tdu and Automobile tag
                List<Automobile_Sensor__c> autoSensorList = [SELECT Id, Name, Opportunity__c, Account__c,Opportunity__r.Id FROM Automobile_Sensor__c];
                List<Automobile_Presence_Sensor__c> autoPresenceSensorList = [SELECT Id, Name, Opportunity__c, Account__c,Opportunity__r.Id FROM Automobile_Presence_Sensor__c];
                List<Automobile_Tag__c> autoTagSensorList = [SELECT Id, Name, Opportunity__c, Account__c,Opportunity__r.Id FROM Automobile_Tag__c];
                List<Automobile_TDU__c> autoTduSensorList = [SELECT Id, Name, Opportunity__c, Account__c,Opportunity__r.Id FROM Automobile_TDU__c];
                
                //This map is use for store the new Values of all records of automobile sensor,automobile presence sensor,automobille Tdu and Automobile tag
                Map<String, Automobile_Sensor__c> newMapOfAutombileSensor = new Map<String, Automobile_Sensor__c>();
                Map<String, Automobile_Presence_Sensor__c> newMapOfAutomobilePresenceSensor = new Map<String, Automobile_Presence_Sensor__c>();
                Map<String, Automobile_Tag__c> newMapOfAutomobileTagSensor = new Map<String, Automobile_Tag__c>();
                Map<String, Automobile_TDU__c> newMapOfAutomobileTduSensor = new Map<String, Automobile_TDU__c>();
                
                for(Automobile_Sensor__c ab : autoSensorList){
                    newMapOfAutombileSensor.put(ab.Opportunity__r.Id + ab.Name,ab);
                }
                for(Automobile_Presence_Sensor__c cd : autoPresenceSensorList){
                    newMapOfAutomobilePresenceSensor.put(cd.Opportunity__r.Id + cd.Name,cd);
                }
                for(Automobile_Tag__c de : autoTagSensorList){
                    newMapOfAutomobileTagSensor.put(de.Opportunity__r.Id + de.Name,de);
                }
                for(Automobile_TDU__c xy : autoTduSensorList){
                    newMapOfAutomobileTduSensor.put(xy.Opportunity__r.Id + xy.Name,xy);
                }
                
                for(Opportunity opp : listOfOpportunity){
                    
                    List<String> sensorList = new List<String>();
                    
                    if(opp.Return_To_HQ__c != null){
                        sensorList.add(opp.Return_To_HQ__c.trim() + '\n');
                    }
                    //If Automobile records is not contains then we will update record in automobile sensor,presence sensor,tag sensor,TDU sensor
                    for(String sL : sensorList){
                        for(String s : sL.split('\n')){
                            if(!autoSensorMap.containsKey(opp.Id + s.trim())){
                                autoSensorMap.put(opp.Id + s.trim(), new Automobile_Sensor__c(Name = s.trim(), Account__c = opp.AccountId, Opportunity__c = opp.Id));
                                system.debug(s.trim());
                            }
                            if(!autoPresenseMap.containsKey(opp.Id + s.trim())){
                                autoPresenseMap.put(opp.Id + s.trim(), new Automobile_Presence_Sensor__c(Name = s.trim(), Account__c = opp.AccountId, Opportunity__c = opp.Id));
                            }
                            if(!autoTDUMap.containsKey(opp.Id + s.trim())){
                                autoTDUMap.put(opp.Id + s.trim(), new Automobile_TDU__c(Name = s.trim(), Account__c = opp.AccountId, Opportunity__c = opp.Id));
                            }
                            if(!autoTagMap.containsKey(opp.Id + s.trim())){
                                autoTagMap.put(opp.Id + s.trim(), new Automobile_Tag__c(Name = s.trim(), Account__c = opp.AccountId, Opportunity__c = opp.Id));
                            }
                        }
                    }
                    for(Automobile_Sensor__c automobSensor : newMapOfAutombileSensor.values()){
                        if(autoSensorMap.containsKey(opp.Id + automobSensor.Name) && opp.StageName == 'Return To HQ'){
                            newMapOfAutombileSensor.get(opp.Id + automobSensor.Name).Account__c = opp.Shipment_Account__c;                        
                        }
                        else if(autoSensorMap.containsKey(opp.Id + automobSensor.Name) && opp.StageName == 'Return To Customer'){
                            newMapOfAutombileSensor.get(opp.Id + automobSensor.Name).Account__c = opp.AccountId;
                        }
                    }
                    for(Automobile_Presence_Sensor__c automobPresence : newMapOfAutomobilePresenceSensor.values()){
                        if(newMapOfAutomobilePresenceSensor.containsKey(opp.Id + automobPresence.Name)){
                            newMapOfAutomobilePresenceSensor.get(opp.Id + automobPresence.Name).Account__c = opp.Shipment_Account__c;
                        }
                        else if(autoPresenseMap.containsKey(opp.Id + automobPresence.Name) && opp.StageName == 'Return To Customer'){
                            newMapOfAutomobilePresenceSensor.get(opp.Id + automobPresence.Name).Account__c = opp.AccountId;
                        }
                    }
                    for(Automobile_Tag__c automobTag :  newMapOfAutomobileTagSensor.values()){
                        if(newMapOfAutomobileTagSensor.containsKey(opp.Id + automobTag.Name)){
                            newMapOfAutomobileTagSensor.get(opp.Id + automobTag.Name).Account__c = opp.Shipment_Account__c;
                        }
                        else if(autoTagMap.containsKey(opp.Id + automobTag.Name) && opp.StageName == 'Return To Customer'){
                            newMapOfAutomobileTagSensor.get(opp.Id + automobTag.Name).Account__c = opp.AccountId;
                        }
                    }
                    for(Automobile_TDU__c automobTDU : newMapOfAutomobileTduSensor.values()){
                        if(newMapOfAutomobileTduSensor.containsKey(opp.Id + automobTDU.Name)){
                            newMapOfAutomobileTduSensor.get(opp.Id + automobTDU.Name).Account__c = opp.Shipment_Account__c;
                        }
                        else if(autoTDUMap.containsKey(opp.Id + automobTDU.Name) && opp.StageName == 'Return To Customer'){
                            newMapOfAutomobileTduSensor.get(opp.Id + automobTDU.Name).Account__c = opp.AccountId;
                        }
                    }
                }           
                //Here we are checking the condition and perfrom DML Operation in all Sensors
                if(newMapOfAutombileSensor.size() > 0){
                    update newMapOfAutombileSensor.values();
                }            
                if(newMapOfAutomobilePresenceSensor.size() > 0){
                    update newMapOfAutomobilePresenceSensor.values();
                }           
                if(newMapOfAutomobileTagSensor.size() > 0){
                    update newMapOfAutomobileTagSensor.values();
                }            
                if(newMapOfAutomobileTduSensor.size() > 0){
                    update newMapOfAutomobileTduSensor.values();
                }
            }
        }
        catch(DmlException e)
        {
            system.debug('An unexpected error has occurred: ' + e.getMessage());
        }
    }
    //in This method we can send email to all records
    public static void sendRecordEmails(List<Opportunity> newList){
        try{
            List<String> emailList = new List<String>();
            List<Messaging.SingleEmailMessage> messages = new List<Messaging.SingleEmailMessage>();
            Set<String> noSenSet = new Set<String>();
            for(Opportunity opp : newList) {
                String oppOwner = opp.OwnerId;
                String oppName = opp.Name;
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                mail.setToAddresses(new List<String>{opp.Email__c});
                mail.setSubject(oppName + ' ' + 'Date: '+ Date.today());
                String htmlBody = '';
                htmlBody = '<table border="1" cellpadding="0" style="border-collapse: collapse"><caption>Successful: Summary Data</caption><tr><th>Automobile Type</th><th>Name</th><th>Message</th></tr>';
                
                for(String str : autoSensorsRecords) {
                    if(str.startsWith(CONST_AUTOMOBILE_SENSOR)) {
                        htmlBody+= '<tr><td border:"1px solid black">' + 'Sensor ' +'</td><td> '+str+' </td><td>'+'Sensor inserted under installation account id: '+ opp.AccountId +'</td></tr>';
                    }
                    else if(str.startsWith(CONST_AUTOMOBILE_PRESENSE_SENSOR)) {
                        htmlBody+= '<tr><td border:"1px solid black>' + 'Presence Sensor ' +'</td><td> '+str+' </td><td>'+'Sensor inserted under installation account id: '+ opp.AccountId +'</td></tr>';
                    }
                    else if(str.startsWith(CONST_AUTOMOBILE_TAG)) {
                        htmlBody+= '<tr><td border:"1px solid black>' + 'Tag Sensor ' +'</td><td> '+str+' </td><td>'+'Sensor inserted under installation account id: '+ opp.AccountId +'</td></tr>';
                    }
                    else if(str.substring(0,3).isNumeric()) {
                        htmlBody+= '<tr><td border:"1px solid black>' + 'TDU Sensor ' +'</td><td> '+str+' </td><td>'+'Sensor inserted under installation account id: '+ opp.AccountId +'</td></tr>';
                    }
                    else{
                        noSenSet.add(str);
                    }
                }
                htmlBody += '</table>';
                system.debug('Email Body: ' + htmlBody);
                
                String htmlBody2 = '';
                htmlBody2 = '<table border="1" cellpadding="1" cellspacing="1" style="border-collapse: collapse"><caption>Unsuccessful: Summary Data</caption><tr><th>Automobile Type</th><th>Name</th><th>Message</th></tr>';
                
                for(String str : noSenSet) {
                    htmlBody2+= '<tr><td>' + 'Sensor ' +'</td><td> '+str+' </td><td> Invalid sensor </td></tr>';
                }
                htmlBody2 += '</table>';
                mail.setHTMLbody(htmlBody + htmlBody2);
                String emailAddress = opp.Email__c;
                System.debug('Email Send Successfully at: ' + emailAddress);
                messages.add(mail);
            }
            Messaging.SendEmailResult[] results = Messaging.sendEmail(  messages );
        }
        catch(DmlException e)
        {
            system.debug('An unexpected error has occurred: ' + e.getMessage());
        }
    }
}