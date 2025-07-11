*** Settings ***
Documentation       Test suite for validating the functionality and features of the Movies section.
Resource            ../resources/movies.resource

Suite Setup    Start Session

*** Test Cases ***

Create New Movie
    [Tags]    api    movies    creation    admin
    ${login_response}=    Login User    ${ADMIN_EMAIL}    ${ADMIN_PASSWORD}
    ${token}=    Set Variable    ${login_response.json()['data']['token']}
    ${movie_data}=    Create Dictionary    title=Novo Filme Teste    director=Diretor Teste    synopsis=Sinopse do filme    duration=120    classification=PG-13
    ${response}=    Create Movie    ${token}    ${movie_data}
    Status Should Be    201    ${response}
    Dictionary Should Contain Key    ${response.json()['data']}    _id
    Dictionary Should Contain Key    ${response.json()['data']}    title

Regular User Tries To Create
    [Tags]    api    movies    negative    security
    ${login_response}=    Login User    ${USER_EMAIL}    ${USER_PASSWORD}
    ${token}=    Set Variable  ${login_response.json()['data']['token']}
    ${movie_data}=    Create Dictionary    title=Filme Não Autorizado    director=Diretor
    ${response}=    Create Movie    ${token}    ${movie_data}
    Status Should Be    403    ${response}
    Dictionary Should Contain Value    ${response.json()}    Access denied

List All Movies
    [Tags]    api    movies    query    positive
    ${response}=    Get All Movies
    Should Be Equal As Strings    ${response.status_code}    200
    Should Not Be Empty    ${response.json()}

Get Movie By ID
    [Tags]    api    movies    query    positive
    ${response}=    Get Movie By ID    1
    Should Be Equal As Strings    ${response.status_code}    200
    Dictionary Should Contain Key    ${response.json()['data']}    title

Delete Movie
    [Tags]    api    movies    deletion    admin
    ${login_response}=    Login User    ${ADMIN_EMAIL}    ${ADMIN_PASSWORD}
    ${token}=    Set Variable    ${login_response.json()['data']['token']}
   
    # Create a movie
    ${movie_data}=    Create Dictionary    title=Filme Para Deletar    director=Diretor
    ${create_response}=    Create Movie    ${token}    ${movie_data}
    ${movie_id}=    Set Variable    ${create_response.json()['data']['_id']}
   
    # Deleting a movie
    ${response}=    Delete Movie    ${token}    ${movie_id}
    Status Should Be    200    ${response}
    Dictionary Should Contain Value    ${response.json()}    Movie removed

Regular User Tries To Delete Movie
    [Tags]    api    movies    negative    security
    ${login_response}=    Login User    ${USER_EMAIL}    ${USER_PASSWORD}
    ${token}=    Set Variable    ${login_response.json()['data']['token']}
    ${response}=    Delete Movie    ${token}    685c2d5cf34317e7520c4285
    Status Should Be    403    ${response}
    Dictionary Should Contain Value    ${response.json()}    Access denied