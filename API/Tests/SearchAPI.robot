*** Settings ***
Resource          ../resource.robot

*** Test Cases ***
API Search Query Test
  ${response}=  searchQueryChecker  Programming
  Pass Execution If   ${response}   Search value return true

API Search Page Test
  ${searchPage}=  Set Variable    3
  ${response}=  searchPage  ${searchPage}
  Pass Execution If   ${response}==${searchPage}    Search page return same
