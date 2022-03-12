*** Settings ***
Resource          ../resource.robot

*** Test Cases ***
API Search Query Test
  ${response}=  searchQueryChecker  Programming
  Pass Execution If   ${response}   Search value return true

API Search Page Test
  ${searchPage}=  Set Variable    3
  ${response}=    searchPage      ${searchPage}
  Pass Execution If   ${response}==${searchPage}    Search page return same ${searchPage}

API Search pageSize Test
  ${pageSize}=  Set Variable    30
  ${response}=  pageSize        ${pageSize}
  Pass Execution If   ${response}==${pageSize}      Page Size return same ${pageSize}
