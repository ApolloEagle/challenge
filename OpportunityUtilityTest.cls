@isTest
private class OpportunityUtilityTest {
    @isTest static void testPreventOppDeletionError() {
        Integer i = 1;
        
        //Insert test pricebook
        Pricebook2 pb = DataFactory.buildTestPricebook(i);
        insert pb;
        
        //Insert test product
        Product2 prod = DataFactory.buildTestProduct(i);
        insert prod;
        
        //Insert test pricebook entry
        PricebookEntry pbe = DataFactory.buildTestPricebookEntry(i, pb.Id, prod.Id);
        insert pbe;
        
        //Insert test account
        Account acct = DataFactory.buildTestAccount(i);
        insert acct;
        
        //Insert test Opportunity
        Opportunity opp = DataFactory.buildTestOpportunity(i, acct.Id, pb.Id);
        insert opp;
        
        //Insert test Opportunity line item
        OpportunityLineItem oli = DataFactory.buildTestOpportunityLineItem(i, opp.Id, pbe.Id);
        insert oli;
        
        try{
            opp.StageName = 'Closed Won';
            update opp;
            delete opp;
        }
        catch(Exception e){
            Boolean expectedExceptionThrown =  e.getMessage().contains('You cannot delete an Opportunity that is "Closed Won" and has related Opportunity Line Items') ? true : false;   
            System.AssertEquals(expectedExceptionThrown, true);
        } 
    } 
}