trigger OpportunityUtility on Opportunity (before delete) {
    
    //Check if we are deleting the record
    if(Trigger.isDelete) {
        
        //Method being called by trigger in before deletion context
        OpportunityUtility.preventOppDeletion(Trigger.old, Trigger.oldMap);
    }
}