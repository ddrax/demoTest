trigger NewCrossfitProductArrivals on Ghd__c (before update) {
   List<CollaborationGroup> crossfit = [select Id FROM CollaborationGroup Where name = 'Crossfit' LIMIT 1];
   List<FeedItem>itemsToPost = new List<FeedItem>();
   
   
   for(Ghd__c ghd : Trigger.New)
   {
   if(ghd.Status__c == 'Arrived')
    {
    itemsToPost.add(new FeedItem(parentId=crossfit[0].id, 
  	  		     body='New crossfit fun arrived: ' 
  	  		     + ghd.Name, linkURL='/' + ghd.id));
    }
   } 
    if (itemsToPost.size() > 0) {
		Database.insert(itemsToPost);
	}
    
}