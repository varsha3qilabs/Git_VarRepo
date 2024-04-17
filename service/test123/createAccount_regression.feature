Feature: This feature file tests the collection from createAccount in the Awetest Service Test engine

 Background:
 * I read the data from the "createAccount" collection of "Accounts"
 
 @FF2-001 @Accounts 
 Scenario: Create a new account using the Create account api on fatfreeCRM application. Use all the valid input params with unique name each time.. End pt.: createAccount,
 * execute "createAccount" createAccount POST Request and verify 201 Response Code 

  @FF2-002 @Accounts 
 Scenario:Negative test scenario with Invalid User ID. End pt.: CA01,
 * execute "FF2-002" createAccount POST Request and verify 201 Response Code 

  @FF2-003 @Accounts 
 Scenario:Test with name of 64 char max. As 64 is max allowed chars for name in this application.. End pt.: CA02,
 * execute "FF2-003" createAccount POST Request and verify 201 Response Code 

  @FF2-004 @Accounts 
 Scenario:Negative scenario with name of more than 65 char. End pt.: CA03,
 * execute "FF2-004" createAccount POST Request and verify 201 Response Code 

  @FF2-005 @Accounts 
 Scenario:Scenario with two names or name with a space in between.. End pt.: CA04,
 * execute "FF2-005" createAccount POST Request and verify 201 Response Code 
