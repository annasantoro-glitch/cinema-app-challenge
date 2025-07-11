*** Settings ***
Documentation       Test suite for validating cinema session functionalities. 
Resource            ../resources/sessions.resource

Suite Setup    Start Session

*** Test Cases ***
List Movie Sessions
    [Tags]    api    sessions    query    positive
    ${response}=    Get Movie Sessions    685c2d5cf34317e7520c4285
    Should Be Equal As Strings    ${response.status_code}    200

Get Session By ID
    [Tags]    api    sessions    query    positive
    ${response}=    Get Session By ID    685c2d5cf34317e7520c42a4
    Status Should Be    200    ${response}
    Dictionary Should Contain Key    ${response.json()['data']}    movie
    Dictionary Should Contain Key    ${response.json()['data']}    theater
    Dictionary Should Contain Key    ${response.json()['data']}    seats

List All Sessions
    [Tags]    api    sessions    query    positive
    ${response}=    Get All Sessions
    Status Should Be    200    ${response}
    Dictionary Should Contain Key    ${response.json()}    data
    Should Not Be Empty    ${response.json()['data']}

Create New Session
    [Tags]    api    sessions    creation    admin
    ${login_response}=    Login User    ${ADMIN_EMAIL}    ${ADMIN_PASSWORD}
    ${token}=    Set Variable    ${login_response.json()['data']['token']}
    ${session_data}=    Create Dictionary    movie=685c2d5cf34317e7520c4285    theater=685c2d5cf34317e7520c4289    datetime=2025-12-31T20:00:00.000Z    fullPrice=20    halfPrice=10
    ${response}=    Create Session With Auth    ${token}    ${session_data}
    Status Should Be    201    ${response}
    Dictionary Should Contain Key    ${response.json()['data']}    _id
    Dictionary Should Contain Key    ${response.json()['data']}    seats

Reset Seats
    [Tags]    api    sessions    admin    validation
    ${login_response}=    Login User    ${ADMIN_EMAIL}    ${ADMIN_PASSWORD}
    ${token}=    Set Variable    ${login_response.json()['data']['token']}
    ${response}=    Reset Session Seats    ${token}    685c2d5cf34317e7520c42a4
    Status Should Be    200    ${response}
    Dictionary Should Contain Value    ${response.json()}    Seats reset successfully

Try To Create Session With Regular User
    [Tags]    api    sessions    negative    security
    ${login_response}=    Login User    ${USER_EMAIL}    ${USER_PASSWORD}
    ${token}=    Set Variable    ${login_response.json()['data']['token']}
    ${session_data}=    Create Dictionary    movie=685c2d5cf34317e7520c4285    theater=685c2d5cf34317e7520c4289    datetime=2025-12-31T21:00:00.000Z
    ${response}=    Create Session With Auth    ${token}    ${session_data}
    Status Should Be    403    ${response}
    Dictionary Should Contain Value    ${response.json()}    Access denied