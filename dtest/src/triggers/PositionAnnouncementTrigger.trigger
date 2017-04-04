trigger PositionAnnouncementTrigger on Position__c (after insert, after update) {
    	List <CollaborationGroup> allUserGroup = [SELECT ID FROM CollaborationGroup];
        List<FeedItem> itemsToPost = new List<FeedItem>();
    for(Position__c position:Trigger.new)
    {
    if ((Trigger.isInsert 
			|| position.status__c!= Trigger.oldMap.get(position.id).status__c)
	  	  && position.status__c =='Open') {
 	
	 itemsToPost.add(new FeedItem(parentId=allUserGroup[0].id, body='Recommend someone for this position' + position.Name, linkURL='/' + position.id));
	 
		
			
	}
    
    }
	if (allUserGroup.size() > 0) {
			Database.insert(itemsToPost);
		}	  		
    
}