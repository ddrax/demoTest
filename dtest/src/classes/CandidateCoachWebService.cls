global class CandidateCoachWebService {
	
 webService static void submitCoachReferral(string name,string domain){
		
	Coach__c c = new Coach__c(); 
				c.Name = name;
				c.Domain__c = domain;
		
    insert c;
   
 }
    
}