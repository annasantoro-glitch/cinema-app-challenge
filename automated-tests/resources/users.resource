*** Settings ***
Documentation      API Keywords for User Authentication
Resource           ../resources/variables/variables.resource
Resource           ../resources/variables/base.resource

*** Keywords ***
Create User
    [Arguments]    ${user_data}
    ${response}=    POST    ${USERS_ENDPOINT}    json=${user_data}
    RETURN    ${response}

Get All Users
    [Arguments]    ${token}
    ${headers}=    Create Dictionary    Authorization=Bearer ${token}
    ${response}=    GET    ${USERS_ENDPOINT}    headers=${headers}    expected_status=any
    RETURN    ${response}

Update User by Admin
    [Arguments]    ${token}    ${id_usuario}    ${user_data}
    ${headers}=    Create Dictionary    Authorization=Bearer ${token}
    ${url}=    Replace String    ${USERS_ID_ENDPOINT}    {id}    ${id_usuario}
    ${response}=    PUT    ${url}    json=${user_data}    headers=${headers}    expected_status=any
    RETURN    ${response}

Delete User
    [Arguments]    ${token}    ${id_usuario}
    ${headers}=    Create Dictionary    Authorization=Bearer ${token}
    ${url}=    Replace String    ${USERS_ID_ENDPOINT}    {id}    ${id_usuario}
    ${response}=    DELETE    ${url}    headers=${headers}    expected_status=any
    RETURN    ${response}