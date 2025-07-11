*** Settings ***
Documentation    Variáveis das URLs

Library    RequestsLibrary
Library    Browser
Library    SeleniumLibrary
Library    DateTime
Library    FakerLibrary
Library    Collections
Library    String

*** Variables ***
# URLs
${BASE_API_URL}       http://localhost:3000/api/v1
${BASE_WEB_URL}       http://localhost:3002/

# Browser Configuration
${BROWSER}          chrome
${HEADLESS}         ${True}

# Diretories
${SCREENSHOT_DIR}   ${EXECDIR}/screenshots

# Test Data Files
${TEST_DATA_DIR}    ${EXECDIR}/test_data

*** Keywords ***
Start Session  
    New Browser     ${BROWSER}      ${HEADLESS}
    New Page        ${BASE_API_URL}