*** Settings ***
Resource          ../resources/reqres_resource.robot
Test Setup        Create Reqres Session

*** Test Cases ***
LOGIN - Credenciais inválidas retornam 400
    [Tags]    negative    login
    &{payload}=    Create Dictionary    email=fake@reqres.in    password=wrong
    ${resp}=       POST On Session    reqres    ${LOGIN_PATH}    json=${payload}    expected_status=any
    Should Be Equal As Integers    ${resp.status_code}    400
    Dictionary Should Contain Key   ${resp.json()}    error

REGISTER - Sem senha retorna 400
    [Tags]    negative    register
    &{payload}=    Create Dictionary    email=eve.holt@reqres.in
    ${resp}=       POST On Session    reqres    ${REGISTER_PATH}    json=${payload}    expected_status=any
    Should Be Equal As Integers    ${resp.status_code}    400
    Dictionary Should Contain Key   ${resp.json()}    error
