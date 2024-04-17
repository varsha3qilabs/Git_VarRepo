Feature: This feature file tests the collection from deleteAccount in the Awetest Service Test engine

 Background:
 * I read the data from the "deleteAccount" collection of "Accounts"
 
 @FF5-001 @Accounts 
 Scenario: Delete Account. End pt.: deleteAccount,
 * execute "deleteAccount" deleteAccount DELETE Request and verify 204 Response Code 

  @FF5-002 @Accounts 
 Scenario:delete an account. End pt.: DelAcc1,
 * execute "FF5-002" deleteAccount DELETE Request and verify 204 Response Code 

  @FF5-003 @Accounts 
 Scenario:invalid, delete an deleted account. End pt.: DelAcc2,
 * execute "FF5-003" deleteAccount DELETE Request and verify 404 Response Code 
