# sqs_lib.py
import boto3

def criar_fila(nome_fila):
    """Cria uma fila no SQS e retorna a URL"""
    sqs = boto3.client('sqs', region_name='us-east-1')
    response = sqs.create_queue(QueueName=nome_fila)
    return response['QueueUrl']

def enviar_mensagem(queue_url, mensagem):
    """Envia uma mensagem para a fila"""
    sqs = boto3.client('sqs', region_name='us-east-1')
    sqs.send_message(QueueUrl=queue_url, MessageBody=mensagem)

def receber_mensagem(queue_url):
    """Recebe mensagens da fila"""
    sqs = boto3.client('sqs', region_name='us-east-1')
    messages = sqs.receive_message(QueueUrl=queue_url)
    return messages.get('Messages', [])

