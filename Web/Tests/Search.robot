*** Settings ***
Resource          ../resource.robot
Test Setup        Open Chrome To    https://skillacademy.com/
Test Teardown     Close All Browsers

*** Test Cases ***
Valid Search Return Search Value
  ${searchKeyword}=       Set Variable    programming
  Verify on SkillAcademy Page
  Verify Search Bar Is Shown
  Search For              ${searchKeyword}
  Verify Search Result    ${searchKeyword}
  Verify Course Card Result
