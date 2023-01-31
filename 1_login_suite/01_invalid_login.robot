*** Settings ***
Documentation     Thi file contains test cases related to invalid login
Resource    ../resource/base/common_functionalities.resource

Library     DataDriver   file=../test_data/tnstc_data.xlsx      sheet_name=Invalid Login

Test Setup      Launch Browser And Navigate TO Url
Test Teardown       Close Browser
Test Template       Invalid Login Template
*** Test Cases ***
Invalid Login Test

*** Keywords ***
Invalid Login Template
    [Arguments]     ${username}    ${password}    ${expected_error}
    Click Element    xpath=//a[text()='E-Ticket Login']
    Input Text    name=txtUserLoginID    ${username}
    Input Text    name=txtPassword    ${password}
    Click Element    xpath=//a[@class='dboxheader']
    Element Text Should Be    xpath=//strong[contains(text(),'Login Failed.')]     ${expected_error}
