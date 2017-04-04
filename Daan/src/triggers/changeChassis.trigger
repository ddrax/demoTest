trigger changeChassis on Car__c (before insert) {
String oldChassis = '';
    String prefix = 'chassisNr#';
    
    for(Car__c c:Trigger.New)
    {
       oldChassis = c.Chassis__c;
       c.Chassis__c = prefix + oldChassis; 
        
    }
    
    
}