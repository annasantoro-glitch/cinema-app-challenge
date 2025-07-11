*** Settings ***
Documentation      API Keywords for Theater Management
Resource           ../variables/api_variables.resource
Resource           ../variables/base.resource
Resource          ../resources/auth.resource

*** Keywords ***
Create Theater
    [Arguments]    ${token}    ${theater_data}
    ${headers}=    Create Dictionary    Authorization=Bearer ${token}
    ${response}=    POST    ${THEATERS_ENDPOINT}    json=${theater_data}    headers=${headers}    expected_status=any
    RETURN    ${response}

List all theaters
    ${response}=    GET    ${THEATERS_ENDPOINT}
    RETURN    ${response}    

List theater by ID
    [Arguments]    ${theater_id}
    ${response}=    GET    ${THEATERS_ID_ENDPOINT}
    RETURN    ${response}

Update theater
    [Arguments]    ${token}    ${theater_id}    ${theater_data}
    ${headers}=    Create Dictionary    Authorization=Bearer ${token}
    ${url}=    Replace String    ${THEATERS_ID_ENDPOINT}    {id}    ${theater_id}
    ${response}=    PUT    ${BASE_API_URL}${url}    json=${theater_data}    headers=${headers}    expected_status=any
    RETURN    ${response}

Delete theater
    [Arguments]    ${token}    ${theater_id}
    ${headers}=    Create Dictionary    Authorization=Bearer ${token}
    ${url}=    Replace String    ${THEATERS_ID_ENDPOINT}    {id}    ${theater_id}
    ${response}=    DELETE    ${BASE_API_URL}${url}    headers=${headers}    expected_status=any
    RETURN    ${response}