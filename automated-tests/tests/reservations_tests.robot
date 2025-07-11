*** Settings ***
Documentation      Test suite for validating reservation functionalities in the cinema project.     
Resource           ../resources/reservations.resource

Suite Setup    Start Session

*** Test Cases ***
Create Reservation With Valid Data
    [Tags]    api    reservations    creation    positive
    # Login as user
    ${login_response}=    Login User    ${USER_EMAIL}    ${USER_PASSWORD}
    ${token}=    Set Variable    ${login_response.json()['data']['token']}
    
    # Get available session
    ${sessions_response}=    Get All Sessions
    ${sessions_data}=    Set Variable    ${sessions_response.json()['data']}
    ${available_session}=    Set Variable    ${sessions_data[0]}
    ${session_id}=    Set Variable    ${available_session['_id']}
    
    # Create reservation with available seats
    ${seats_list}=    Create List    A1    A2
    ${reservation_data}=    Create Dictionary
    ...    session=${session_id}
    ...    seats=${seats_list}
    ${response}=    Create Reservation With Auth    ${token}    ${reservation_data}
    
    # Assertions
    Status Should Be    201    ${response}
    Dictionary Should Contain Key    ${response.json()['data']}    _id
    Dictionary Should Contain Key    ${response.json()['data']}    user
    Dictionary Should Contain Key    ${response.json()['data']}    session
    Dictionary Should Contain Key    ${response.json()['data']}    seats

List Reservations
    [Tags]    api    reservations    admin    query
    # Login as admin
    ${login_response}=    Login User    ${ADMIN_EMAIL}    ${ADMIN_PASSWORD}
    ${token}=    Set Variable    ${login_response.json()['data']['token']}
    
    # Get all reservations
    ${response}=    Get All Reservations    ${token}
    
    # Assertions
    Status Should Be    200    ${response}
    Should Be True    len(${response.json()}) >= 0

Try Reserving Occupied Seat
    [Tags]    api    reservations    negative    validation
    ${login_response}=    Login User    ${USER_EMAIL}    ${USER_PASSWORD}
    ${token}=    Set Variable    ${login_response.json()['data']['token']}

    # Create a reservation to occupy seats
    ${seats_list}=    Create List    A8    A9
    ${reservation_data}=    Create Dictionary    session=6c4d5fn34919e7520c40a4    seats=${seats_list}
    Create Reservation With Auth    ${token}    ${reservation_data}
    
    # Try to reserve the same seats
    ${response}=    Create Reservation With Auth    ${token}    ${reservation_data}
    Status Should Be    400    ${response}
    Dictionary Should Contain Value    ${response.json()}    Seats not available

Get User Reservation Details
    [Tags]    api    reservations    query    positive
    ${login_response}=    Login User    ${USER_EMAIL}    ${USER_PASSWORD}
    ${token}=    Set Variable    ${login_response.json()['data']['token']}

    # Create a reservation
    ${seats_list}=    Create List    B2
    ${reservation_data}=    Create Dictionary    session=6c4d5fn34919e7520c40a4    seats=${seats_list}
    ${create_response}=    Create Reservation With Auth    ${token}    ${reservation_data}
    ${reservation_id}=    Set Variable    ${create_response.json()['data']['_id']}
 
    # Get reservation details
    ${response}=    Get Reservation By ID    ${token}    ${reservation_id}
    Status Should Be    200    ${response}
    Dictionary Should Contain Key    ${response.json()['data']}    _id
    Dictionary Should Contain Key    ${response.json()['data']}    seats

Create Reservation Without Authentication
    [Tags]    api    reservations    negative    security
    ${reservation_data}=    Create Dictionary    session=685c2d5cf34317e7520c42a4    seats=E1
    ${response}=    Create Reservation    ${reservation_data}
    Status Should Be    401    ${response}
    Dictionary Should Contain Value    ${response.json()}    Authentication required