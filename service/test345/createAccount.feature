
 Feature: This feature file tests the collection from createAccount in the Awetest Service Test engine

 Background:
 * I read the data from the "createAccount" collection of "old_fdlc_import"

@smoke_test @AWE1-001 @old_fdlc_import @jira_DS-120
 Scenario: Create New Account.. End pt.: createAccount,
 * execute "createAccount" createAccount POST Request and verify 201 Response Code 

 @createAccount_reg @AWE1-002 @old_fdlc_import @jira_DS-132
 Scenario:64 char max. End pt.: s_001,
 * execute "AWE1-002" createAccount POST Request and verify 201 Response Code and validate     

 @createAccount_reg @AWE1-003 @old_fdlc_import @jira_DS-133
 Scenario:Invalid, 65 char more than max. End pt.: s_002,
 * execute "AWE1-003" createAccount POST Request and verify 201 Response Code and validate                                 

 @createAccount_reg @AWE1-004 @old_fdlc_import @jira_DS-134
 Scenario:with space. End pt.: s_003,
 * execute "AWE1-004" createAccount POST Request and verify 201 Response Code 

 @createAccount_reg @AWE1-005 @old_fdlc_import @jira_DS-135
 Scenario:Name Array. End pt.: s_004,
 * execute "AWE1-005" createAccount POST Request and verify 201 Response Code 

 @createAccount_reg @AWE1-006 @old_fdlc_import @jira_DS-136
 Scenario:Invalid type, empty string. End pt.: s_005,
 * execute "AWE1-006" createAccount POST Request and verify 422 Response Code 

 @createAccount_reg @AWE1-007 @old_fdlc_import @jira_DS-137
 Scenario:Invalid type, empty array. End pt.: s_006,
 * execute "AWE1-007" createAccount POST Request and verify 422 Response Code 

 @getAccountByAccountID @AWE1-008 @old_fdlc_import @jira_DS-125
 Scenario:Post an account. End pt.: s_0010,
 * execute "AWE1-008" createAccount POST Request and verify 201 Response Code 

 @createAccount_reg @AWE1-009 @old_fdlc_import @jira_DS-120
 Scenario:Create New Account... End pt.: createAccount_20210126_233105,
 * execute "AWE1-009" createAccount POST Request and verify 201 Response Code 

 @createAccount_reg @AWE1-010 @old_fdlc_import @jira_DS-120
 Scenario:Create New Account... End pt.: createAccount_20210127_092354,
 * execute "AWE1-010" createAccount POST Request and verify 201 Response Code 

 @createAccount_reg @AWE1-011 @old_fdlc_import @jira_DS-120
 Scenario:Create New Account... End pt.: createAccount_20210127_092421,
 * execute "AWE1-011" createAccount POST Request and verify 201 Response Code 

 @createAccount_reg @AWE1-012 @old_fdlc_import @jira_DS-120
 Scenario:Create New Account.. End pt.: createAccount_20210211_141019,
 * execute "AWE1-012" createAccount POST Request and verify 201 Response Code 

 @createAccount_reg @AWE1-013 @old_fdlc_import @jira_DS-120
 Scenario:Create New Account.. End pt.: createAccount_20210211_141019_20210211_141052,
 * execute "AWE1-013" createAccount POST Request and verify 201 Response Code 
