@isTest
public class DataFactory {
    
    //Build Test Pricebook
    public static Pricebook2 buildTestPricebook(integer i) {
        Pricebook2 testPricebook = new Pricebook2(
            Description = 'Pricebook Description ' + i,
            Name = 'Pricebook ' + i,
            isActive = true
      	);
        
        return testPricebook;
    }
    
    public static Product2 buildTestProduct(Integer i) {
        Product2 testProduct = new Product2(
            Name = 'Test Product ' + i,
            ProductCode = 'Test Code ' + i,
            Product_Type__c = 'Test',
            IsActive = true
        );
        
        return testProduct;
    }
    
    //Build Pricebook Entry
    public static PricebookEntry buildTestPricebookEntry(integer i, Id pricebookId, Id productId) {
        PricebookEntry testPricebookEntry = new PricebookEntry(
            UnitPrice = 10,
            Pricebook2Id = pricebookId,
            Product2Id = productId,
            UseStandardPrice = false
      	);
        
        return testPricebookEntry;
    }
    
    //Build Test Account
    public static Account buildTestAccount(integer i) {
        Account testAccount = new Account(
            Type = 'Test',
            Segment__c = 'Test',
            Region__c = 'Test',
            BillingStreet = 'Test',
            BillingCity = 'Test',
            BillingState = 'Test',
            BillingPostalCode = 'Test',
            BillingCountry = 'Test',
        	Name = 'Test Account ' + i,
          	AccountNumber = 'TestAcct' + i
        );
        
        return testAccount;
    }
    
    //Build test Opportunity
    public static Opportunity buildTestOpportunity(integer i, Id accountId, id PriceBookId) {
        Opportunity testOpp = new Opportunity(
	        AccountId = accountId,
	        Name = 'Test Opportunity ' + i,
	        Amount = 20000,
	        StageName = 'Test',
	        Type = 'Test Opportunity',
	        CloseDate = date.today(),
          	CurrencyISOCode = 'USD',
            PriceBook2Id = PriceBookId
      );
      
      return testOpp;
    }
    
    //Build test Opportunity line item
    public static OpportunityLineItem buildTestOpportunityLineItem(Integer i, Id oppId, Id pricebookentryId) {
        OpportunityLineItem oli = new OpportunityLineItem(
            OpportunityId = oppId,
            Quantity = i,
            TotalPrice = 20000,
            PricebookEntryId = pricebookentryId
    	);
        
        return oli;
    }
}