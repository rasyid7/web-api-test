*** Keywords ***
Verify on SkillAcademy Page
  Wait Until Location Is              https://skillacademy.com/

Verify Search Bar Is Shown
  Wait Until Page Contains Element    //input[@placeholder="Kamu ingin menguasai skill apa hari ini?"]

Search For
  [Arguments]     ${searchKey}
  Input Text      //input[@placeholder="Kamu ingin menguasai skill apa hari ini?"]    ${searchKey}
  Click Element   //div[@data-testid="search-icon"]

Verify Search Result
  [Arguments]     ${searchKey}
  Wait Until Page Contains Element    //span[@data-testid="current-keyword"]
  Element Text Should Be              //span[@data-testid="current-keyword"]      ${searchKey}

Verify Course Card Result
  ${resultCount}=     Get Text    //span[@data-testid="total-result"]
  IF  ${resultCount}>20
    ${pageCount}=     Get Element Count     //div[@data-testid="course-card"]
    Should Be Equal As Numbers              ${pageCount}       20
  ELSE
    ${pageCount}=     Get Element Count     //div[@data-testid="course-card"]
    Element Text Should Be                  //span[@data-testid="total-result"]     ${pageCount}
  END

Verify Empty Search Result
  [Arguments]     ${searchKey}
  Wait Until Page Contains Element          //div[@data-testid="empty-result-card"]
  Element Text Should Be                    //p[@data-testid="empty-card-title"]    Maaf, kami tidak menemukan hasil untuk "${searchKey}"
