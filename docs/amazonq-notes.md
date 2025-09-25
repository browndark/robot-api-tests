# Amazon Q – Notas de uso (branch refinamento/amazonq)

## Onde o Amazon Q ajudou (efetivo)
- **Geração de template** `Test Template` para data-driven (`reqres_template_tests.robot`).
  - *Prompt usado:* “Create a Robot Framework test template for Reqres registration with email/password table and positive assertions.”
- **Refatoração** de payloads `Create Dictionary` e inclusão de `expected_status=any` para evitar `HTTPError`.
  - *Prompt:* “Why Robot raises HTTPError 401 and how to assert status code manually using RequestsLibrary?”
- **Sugestão** de parametrização por variável de ambiente (`%{REQRES_BASE_URL=...}`).

## Onde não ajudou / limitações
- **Detalhes de semântica do Robot 7** (ex.: `RETURN` sem colchetes) – precisei confirmar em docs.
- **Mensagens vagas** quando pedi para “corrigir tudo” de uma vez; melhor pedir mudanças **pequenas e específicas**.
- **Contexto do projeto**: às vezes sugere pastas que não existem; precisei ajustar caminhos manualmente.

## Lições
- Prompts curtos e objetivos funcionam melhor.
- Validar cada sugestão em execução real antes de commitar.
