public with sharing class HelloWorldCarClass {
   
   public static void helloWorld(List<Car__c>cars)
   {
   		for(Car__c c: cars)
   		{
   		 if(c.Hello__c != 'World')
   		 {
   		 	c.Hello__c = 'World';
   		 }
   		}
   }
}