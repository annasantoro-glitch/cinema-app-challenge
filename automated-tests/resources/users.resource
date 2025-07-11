*** Settings ***
Documentation      API Keywords for User Authentication
Resource           ../variables/variables.resource
Resource           ../variables/base.resource

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
    ${response}=    PUT    ${USERS_ID_ENDPOINT}    json=${user_data}    headers=${headers}    expected_status=any
    RETURN    ${response}

Delete User
    [Arguments]    ${token}    ${id_usuario}
    ${headers}=    Create Dictionary    Authorization=Bearer ${token}
    ${response}=    DELETE    ${USERS_ID_ENDPOINT}    headers=${headers}    expected_status=any
    RETURN    ${response}