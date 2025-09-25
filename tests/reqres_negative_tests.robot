*** Settings ***
Resource          ../resources/reqres_resource.robot
Test Setup        Create Reqres Session

*** Test Cases ***
LOGIN - Credenciais inválidas retornam 400
    [Tags]    negative    login
    &{payload}=    Create Dictionary    email=fake@reqres.in    password=wrong
    ${resp}=       POST On Session    reqres    ${LOGIN_PATH}    json=${payload}    expected_status=any
    Log To Console    LOGIN status: ${resp.status_code}
    Log To Console    LOGIN body: ${resp.text}
    Run Keyword If    ${resp.status_code} == 401    Skip    Bloqueado por proxy/VPN (401 em POST)
    Should Be Equal As Integers    ${resp.status_code}    400
    Dictionary Should Contain Key   ${resp.json()}    error

REGISTER - Sem senha retorna 400
    [Tags]    negative    register
    &{payload}=    Create Dictionary    email=eve.holt@reqres.in
    ${resp}=       POST On Session    reqres    ${REGISTER_PATH}    json=${payload}    expected_status=any
    Log To Console    REG status: ${resp.status_code}
    Log To Console    REG body: ${resp.text}
    Run Keyword If    ${resp.status_code} == 401    Skip    Bloqueado por proxy/VPN (401 em POST)
    Should Be Equal As Integers    ${resp.status_code}    400
    Dictionary Should Contain Key   ${resp.json()}    error

LOGIN - Credenciais inválidas retornam 400
    [Tags]    negative    login
    &{payload}=    Create Dictionary    email=fake@reqres.in    password=wrong
    &{headers}=    Create Dictionary    Accept=application/json    API-Key=your_api_key_here
    ${resp}=       POST On Session    reqres    ${LOGIN_PATH}    json=${payload}    headers=${headers}    expected_status=any
    Log To Console    LOGIN status: ${resp.status_code}
    Log To Console    LOGIN body: ${resp.text}
    Run Keyword If    ${resp.status_code} == 401    Skip    Bloqueado por proxy/VPN (401 em POST)
    Should Be Equal As Integers    ${resp.status_code}    400
    Dictionary Should Contain Key   ${resp.json()}    error

