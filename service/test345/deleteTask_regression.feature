# Feature: This feature file tests the collection from deleteTasks in the Awetest Service Test engine

#  Background:
#  * I read the data from the "deleteTasks" collection of "Tasks"
 
#  @FF52-001 @Tasks 
#  Scenario: Delete Task. End pt.: deleteTasks,
#  * execute "deleteTasks" deleteTasks DELETE Request and verify 204 Response Code 

#   @FF52-002 @Tasks 
#  Scenario:Delete Invalid task. End pt.: DeleteTask,
#  * execute "FF52-002" deleteTasks DELETE Request and verify 404 Response Code 

Feature: This feature files tests all the scenarios from deleteTask_regression tab on fatfreecrm.xlsx

			Background:
    Given I have a validate service URL to make "POST" request
    And   I read the data from the "fatfreecrm.xlsx" and "deleteTask_regression" tab
 
 @#1
 Scenario: post a task, Element = name, Scenario ID = s_001, API Name = tasks.json,
      * run test for "s_001"

 @#2
 Scenario: delete an account, Element = , Scenario ID = s_002, API Name = tasks/"ID".json,
      * run test for "s_002"

 @#3
 Scenario: invalid, delete an deleted account, Element = , Scenario ID = s_003, API Name = tasks/"ID".json,
      * run test for "s_003"
