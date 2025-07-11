*** Settings ***
Documentation     
Resource          base.resource

*** Variables ***

# Auth Endpoints
${AUTH_LOGIN}       ${BASE_API_URL}/auth/login
${AUTH_REGISTER}    ${BASE_API_URL}/auth/register
${AUTH_ME}          ${BASE_API_URL}/auth/me
${AUTH_PROFILE}     ${BASE_API_URL}/auth/profile

# Users Endpoints
${USERS_ENDPOINT}            ${BASE_API_URL}/users
${USERS_ID_ENDPOINT}         ${BASE_API_URL}/users/{id}

# Movies Endpoints
${MOVIES_ENDPOINT}           ${BASE_API_URL}/movies
${MOVIES_ID_ENDPOINT}        ${BASE_API_URL}/movies/{id}

# Theaters Endpoints
${THEATERS_ENDPOINT}         ${BASE_API_URL}/theaters
${THEATERS_ID_ENDPOINT}      ${BASE_API_URL}/theaters/{id}

# Sessions Endpoints
${SESSIONS_ENDPOINT}         ${BASE_API_URL}/sessions
${SESSIONS_ID_ENDPOINT}      ${BASE_API_URL}/sessions/{id}
${RESET_SEATS_ENDPOINT}      ${BASE_API_URL}/sessions/{id}/reset-seats

# Reservations Endpoints
${RESERVATIONS_ENDPOINT}       ${BASE_API_URL}/reservations
${RESERVATIONS_ID_ENDPOINT}    ${BASE_API_URL}/reservations/{id}

# Test Users
${ADMIN_EMAIL}      admin@example.com
${ADMIN_PASSWORD}   password123
${USER_EMAIL}       user@example.com
${USER_PASSWORD}    password123