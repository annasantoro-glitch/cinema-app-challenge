*** Settings ***
Documentation      Test suite for validating user-related functionalities in the cinema project.  
Resource           ../resources/users.resource

Suite Setup    Start Session

*** Test Cases ***
Create User Should Succeed
    [Tags]    api    users    creation    positive
    ${user_data}=    Create Dictionary    name=Test User    email=test@test.com
    ${response}=    Create User    ${user_data}
    Should Be Equal As Strings    ${response.status_code}    201

Get User Profile
    [Tags]    api    users    profile    query
    ${response}=    Get User Profile Data    1
    Should Be Equal As Strings    ${response.status_code}    200

Update User Profile
    [Tags]    api    users    profile    validation
    ${user_data}=    Create Dictionary    name=Updated User
    ${response}=    Update User Profile Data    1    ${user_data}
    Should Be Equal As Strings    ${response.status_code}    200

List All Users As Admin
    [Tags]    api    users    admin    query
    ${login_response}=    Login User    ${ADMIN_EMAIL}    ${ADMIN_PASSWORD}
    ${token}=    Set Variable    ${login_response.json()['data']['token']}
    ${response}=    Get All Users    ${token}
    Status Should Be    200    ${response}
    Dictionary Should Contain Key    ${response.json()}    data
    Should Not Be Empty    ${response.json()['data']}

List Users As Regular User
    [Tags]    api    users    negative    security
    ${login_response}=    Login User    ${USER_EMAIL}    ${USER_PASSWORD}
    ${token}=    Set Variable    ${login_response.json()['data']['token']}
    ${response}=    Get All Users    ${token}
    Status Should Be    403    ${response}
    Dictionary Should Contain Value    ${response.json()}    Access denied

Get User By ID As Admin
    [Tags]    api    users    admin    query
    ${login_response}=    Login User    ${ADMIN_EMAIL}    ${ADMIN_PASSWORD}
    ${token}=    Set Variable    ${login_response.json()['data']['token']}

    # Get list to fetch an ID
    ${users_response}=    Get All Users    ${token}
    ${user_id}=    Set Variable    ${users_response.json()['data'][0]['_id']}
    ${response}=    Get User Profile    ${user_id}
    Status Should Be    200    ${response}
    Dictionary Should Contain Key    ${response.json()['data']}    email
    Dictionary Should Not Contain Key    ${response.json()['data']}    password

Update User As Admin
    [Tags]    api    users    admin    validation
    ${login_response}=    Login User    ${ADMIN_EMAIL}    ${ADMIN_PASSWORD}
    ${token}=    Set Variable    ${login_response.json()['data']['token']}

    # Create user
    ${random_email}=    Generate Random Email
    ${create_response}=    Register User    User To Update    ${random_email}    password123
    ${user_id}=    Set Variable    ${create_response.json()['data']['_id']}
    
    # Updating user data
    ${user_data}=    Create Dictionary    name=Updated User Name    role=admin
    ${response}=    Update User By Admin    ${token}    ${user_id}    ${user_data}
    Status Should Be    200    ${response}
    Dictionary Should Contain Key    ${response.json()['data']}    name
    Should Be Equal As Strings    ${response.json()['data']['name']}    Updated User Name

Delete User As Admin
    [Tags]    api    users    admin    deletion
    ${login_response}=    Login User    ${ADMIN_EMAIL}    ${ADMIN_PASSWORD}
    ${token}=    Set Variable    ${login_response.json()['data']['token']}
    
    # Create user
    ${random_email}=    Generate Random Email
    ${create_response}=    Register User    User To Delete    ${random_email}    password123
    ${user_id}=    Set Variable    ${create_response.json()['data']['_id']}
    
    # Delete user
    ${response}=    Delete User    ${token}    ${user_id}
    Status Should Be    200    ${response}
    Dictionary Should Contain Value    ${response.json()}    User removed

Delete User
    [Tags]    api    users    deletion    validation
    # Create user
    ${random_email}=    Generate Random Email
    ${create_response}=    Register User    User Delete Test    ${random_email}    password123
    ${user_id}=    Set Variable    ${create_response.json()['data']['_id']}
    
    # Delete user 
    ${admin_login}=    Login User    ${ADMIN_EMAIL}    ${ADMIN_PASSWORD}
    ${admin_token}=    Set Variable    ${admin_login.json()['data']['token']}
    Delete User    ${admin_token}    ${user_id}