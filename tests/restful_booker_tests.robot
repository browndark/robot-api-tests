*** Settings ***
Resource          ../resources/restful_booker_resource.robot
Test Setup        Create Session To API

*** Test Cases ***
GET - Listar bookings
    ${resp}=    GET On Session    booking    ${BOOKING_PATH}
    Should Be Equal As Integers    ${resp.status_code}    200
    ${data}=    Set Variable    ${resp.json()}
    Should Not Be Empty    ${data}

AUTH - Obter token válido
    Get Auth Token
    Should Not Be Equal    ${TOKEN}    None

POST - Criar booking válido
    ${id}=    Create Sample Booking    Jane    Smith
    Should Not Be Equal As Integers    ${id}    0

PUT - Atualizar booking com autorização
    Get Auth Token
    ${headers}=    Authorized Headers
    ${id}=    Create Sample Booking    Alice    Brown
    ${payload}=    Build Booking Payload    AliceUpdated    Brown    222    ${True}    2025-02-01    2025-02-06    Dinner
    ${resp}=    PUT On Session    booking    ${BOOKING_PATH}/${id}    headers=${headers}    json=${payload}
    Should Be Equal As Integers    ${resp.status_code}    200
    Should Be Equal    ${resp.json()["firstname"]}    AliceUpdated

DELETE - Excluir booking com autorização
    Get Auth Token
    ${headers}=    Authorized Headers
    ${id}=    Create Sample Booking    Mark    Lee
    ${resp}=    DELETE On Session    booking    ${BOOKING_PATH}/${id}    headers=${headers}
    Should Be Equal As Integers    ${resp.status_code}    201
