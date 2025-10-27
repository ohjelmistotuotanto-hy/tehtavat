*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${SERVER}    localhost:5001
${DELAY}     0.5 seconds
${HOME_URL}  http://${SERVER}
${BROWSER}   chrome
${HEADLESS}  false

*** Keywords ***
Open And Configure Browser
    Set Selenium Speed  ${DELAY}
    Open Browser  browser=${BROWSER}
