*** Settings ***
Library         Selenium2Library
Library         BuiltIn
Resource        ../Resource/resource.robot
Resource        ../Variable/Variables.robot

#Suite Setup  Setup chromedriver
*** Variables ***
${browser}      chrome

*** Test Cases ***
TestCase1 :: Login nopcommerce webpage with valid creds
    [Documentation]     Testing with correct username and correct password
    ...                 Positive scenario
    [Tags]              Regression       tc001
    [Setup]             Launch url  ${URL}  ${browser}
    Verify page title   ${HomePage_title}   ${title}
    Initialize login    ${username}     ${password}
    [Teardown]  close browser

TestCase2 :: Login nopcommerce webpage with invalid creds
    [Documentation]     Testing with correct username and correct password
    ...                 Positive scenario
    [Tags]              Regression       tc002
    [Setup]             Launch url  ${URL}  ${browser}
    Verify page title   ${HomePage_title}   ${title}
    Invalid login       ${Invalid_username}     ${Invalid_password}
    [Teardown]  close browser