*** Settings ***
Resource          ../resources/reqres_resource.robot
Test Setup        Create Reqres Session

*** Test Cases ***
GET - Listar usuários página 2
    [Tags]    smoke    get
    &{params}=    Create Dictionary    page=2
    ${resp}=      GET On Session    reqres    ${USERS_PATH}    params=${params}    expected_status=any
    Should Be Equal As Integers    ${resp.status_code}    200
    Dictionary Should Contain Key   ${resp.json()}    data
    Should Not Be Empty             ${resp.json()["data"]}
