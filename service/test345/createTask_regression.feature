# Feature: This feature file tests the collection from createTask in the Awetest Service Test engine

#  Background:
#  * I read the data from the "createTask" collection of "Tasks"
 
#  @FF22-001 @Tasks 
#  Scenario: Create a new task. End pt.: createTask,
#  * execute "createTask" createTask POST Request and verify 201 Response Code 

#   @FF22-006 @Tasks 
#  Scenario:2688 char max. End pt.: CreateTask1,
#  * execute "FF22-006" createTask POST Request and verify 201 Response Code 

#   @FF22-007 @Tasks 
#  Scenario:invalid, 2689 char more than max. End pt.: CreateTask2,
#  * execute "FF22-007" createTask POST Request and verify 500 Response Code 

#   @FF22-008 @Tasks 
#  Scenario:with space. End pt.: CreateTask3,
#  * execute "FF22-008" createTask POST Request and verify 201 Response Code 

#   @FF22-009 @Tasks 
#  Scenario:array. End pt.: CreateTask4,
#  * execute "FF22-009" createTask POST Request and verify 201 Response Code 

#   @FF22-010 @Tasks 
#  Scenario:invalid type, empty string. End pt.: CreateTask53,
#  * execute "FF22-010" createTask POST Request and verify 422 Response Code 

Feature: This feature file tests all the scenarios from createTask_regression tab on fatfreecrm.xlsx

			Background:
    Given I have a validate service URL to make "POST" request
    And   I read the data from the "fatfreecrm.xlsx" and "createTask_regression" tab
 
 @#1
 Scenario: 2688 char max, Element = name, Scenario ID = s_001, API Name = tasks.json,
       * run test for "s_001"

 @#2
 Scenario: invalid, 2689 char more than max, Element = name, Scenario ID = s_002, API Name = tasks.json,
       * run test for "s_002"

 @#3
 Scenario: with space, Element = name, Scenario ID = s_003, API Name = tasks.json,
       * run test for "s_003"

 @#4
 Scenario: array, Element = name, Scenario ID = s_004, API Name = tasks.json,
       * run test for "s_004"

 @#5
 Scenario: invalid type, empty string, Element = name, Scenario ID = s_005, API Name = tasks.json,
       * run test for "s_005"

