# challenge

The prevent Opportunity deletion logic is called in the OpportunityUtility.trigger in the before deletion context.

The logic is built within the OpportunitUtility.cls

There is a test class that asserts the error message when an Opportunity of Closed Won with line items is deleted. This test method calls a data factory which is used to create test data.