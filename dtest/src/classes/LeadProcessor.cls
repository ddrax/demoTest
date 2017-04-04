global class LeadProcessor implements 
    Database.Batchable<sObject>, Database.Stateful {
    // instance member to retain state across transactions


    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT ID, Name ' +
            ' FROM Lead '+
            'WHERE LeadSource = null' 
        );
    }

    global void execute(Database.BatchableContext bc, List<Lead> scope){
        // process each batch of records
       List<Lead>allLeads = scope; 
        for (Lead lead : allLeads) {
           
           lead.LeadSource = 'Dreamforce';
        }
        update allLeads;
    }    

    global void finish(Database.BatchableContext bc){
   
        Integer updatedLeads = [SELECT count() FROM Lead Where LeadSource ='Dreamforce'];
      System.debug(updatedLeads + ' leads are updated...');
    }    
}