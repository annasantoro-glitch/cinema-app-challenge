*** Settings ***
Documentation      API Keywords for User Authentication
Resource           ../resources/variables/variables.resource
Resource           ../resources/variables/base.resource

*** Keywords ***

# === Validations and General Keywords ===
Status Should Be
    [Arguments]    ${status_esperado}    ${response}
    Should Be Equal As Strings    ${response.status_code}    ${status_esperado}

Generate Random Email
    ${string_aleatoria}=    Generate Random String    8    [LETTERS]
    ${email}=    Set Variable    test${string_aleatoria}@example.com
    [Return]    ${email}

# === User Authentication Keywords ===    

Register User
    [Arguments]    ${name}    ${email}    ${password}
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${body}=    Create Dictionary    name=${name}    email=${email}    password=${password}
    ${response}=    POST    ${AUTH_REGISTER}    json=${body}    headers=${headers}    expected_status=any
    [Return]    ${response}
    
User Login
    [Arguments]    ${email}    ${password}
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${body}=    Create Dictionary    email=${email}    password=${password}
    ${response}=    POST    ${AUTH_LOGIN}    json=${body}    headers=${headers}    expected_status=any
    [Return]    ${response}

Get User Profile Data
    [Arguments]    ${token}
    ${headers}=    Create Dictionary    Content-Type=application/json    Authorization=Bearer ${token}
    ${response}=    GET    ${AUTH_ME}    headers=${headers}    expected_status=any
    [Return]    ${response}

Update User Profile Data
    [Arguments]    ${token}    ${name}=${None}    ${password}=${None}
    ${headers}=    Create Dictionary    Content-Type=application/json    Authorization=Bearer ${token}
    ${body}=    Create Dictionary
    Run Keyword If    '${name}' != '${None}'    Set To Dictionary    ${body}    name=${name}
    Run Keyword If    '${password}' != '${None}'    Set To Dictionary    ${body}    password=${password}
    ${response}=    PUT    ${AUTH_PROFILE}    json=${body}    headers=${headers}    expected_status=any
    [Return]    ${response}