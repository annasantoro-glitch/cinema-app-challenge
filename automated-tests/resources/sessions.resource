*** Settings ***
Documentation      API Keywords for Session Management
Resource           ../variables/variables.resource
Resource           ../variables/base.resource
Resource           auth.resource

*** Keywords ***
Create Session
    [Arguments]    ${session_data}
    ${response}=    POST    ${SESSIONS_ENDPOINT}    json=${session_data}
    RETURN    ${response}

Create Session With Auth
    [Arguments]    ${token}    ${session_data}
    ${headers}=    Create Dictionary    Authorization=Bearer ${token}
    ${response}=    POST   ${SESSIONS_ENDPOINT}    json=${session_data}    headers=${headers}    expected_status=any
    RETURN    ${response}    

Get All Sessions
    ${response}=    GET    ${SESSIONS_ENDPOINT}
    RETURN    ${response}

Get Session By ID
    [Arguments]    ${session_id}
    ${url}=    Replace String    ${SESSIONS_ID_ENDPOINT}    {id}    ${session_id}
    ${response}=    GET    ${url}
    RETURN    ${response}

Reset Session Seats
    [Arguments]    ${token}    ${session_id}
    ${headers}=    Create Dictionary    Authorization=Bearer ${token}
    ${url}=    Replace String    ${RESET_SEATS_ENDPOINT}    {id}    ${session_id}
    ${response}=    PUT    ${url}    headers=${headers}    expected_status=any
    RETURN    ${response}

Delete Session
    [Arguments]    ${session_id}
    ${url}=    Replace String    ${SESSIONS_ID_ENDPOINT}    {id}    ${session_id}
    ${response}=    DELETE    ${url}
    RETURN    ${response}