*** Settings ***
Documentation       The file contains test cases for add valid passenger records

Resource    ../resource/base/common_functionalities.resource

Library     DataDriver   file=../test_data/tnstc_data.xlsx      sheet_name=Add Valid Passenger Details

Test Setup      Launch Browser And Navigate TO Url
Test Teardown       Close Browser
Test Template    Add Valid Passenger Details Template

*** Test Cases ***
Add valid Passenger Details Test

*** Keywords ***
Add Valid Passenger Details Template
    [Arguments]     ${username}     ${password}     ${name}     ${age}     ${idcard_no}     ${phone_no}     ${mail_id}      ${expected_error}
    Click Element    xpath=//a[text()='E-Ticket Login']
    Input Text    name=txtUserLoginID    ${username}
    Input Text    name=txtPassword    ${password}
    Click Element    xpath=//a[@class='dboxheader']
    Click Element    xpath=//a[text()='Chennai - Ooty']
    Click Element    xpath=//a[text()='Book']
    Input Text    name=txtName    ${name}
    Input Text    name=txtAge     ${age}
    Select From List By Label    name=selectIdProof     Employee ID Card
    Input Text    name=txtIdProofReference    ${idcard_no}
    Input Text    name=txtPhoneNo    ${phone_no}
    Input Text    name=txtEmailID    ${mail_id}
    Click Element    xpath=//a[text()='Submit']
    ${alert_text}    Handle Alert    action=ACCEPT      timeout=20s
    Log To Console    ${alert_text}
    Should Be Equal    ${alert_text}    ${expected_error}


