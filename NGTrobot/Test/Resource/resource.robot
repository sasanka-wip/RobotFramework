*** Settings ***
Documentation   Testing nopcommerce Website
Library         Selenium2Library
Library         BuiltIn
Library         OperatingSystem

*** Variables ***
${username_xpath}       //input[@id='Email']
${password_xpath}       //input[@id='Password']
${loginbtn_xpath}       //button[contains(text(),'Log in')]
${dashboard_xpath}      //h1[contains(text(),'Dashboard')]
${invalid_login}        //li[contains(text(),'No customer account found')]

*** Keywords ***
Launch url
    [Arguments]         ${URL}       ${browser}
    log to console  Launching ${URL} in ${browser}
    open browser    ${URL}      browser=${browser}
    maximize browser window
    sleep   5

Verify page title
    [Arguments]         ${xpath}       ${title}
    wait until element contains     ${xpath}    ${title}
    log to console  Page Title : ${title} Verified successfully

Initialize login
    [Arguments]         ${username}       ${password}
    input text      ${username_xpath}    ${username}    clear=True
    input text      ${password_xpath}    ${password}    clear=True
    click element   ${loginbtn_xpath}
    wait until keyword succeeds     1 min       1 sec       element should be visible       ${dashboard_xpath}
    log to console  Clicked on login link Successfully.

Invalid login
    [Arguments]         ${username}       ${password}
    input text      ${username_xpath}    ${username}    clear=True
    input text      ${password_xpath}    ${password}    clear=True
    click element   ${loginbtn_xpath}
    ${present}=  run keyword and return status   element should be visible   id=&{invalid_login}
    Run Keyword If    ${present}    log to console  Invalid login test sucessful.