*** Settings ***
Resource  resource.robot
Suite Setup     Open And Configure Browser
Suite Teardown  Close Browser
Test Setup      Reset Application Create User And Go To Login Page

*** Test Cases ***
Login With Correct Credentials
    Set Username  kalle
    Set Password  kalle123
    Click  button >> text=Login
    Login Should Succeed

Login With Incorrect Password
    Set Username  kalle
    Set Password  kalle456
    Click  button >> text=Login
    Login Should Fail With Message  Invalid username or password

*** Keywords ***
Login Should Succeed
    Main Page Should Be Open

Login Should Fail With Message
    [Arguments]  ${message}
    Login Page Should Be Open
    Get Text  body  *=  ${message}

Set Username
    [Arguments]  ${username}
    Fill Text  id=username  ${username}

Set Password
    [Arguments]  ${password}
    Fill Secret  id=password  $password

Reset Application Create User And Go To Login Page
    Reset Application
    Create User  kalle  kalle123
    Go To Login Page
