*** Settings ***
Documentation     Thi file contains test cases related to invalid login
Resource    ../resource/base/common_functionalities.resource

Library     DataDriver   file=../test_data/tnstc_data.xlsx      sheet_name=Valid Login


Test Setup      Launch Browser And Navigate TO Url
Test Teardown       Close Browser
Test Template       Valid Login Template
*** Test Cases ***
Valid Login Test

*** Keywords ***
Valid Login Template
    [Arguments]     ${username}   ${password}       ${expected_header}
    Click Element    xpath=//a[text()='E-Ticket Login']
    Input Text    name=txtUserLoginID    ${username}
    Input Text    name=txtPassword    ${password}
    Click Element    xpath=//a[@class='dboxheader']
    Element Should Contain    xpath=//td[contains(@class,'search_book')]    ${expected_header}