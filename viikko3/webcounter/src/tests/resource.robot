*** Settings ***
Library  Browser

*** Variables ***
${DELAY}     500ms
${HOME_URL}  http://localhost:5001
${BROWSER}   chromium

*** Keywords ***
Open And Configure Browser
    New Browser  browser=${BROWSER}  headless=False  slowMo=${DELAY}
    New Context
    New Page  about:blank
