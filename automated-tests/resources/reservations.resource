*** Settings ***
Documentation      API Keywords for Reservation Management
Resource           ../variables/variables.resource
Resource           ../variables/base.resource
Resource           auth.resource
Resource           sessions.resource

*** Keywords ***
Create Reservation
    [Arguments]    ${reservation_data}
    ${response}=    POST    ${RESERVATIONS_ENDPOINT}    json=${reservation_data}
    RETURN    ${response}

Create Reservation With Auth
    [Arguments]    ${token}    ${reservation_data}
    ${headers}=    Create Dictionary    Authorization=Bearer ${token}
    ${response}=    POST    ${RESERVATIONS_ENDPOINT}    json=${reservation_data}    headers=${headers}    expected_status=any
    RETURN    ${response}

Get all Reservations
    [Arguments]    ${token}
    ${headers}=    Create Dictionary    Authorization=Bearer ${token}
    ${response}=    GET    ${RESERVATIONS_ENDPOINT}    headers=${headers}    expected_status=any
    RETURN    ${response}

Delete Reservation
    [Arguments]    ${reservation_id}
    ${url}=    Replace String    ${RESERVATIONS_ID_ENDPOINT}    {id}    ${reservation_id}
    ${response}=    DELETE    ${url}
    RETURN    ${response}