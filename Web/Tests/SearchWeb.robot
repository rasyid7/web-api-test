*** Settings ***
Resource          ../resource.robot
Test Setup        Open Chrome To    https://skillacademy.com/
Test Teardown     Close All Browsers

*** Test Cases ***
Valid Search Return Search Value
  [Documentation]   Search from Web with correct keyword and page should return items
  ${searchKeyword}=       Set Variable    programming
  Verify on SkillAcademy Page
  Verify Search Bar Is Shown
  Search For              ${searchKeyword}
  Verify Search Result    ${searchKeyword}
  Verify Course Card Result

Wrong Search Return Empty Search
  [Documentation]   Search from Web with wrong keyword and should return no result page
  ${searchKeyword}=       Set Variable    alskdjasdjaldadjad
  Verify on SkillAcademy Page
  Verify Search Bar Is Shown
  Search For                    ${searchKeyword}
  Verify Empty Search Result    ${searchKeyword}
