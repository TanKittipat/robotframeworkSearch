*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${SEARCH_TERM}    robot framework
${SEARCH_RESULT}    robot framework
${SEARCH_RESULT-2}    automate

*** Keywords ***
Open Google
    Open Browser    https://www.google.com    ${BROWSER}

Input Search Term
    Input Text      name=q                 ${SEARCH_TERM}

Press Enter
    Press Keys    xpath=//*[@id="APjFqb"]    ENTER

Verify Results
    Wait Until Page Contains    ${SEARCH_TERM}
    Page Should Contain    ${SEARCH_RESULT}

*** Test Cases ***
Search Google and Verify Results-1
    [Documentation]    Test case to search Google and verify results
    Open Google       
    Input Search Term
    Press Enter
    Verify Results
    Close Browser

Search Google and Verify Results-2
    [Documentation]    Test case to search Google and verify results
    Open Google       
    Input Search Term
    Press Enter
    Verify Results
    Close Browser

Search Google and Verify Results-3
    [Documentation]    Test case to search Google and verify results
    Open Browser    https://www.yahoo.com    ${BROWSER}       
    Input Text    xpath=//*[@id="ybar-sbq"]    ${SEARCH_TERM}    
    Click Button    id=ybar-search
    Verify Results
    Close Browser