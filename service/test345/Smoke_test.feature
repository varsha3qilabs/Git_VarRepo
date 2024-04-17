Feature: This feature file tests all the scenarios from all the collection in the Awetest Service Test engine

 Background:
 * I read the data from the "all_folders.json" and "smoke_test" tag
 
 @FF2-001 @Accounts 
 Scenario: Create a new account using the Create account api on fatfreeCRM application. Use all the valid input params with unique name each time.. End pt.: createAccount,
 * execute "createAccount" createAccount POST Request and verify 201 Response Code 

 @FF3-001 @Accounts 
 Scenario: Get account by ID. End pt.: getAccountByAccountId,
 * execute "getAccountByAccountId" getAccountByAccountId GET Request and verify 200 Response Code 

 @FFCR-001 @Accounts 
 Scenario: Get all account. End pt.: getAccounts,
 * execute "getAccounts" getAccounts GET Request and verify 200 Response Code 

 @FF4-001 @Accounts 
 Scenario: Get account by ID. End pt.: updateAccount,
 * execute "updateAccount" updateAccount PUT Request and verify 204 Response Code 

 @FF5-001 @Accounts 
 Scenario: Delete Account. End pt.: deleteAccount,
 * execute "deleteAccount" deleteAccount DELETE Request and verify 204 Response Code 

 @FF22-001 @Tasks 
 Scenario: Create a new task. End pt.: createTask,
 * execute "createTask" createTask POST Request and verify 201 Response Code 

 @FF32-001 @Tasks 
 Scenario: Get Task by ID. End pt.: getTaskById,
 * execute "getTaskById" getTaskById GET Request and verify 200 Response Code 

 @FFCR2-001 @Tasks 
 Scenario: Get task by ID. End pt.: getTasks,
 * execute "getTasks" getTasks GET Request and verify 200 Response Code 

 @FF42-001 @Tasks 
 Scenario: Get account by ID. End pt.: updateTasks,
 * execute "updateTasks" updateTasks PUT Request and verify 204 Response Code 

 @FF52-001 @Tasks 
 Scenario: Delete Task. End pt.: deleteTasks,
 * execute "deleteTasks" deleteTasks DELETE Request and verify 204 Response Code 

 @FF222-001 @Campaign 
 Scenario: Create a new Campaign. End pt.: createCampaign,
 * execute "createCampaign" createCampaign POST Request and verify 201 Response Code 

 @FF322-001 @Campaign 
 Scenario: Get Campaign by ID. End pt.: getCampaignByCampaignId,
 * execute "getCampaignByCampaignId" getCampaignByCampaignId GET Request and verify 200 Response Code 

 @FFCR22-001 @Campaign 
 Scenario: Get all campaigns. End pt.: getCampaign,
 * execute "getCampaign" getCampaign GET Request and verify 200 Response Code 

 @FF422-001 @Campaign 
 Scenario: Get Campaign by ID. End pt.: updateCampaign,
 * execute "updateCampaign" updateCampaign PUT Request and verify 204 Response Code 

 @FF522-001 @Campaign 
 Scenario: Delete Campaign. End pt.: deleteCampaign,
 * execute "deleteCampaign" deleteCampaign DELETE Request and verify 204 Response Code 

 @FF2222-001 @Leads 
 Scenario: Create a new lead. End pt.: createLead,
 * execute "createLead" createLead POST Request and verify 201 Response Code 

 @FF3222-001 @Leads 
 Scenario: Get Lead by ID. End pt.: getLeadByCampaignId,
 * execute "getLeadByCampaignId" getLeadByCampaignId GET Request and verify 200 Response Code 

 @FFCR222-001 @Leads 
 Scenario: Get all leads. End pt.: getLeads,
 * execute "getLeads" getLeads GET Request and verify 200 Response Code 

 @FF4222-001 @Leads 
 Scenario: Update lead by ID. End pt.: updateLeads,
 * execute "updateLeads" updateLeads PUT Request and verify 204 Response Code 

 @FF5222-001 @Leads 
 Scenario: Delete Lead. End pt.: deleteLeads,
 * execute "deleteLeads" deleteLeads DELETE Request and verify 204 Response Code 
