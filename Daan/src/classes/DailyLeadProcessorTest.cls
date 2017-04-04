@isTest
private class DailyLeadProcessorTest{
    //Seconds Minutes Hours Day_of_month Month Day_of_week optional_year
    public static String CRON_EXP = '0 0 0 2 6 ? 2022';
    
    static testmethod void testScheduledJob(){
        List<Lead> leads = new List<Lead>();
        
        for(Integer i = 0; i < 200; i++){
            Lead lead = new Lead(LastName = 'Test ' + i, LeadSource = '', Company = 'Test Company ' + i, Status = 'Open - Not Contacted',FirstContact__c='Beurs',Beurs__c='Turkije beurs');
            leads.add(lead);
        }
        
        insert leads;
        
        Test.startTest();
        // Schedule the test job
        String jobId = System.schedule('Update LeadSource to DreamForce', CRON_EXP, new DailyLeadProcessor());
        
        // Stopping the test will run the job synchronously
        Test.stopTest();
        
        Integer updLeads = [SELECT count() FROM lead WHERE LeadSource='Dreamforce']; 
        System.debug('updated leads founds: ' + updLeads);
        System.assertEquals(200,updLeads);     
           
    }
}