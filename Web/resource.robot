*** Settings ***
Library           SeleniumLibrary
Library           DebugLibrary
Resource          Keywords/Pages/SearchPage.robot

*** Variables ***
${url}            https://skillacademy.com/

*** Keywords ***
Open Chrome To
  [Arguments]       ${url}
  Close All Browsers
  Open Browser      url=${url}          browser=chrome
