trigger HelloWorldTriggerCars on Car__c (before insert, before update) {
    List<Car__c>cars = Trigger.New; 
    
    HelloWorldCarClass.helloWorld(cars);
    
    
}