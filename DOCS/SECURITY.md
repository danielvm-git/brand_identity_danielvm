# Security guardrails

Baseline expectations for agents e contribuidores humanos:

- Não introduzir segredos em código ou commits — usar gestão de secrets da CI/host.
- Inputs externos (Markdown/URLs da marca, uploads futuros): validar como dados não confiáveis antes de execução ou embedding.
- Dependências Node/Nuxt quando existirem `package.json`: rever atualizações sensíveis.

Detalhar políticas específicas do cliente quando aplicável.
