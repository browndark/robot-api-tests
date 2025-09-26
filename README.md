# API Tests (Robot Framework)

## Requisitos
- Python 3.10+
- Windows PowerShell

## Setup
```ps1
python -m venv venv
.\venv\Scripts\Activate.ps1
pip install -r requirements.txt

# Atualização Robot Framework - AWS SQS

## Descrição da Atualização
Esta atualização adiciona testes automatizados utilizando o Robot Framework para interação com filas AWS SQS. 

Foram implementadas as seguintes funcionalidades:

- Criação de fila SQS (`Criar Fila SQS`)
- Envio de mensagem para a fila (`Enviar Mensagem SQS`)
- Recebimento de mensagem da fila (`Receber Mensagem SQS`)
- Integração com AWS Boto3, utilizando as credenciais configuradas no AWS CLI ou variáveis de ambiente.

## Estrutura do Projeto
- `test_sqs.robot` → arquivo com os testes do Robot Framework.
- `sqs_lib.py` → biblioteca Python utilizada pelos testes, contendo funções para criar fila, enviar e receber mensagens.
- `README.md` → este arquivo.

## Observações
- As credenciais AWS devem estar configuradas corretamente para que os testes funcionem.
- A URL da fila é armazenada em uma variável compartilhada entre os testes.
- O projeto foi testado no Windows PowerShell, mas também pode ser executado no AWS CloudShell online.
