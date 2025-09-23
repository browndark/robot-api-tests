*** Settings ***
Library           RequestsLibrary
Library           Collections
Library           OperatingSystem

*** Variables ***
${BASE_URL}       %{REQRES_BASE_URL=https://reqres.in}
${USERS_PATH}     /api/users
${REGISTER_PATH}  /api/register
${LOGIN_PATH}     /api/login
${API_KEY}        "YOUR_API_KEY"   # Substitua com a chave real

*** Keywords ***
Create Reqres Session
    # Remover variáveis de proxy para garantir que o ambiente não afete
    Remove Environment Variable    HTTP_PROXY
    Remove Environment Variable    HTTPS_PROXY
    Remove Environment Variable    http_proxy
    Remove Environment Variable    https_proxy

    # Incluir API Key nos headers
    &{headers}=    Create Dictionary    Accept=application/json    API-Key=${API_KEY}

    # Criar sessão com headers (incluindo a API Key)
    Create Session    reqres    ${BASE_URL}    headers=${headers}    verify=${True}
