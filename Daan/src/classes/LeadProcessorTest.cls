@isTest
private class LeadProcessorTest {
    
    @testSetup 
    static void setup()
    {
    	List<Lead>nLeads = new List<Lead>();
     for(Integer i=0; i<200;i++)
     {
      Lead a = new Lead(FirstName='abc'+i,LastName='blabla'+i,Company='testje'+i,FirstContact__c='Beurs',Beurs__c='Turkije beurs');
      nLeads.add(a);
     }
     
     insert nLeads;
    
    }
    
    static testmethod void start()
    {
     Test.startTest(); 
     LeadProcessor lp = new LeadProcessor(); 
     Id batchId = Database.executeBatch(lp); 
     Test.StopTest();
     
     Integer updLeads = [SELECT count() from Lead WHERE LeadSource = 'Dreamforce'];
     
     System.debug('changed leads:' + updLeads);
     System.assertEquals(200,updLeads);
     
     
    }
    
    
}