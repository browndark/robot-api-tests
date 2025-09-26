*** Settings ***
Library    sqs_lib.py
Suite Setup    Criar Fila Inicial

*** Variables ***
${QUEUE_URL}    None

*** Keywords ***
Criar Fila Inicial
    ${QUEUE_URL}=    Criar Fila    RobotTestQueue
    Set Suite Variable    ${QUEUE_URL}

*** Test Cases ***
Enviar Mensagem SQS
    Enviar Mensagem    ${QUEUE_URL}    Mensagem do Robot Framework

Receber Mensagem SQS
    ${mensagens}=    Receber Mensagem    ${QUEUE_URL}
    Log    ${mensagens}
