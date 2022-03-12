*** Settings ***
Resource          ../resource.robot

*** Test Cases ***
API Search Query Test
  ${response}=  searchQueryChecker  Programming
  Pass Execution If   ${response}   Search value return true
