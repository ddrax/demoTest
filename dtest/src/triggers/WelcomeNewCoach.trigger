trigger WelcomeNewCoach on Coach__c (after insert, after update) {
    List<CollaborationGroup> crossfitGroup = [Select id from CollaborationGroup WHERE name='Crossfit' LIMIT 1]; 
    List<FeedItem> feedsToPost = new List<FeedItem>();
    
    for(Coach__c coach:Trigger.New)
    {
     if(Trigger.isInsert)
    {
     feedsToPost.add(new FeedItem(parentId=crossfitGroup[0].Id,body='Please welcome our new coach:  ' + coach.Name +' in domain:' + coach.Domain__c, linkURL='/'+coach.Id));
     
     
    }
    
    }
   
   if(feedsToPost.size() > 0)
   {
    Database.insert(feedsToPost); 
   }
   
    
}