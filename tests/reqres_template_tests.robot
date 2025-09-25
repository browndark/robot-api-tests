*** Settings ***
Resource          ../resources/reqres_resource.robot
Test Setup        Create Reqres Session
Test Template     Criar usuário com sucesso

*** Test Cases ***            EMAIL                      PASSWORD
REG 1 - user válido A         eve.holt@reqres.in         pistol
REG 2 - user válido B         janet.weaver@reqres.in     pistol

*** Keywords ***
Criar usuário com sucesso
    [Arguments]    ${email}    ${password}
    [Tags]    regression    register
    &{payload}=    Create Dictionary    email=${email}    password=${password}
    ${resp}=       POST On Session    reqres    ${REGISTER_PATH}    json=${payload}    expected_status=any
    Should Be Equal As Integers    ${resp.status_code}    200
    Dictionary Should Contain Key   ${resp.json()}    id
    Dictionary Should Contain Key   ${resp.json()}    token
