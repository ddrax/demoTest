trigger testje on Account (before insert) {

    for(Account ac : Trigger.New)
    {
        ac.Description = 'testjeeee';
        
        
    }
    
}