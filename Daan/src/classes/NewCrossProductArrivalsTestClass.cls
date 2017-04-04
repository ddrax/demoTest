@isTest(SeeAllData=true)
public with sharing class NewCrossProductArrivalsTestClass {
      static testmethod void verifyNewArrivalFeedPost()
    {
      Integer startCountPosts = [Select count() FROM CollaborationGroupFeed WHERE parentId in (Select id FROM CollaborationGroup WHERE Name='Crossfit')];
      List<Ghd__c> arrivals = new List<Ghd__c>();
      
      System.debug('At the beginning of the test we have this amount of posts in the Crossfit group:' + startCountPosts); 
      
      arrivals.add(new Ghd__c(name='EU edition 2017',Status__c='Arrived'));
      
      Database.insert(arrivals);
      
      Integer endCountPosts = [Select count() FROM CollaborationGroupFeed WHERE parentId in (Select id FROM CollaborationGroup WHERE Name='Crossfit')];
      
      System.debug('At the end of the test we have this amount of posts in the Crossfit group:' + startCountPosts); 
      System.assertEquals(startCountPosts+1,endCountPosts);
      
      
    }
}