*** Settings ***
Library           RequestsLibrary
Library           JSONLibrary
Library           Collections

*** Variables ***
${BASE_URL}       https://restful-booker.herokuapp.com
${AUTH_PATH}      /auth
${BOOKING_PATH}   /booking
${USERNAME}       admin
${PASSWORD}       password123
&{COMMON_HEADERS}    Content-Type=application/json    Accept=application/json
${TOKEN}          None

*** Keywords ***
Create Session To API
    Create Session    booking    ${BASE_URL}    headers=${COMMON_HEADERS}    verify=${True}

Get Auth Token
    ${payload}=    Create Dictionary    username=${USERNAME}    password=${PASSWORD}
    ${resp}=    POST On Session    booking    ${AUTH_PATH}    json=${payload}
    Should Be Equal As Integers    ${resp.status_code}    200
    ${token}=    Get Value From Json    ${resp.json()}    $.token
    Set Suite Variable    ${TOKEN}    ${token[0]}

Authorized Headers
    ${headers}=    Create Dictionary    Content-Type=application/json    Accept=application/json    Cookie=token=${TOKEN}
    [Return]    ${headers}

Build Booking Payload
    [Arguments]    ${firstname}=John    ${lastname}=Doe    ${totalprice}=111    ${depositpaid}=${True}    ${checkin}=2025-01-01    ${checkout}=2025-01-05    ${additionalneeds}=Breakfast
    ${dates}=    Create Dictionary    checkin=${checkin}    checkout=${checkout}
    ${payload}=    Create Dictionary
    ...    firstname=${firstname}
    ...    lastname=${lastname}
    ...    totalprice=${totalprice}
    ...    depositpaid=${depositpaid}
    ...    bookingdates=${dates}
    ...    additionalneeds=${additionalneeds}
    [Return]    ${payload}

Create Sample Booking
    [Arguments]    ${firstname}=John    ${lastname}=Doe
    ${payload}=    Build Booking Payload    ${firstname}    ${lastname}
    ${resp}=    POST On Session    booking    ${BOOKING_PATH}    json=${payload}
    Should Be Equal As Integers    ${resp.status_code}    200
    ${bookingid}=    Get Value From Json    ${resp.json()}    $.bookingid
    [Return]    ${bookingid[0]}
