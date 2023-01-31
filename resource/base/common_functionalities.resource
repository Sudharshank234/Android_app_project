*** Settings ***
Documentation       This resource file contains browser configuration
...                 and resuable scripts

Library     SeleniumLibrary

*** Variables ***
${BROWSER_NAME}     chrome
${URl}      https://www.tnstc.in/home.html

*** Keywords ***
Launch Browser And Navigate TO Url
    Open Browser        browser=${BROWSER_NAME}
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    Go To    url=${URl}

Capture Screenshots And Close Browser
    Run Keyword And Ignore Error    Capture Page Screenshot
    Close Browser