public with sharing class CoachCreateController {
 
  public Coach__c coach {
    get {
      if (coach == null)
        coach = new Coach__c();
      return coach;
    }
    set;
  }
 
 public pagereference save()
 {
 	// first we check to see if we'll need to create a candidate or not
		boolean cCreate = true; // default to true
		if (coach.Name!= null){
			String uKey = coach.Name.toLowerCase()+ coach.Domain__c.toLowerCase();
			// query to find dupes
			if ([select count() from Coach__c where unique_key__c = :uKey] >= 1) {
				cCreate=false;
				
			}
		}
		
		// create a boolean to catch any errors in case we need to rollback
		boolean err = false;
		
		// create the candidate if necessary based off previous check
		if (cCreate){
			try{
				Coach__c c = new Coach__c(); 
				c.Name = coach.name;
				c.Domain__c = coach.domain__c;
				
				insert c;
					
			} catch (System.DmlException e) {
				//update our err flag
				err = true;
				System.debug('error bulk inserting new candidate record');
				for (Integer k = 0; k < e.getNumDml(); k++) {
					
				
					
					// Process exception here
					System.debug(e.getDmlMessage(k));
				}
				
			}
		}else{
		Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.ERROR, 'This Coach record already exists...')); //FATAL, WARNING, INFO, CONFIRM
			
		}
		
		
		
		
 	return null;
 }
 
    
}