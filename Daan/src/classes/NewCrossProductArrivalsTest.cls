@isTest(SeeAllData=true)
public with sharing class NewCrossProductArrivalsTest {
    
    static testmethod void verifyNewArrivalFeedPost()
    {
      Integer startCountPosts = [Select count() FROM CollaborationGroupFeed WHERE parentId in (Select id FROM CollaborationGroup WHERE Name='Crossfit')];
      List<Ghd__c> arrivals = new List<Ghd__c>();
      
      System.debug('At the beginning of the test we have this amount of posts in the Crossfit group:' + startCountPosts); 
      
      arrivals.add(new Ghd__c(name='EU edition 2017',Status__c='Ordered'));
      
      
      Database.insert(arrivals);
      
      for(Ghd__c g : arrivals)
      {
       if(g.Status__c == 'Ordered')
       {
        g.Status__c = 'Arrived';
        Database.update(arrivals);
       }
       
      }
      
      
      Integer endCountPosts = [Select count() FROM CollaborationGroupFeed WHERE parentId in (Select id FROM CollaborationGroup WHERE Name='Crossfit')];
      
      System.debug('At the end of the test we have this amount of posts in the Crossfit group:' + endCountPosts); 
      System.assertEquals(startCountPosts+1,endCountPosts);
    }
    
    static testmethod void verifyNotNewArrivalFeedPost()
    {
       Integer startCountPosts = [Select count() FROM CollaborationGroupFeed WHERE parentId in (Select id FROM CollaborationGroup WHERE Name='Crossfit')];
      List<Ghd__c> arrivals = new List<Ghd__c>();
      
      System.debug('At the beginning of the test we have this amount of posts in the Crossfit group:' + startCountPosts); 
      
      arrivals.add(new Ghd__c(name='EU edition 2017 ext',Status__c='Ordered'));
      
      
      Database.insert(arrivals);
      
      
      
      Integer endCountPosts = [Select count() FROM CollaborationGroupFeed WHERE parentId in (Select id FROM CollaborationGroup WHERE Name='Crossfit')];
      
      System.debug('At the end of the test we have this amount of posts in the Crossfit group:' + endCountPosts); 
      System.assertEquals(startCountPosts,endCountPosts);
    }
    
}