*** Settings ***
Library     AppiumLibrary

*** Test Cases ***
TC1 Sign Up
     &{dic}      Create Dictionary       buildName=browserstack-build-1
    ...     projectName=First Python project
    ...     userName=sudharshank_DZV9jn
    ...     accessKey=kze91MmpmHTE45HmyLsT

    Open Application    remote_url=http://hub.browserstack.com/wd/hub
    ...     platformName=android
    ...     deviceName=Google Pixel 3
    ...     app=bs://767f1806a1bf3c250c915d4abb859e3c8e9b986b
    ...     platformVersion=9.0
    ...     bstack:options=${dic}

    Set Appium Timeout    30s

    Wait Until Page Contains Element   xpath=//android.widget.TextView[@text='English']
    Click Element    xpath=//android.widget.TextView[@text='English']

    Wait Until Page Contains Element    xpath=//android.widget.TextView[@text='Continue']
    Click Element    xpath=//android.widget.TextView[@text='Continue']

    Wait Until Page Contains Element    xpath=//android.widget.TextView[@text='Men']
    Click Element   xpath=//android.widget.TextView[@text='Men']


    ${count}    Get Matching Xpath Count    xpath=//android.widget.TextView[@text='UrbanMark Men Comfortable Stylish Running, Sports Shoes - Red']
    WHILE    ${count}==0
        Swipe By Percent    90     70    90    40
        ${count}    Get Matching Xpath Count    xpath=//android.widget.TextView[@text='UrbanMark Men Comfortable Stylish Running, Sports Shoes - Red']
    END

    Wait Until Page Contains Element    xpath=//android.widget.TextView[@text='UrbanMark Men Comfortable Stylish Running, Sports Shoes - Red']
    Click Element    xpath=//android.widget.TextView[@text='UrbanMark Men Comfortable Stylish Running, Sports Shoes - Red']

    Wait Until Page Contains Element    xpath=//android.widget.EditText[@resource-id='com.snapdeal.main:id/shipnearPincodeNew']
    Input Text   xpath=//android.widget.EditText[@resource-id='com.snapdeal.main:id/shipnearPincodeNew']        123456

    Wait Until Page Contains Element    xpath=//android.widget.Button[@text='UPDATE']
    Click Element    xpath=//android.widget.Button[@text='UPDATE']


    ${count}    Get Matching Xpath Count    xpath=//android.widget.TextView[@text='Delivery not available']
    WHILE    ${count}==0
        Swipe By Percent    90     70    90    40
        ${count}    Get Matching Xpath Count    xpath=//android.widget.TextView[@text='Delivery not available']
    END

    Wait Until Page Contains Element    xpath=//android.widget.TextView[@text='Delivery not available']
    Element Should Contain Text    xpath=//android.widget.TextView[@text='Delivery not available']    Delivery not available

    [Teardown]  Close Application