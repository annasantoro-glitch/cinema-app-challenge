*** Settings ***
Documentation      API Keywords for Movie Management
Resource           ../resources/variables/variables.resource
Resource           ../resources/variables/base.resource
Resource           auth.resource

*** Keywords ***
Get All Movies
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${response}=    GET    ${MOVIES_ENDPOINT}    headers=${headers}    expected_status=any
    [Return]    ${response}

Edit Movie By ID
    [Arguments]    ${movie_id}    ${movie_data}
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${url}=    Replace String    ${MOVIES_ID_ENDPOINT}    {id}    ${movie_id}
    ${response}=    PUT    ${url}    json=${movie_data}    headers=${headers}    expected_status=any
    [Return]    ${response}

Create Movie
    [Arguments]    ${token}    ${movie_data}
    ${headers}=    Create Dictionary    Content-Type=application/json    Authorization=Bearer ${token}
    ${response}=    POST    ${MOVIES_ENDPOINT}    json=${movie_data}    headers=${headers}    expected_status=any
    [Return]    ${response}

Delete Movie
    [Arguments]    ${token}    ${movie_id}
    ${headers}=    Create Dictionary    Content-Type=application/json    Authorization=Bearer ${token}
    ${url}=    Replace String    ${MOVIES_ID_ENDPOINT}    {id}    ${movie_id}
    ${response}=    DELETE    ${url}    headers=${headers}    expected_status=any
    [Return]    ${response}