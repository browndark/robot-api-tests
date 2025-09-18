*** Settings ***
Library           RequestsLibrary
Library           Collections

*** Variables ***
${BASE_URL}       https://reqres.in
${USERS_PATH}     /api/users

*** Keywords ***
Create Reqres Session
    Create Session    reqres    ${BASE_URL}    headers={"Accept":"application/json"}    verify=${True}
