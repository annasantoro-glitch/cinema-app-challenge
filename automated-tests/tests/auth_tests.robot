*** Settings ***
Documentation      Test suite for authentication endpoints including registration, login, and user profile management.
Resource           ../resources/auth.resource

Suite Setup    Start Session

*** Test Cases ***

Register User With Valid Data
    [Tags]    api    registration    positive    validation
    ${random_email}=    Generate Random Email
    ${response}=    Register User    Test User    ${random_email}    password123
    Status Should Be    201    ${response}
    Dictionary Should Contain Key    ${response.json()}    success
    Dictionary Should Contain Key    ${response.json()['data']}    token
    Should Not Be Empty    ${response.json()['data']['token']}

Register With Duplicated Email
    [Tags]    api    registration    negative    validation
    ${response}=    Register User    Test User    ${USER_EMAIL}    password123
    Status Should Be    400    ${response}
    Dictionary Should Contain Value    ${response.json()}    User already exists

Login With Valid Credentials
    [Tags]    api    login    positive    authentication
    ${response}=    Login User    ${USER_EMAIL}    ${USER_PASSWORD}
    Status Should Be    200    ${response}
    Dictionary Should Contain Key    ${response.json()}    success
    Dictionary Should Contain Key    ${response.json()['data']}    token
    Should Not Be Empty    ${response.json()['data']['token']}

Login With Invalid Password
    [Tags]    api    login    negative    security
    ${response}=    Login User    ${USER_EMAIL}    wrongpassword
    Status Should Be    401    ${response}
    Dictionary Should Contain Value    ${response.json()}    Invalid email or password

Get User Profile With Valid Token
    [Tags]    api    profile    positive    authentication
    ${login_response}=    Login User    ${USER_EMAIL}    ${USER_PASSWORD}
    ${token}=    Set Variable    ${login_response.json()['data']['token']}
    ${response}=    Get User Profile    ${token}
    Status Should Be    200    ${response}
    Dictionary Should Contain Key    ${response.json()['data']}    email
    Should Be Equal As Strings    ${response.json()['data']['email']}    ${USER_EMAIL}

Get User Profile Without Token
    [Tags]    api    profile    negative    security
    ${response}=    Get User Profile Data    invalidtoken
    Status Should Be    401    ${response}

Update Profile With Valid Data
    [Tags]    api    profile    positive    validation
    ${login_response}=    Login User    ${USER_EMAIL}    ${USER_PASSWORD}
    ${token}=    Set Variable    ${login_response.json()['data']['token']}
    ${response}=    Update User Profile    ${token}    New Name    newpassword123
    Status Should Be    200    ${response}
    Dictionary Should Contain Key    ${response.json()['data']}    name