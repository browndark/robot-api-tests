*** Settings ***
Library           RequestsLibrary
Library           Collections

*** Variables ***
${BASE_URL}       %{REQRES_BASE_URL=https://reqres.in}    # permite override por env var
${USERS_PATH}     /api/users
${REGISTER_PATH}  /api/register
${LOGIN_PATH}     /api/login

*** Keywords ***
Create Reqres Session
    &{headers}=    Create Dictionary    Accept=application/json
    Create Session    reqres    ${BASE_URL}    headers=${headers}    verify=${True}
