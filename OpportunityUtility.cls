public class OpportunityUtility {
    
    //Method to prevent Opportunity deletion if Opportunity is Closed Won and there are line items on the Opportunity
    public static void preventOppDeletion(List<Opportunity> oppList, Map<Id, Opportunity> oppOldMap) {
        
        //Query StageName and line items on Opportunity being deleted
        for(Opportunity opp : [SELECT Id, StageName, (SELECT Id FROM OpportunityLineItems) FROM Opportunity WHERE Id IN : oppList]) {
            
            //Check to make sure Opportunity meets criteria for error message
            if(opp.StageName == 'Closed Won' && opp.OpportunityLineItems.size() > 0) {
                
                //Throw error message on Opportunity
                oppOldMap.get(opp.Id).addError('You cannot delete an Opportunity that is "Closed Won" and has related Opportunity Line Items');
            } 
        }
    }
}