# Checklist — validação do plano final (método SDD)

Use ao **fechar** a implementação do método ou antes de declarar o trabalho completo. Marque cada item só quando existir **evidência** no repo ou nos comandos (ficheiro, skill, política documentada, ou demo registada).

**Legenda:** `[ ]` pendente · `[x]` validado · `N/A` explícito no plano com razão

---

## A. Spec-Kit como base + lacunas por preset

- [ ] Repositório inicializado com **Spec-Kit** (`specify init` ou equivalente documentado).
- [ ] **Presets empilhados** cobrem o que o core não traz; existe forma de ver prioridade/resolução (ex.: `specify preset list`, `specify preset resolve <nome>`).
- [ ] Documentação oficial de presets referenciada onde fizer sentido: https://github.github.io/spec-kit/reference/presets.html

---

## B. XP como complemento (via BPMN / boas práticas)

- [ ] Disciplina **XP** está escrita na política do método (TDD por história, feedback curto, integração contínua por história — não só lista de ferramentas).
- [ ] Inspiração **BPMN XP** declarada sem obrigar cópia literal do XML — referência ao catálogo público: https://github.com/danielvm-ciandt/bpmn-models (`workflows/xp` ou README equivalente).

---

## C. Backlog e slicing (estilo GSD-2)

- [ ] Backlog está organizado em **épicos** com **todas as features do produto** relevantes **sliced** em histórias verticais (não só uma lista plana).
- [ ] **História** é a unidade onde existem contagens (**PF**, **BCP**, **SNAP**, **NFR** onde aplicável).
- [ ] **Épico** agrega contagens das histórias (soma ou política documentada equivalente).
- [ ] **Não há números inventados**: método IFPUG/COSMIC/SNAP ou política explícita de placeholder até método escolhido.
- [ ] **Release plan** semântico documentado (**v0.1.0**, **v0.2.0**, …) alinhado à **ordem dos épicos**.
- [ ] **Geração interativa** do backlog a partir de constitution + artefactos cliente (SOW, brief, PRD, etc.) está definida ou implementada como comando/workflow.

---

## D. Milestones, relatórios e cliente

- [ ] **Milestones** podem agrupar um ou mais épicos (regra documentada).
- [ ] Existe fluxo para **relatório diário** e/ou **semanal** (artefacto versionado, ex.: markdown em pasta de reports).
- [ ] Relatórios servem **narrativa de evolução** para stakeholders (não só dump de git).

---

## E. Comandos operacionais (preset / skills / slash)

Confirme que cada um existe, está documentado em `AGENT.md` (ou entrada única equivalente), e tem comportamento verificável.

- [ ] **Setup de ambiente** antes do primeiro ciclo (PASS / WARN / FAIL; invariantes vs opcional).
- [ ] **Backlog interativo** (constitution + inputs cliente).
- [ ] **Execução por história** com ênfase **TDD** antes/durante implement (nome alinhado ao teu preset, ex. story-execute).
- [ ] **Bugfix** com secções obrigatórias: `### Error Summary`, `### Root Cause`, `### Fix Applied`, `### Prevention`, `### Test Coverage`, e fluxo para **### Commit** se testes passarem.
- [ ] **Change request** — apenas **pedidos formais do cliente** (não misturado com tarefas internas).
- [ ] **Gestão de escopo** com **gatilhos** acordados (fim de etapa, manual, após CR) e modo **manual** para aplicar mudanças ao backlog/release plan (não auto-replanear sem decisão humana).
- [ ] **Relatório diário** e **semanal** (podem ser um ou dois comandos).
- [ ] **verify-work / UAT humano** ao fim dos testes da fatia/milestone (semântica GSD).

---

## F. Git, Conventional Commits e ship por épico

- [ ] Política de **Conventional Commits** 1.0.0 referenciada e seguida nos exemplos: https://www.conventionalcommits.org/en/v1.0.0/#specification
- [ ] **Controlo por história** documentado (branches/commits atómicos conforme política do repo).
- [ ] **Ship por épico**: integração/release alinhada a **v0.x.0** por épico (PR → merge → tag quando política aplicável), distinto de “cada história vai sozinha a produção”.
- [ ] Referência a **semantic-release-baby** (ou equivalente) para automação futura quando existir tooling Node/CI compatível.

---

## G. Documentação viva e entrada única para agentes

- [ ] Existe **entrada única** para agentes (ex.: **AGENT.md** na raiz) com caminhos para o resto; conteúdo longo não duplicado sem necessidade.
- [ ] **Documentos satélite** referenciados (Polaris/norte, arquitectura, segurança, testes — ou estrutura equivalente `DOCS/`).
- [ ] Ao fim de ciclos/milestones, o plano descreve **o que atualizar** (status do projecto + documentos viventes).

---

## H. GSD / GSD-2 (pontual)

- [ ] **verify-work** ou equivalente está integrado ao fluxo de teste/UAT.
- [ ] **Tempos por tarefa** (feature GSD-2): há **decisão explícita** “faz parte do método” vs “opcional/tooling apenas” vs “fora de escopo” — referenciada na documentação.

---

## I. Ecossistema de referência (sem obrigar instalação única)

O plano ou `AGENT.md` **menciona** onde consultar (ou paths locais quando existirem):

- [ ] **spec-kit**
- [ ] **GSD** / **GSD-2**
- [ ] **BMAD-METHOD** (referência)
- [ ] **CPS/Bok** (referência)

---

## J. Prompt mestre e boas práticas Claude

- [ ] Existe **prompt mestre** (ficheiro ou secção) derivado do PRD: papel, contexto, comandos, políticas Git/UAT/CR, formato de backlog, verificação — **sem** misturar requisitos de UI do produto final.
- [ ] O prompt segue boas práticas: objetivo explícito, entregáveis, restrições, formato de saída, como verificar sucesso.

---

## K. Extras da discussão (mindset pilha agentica / bundle)

- [ ] Comando de **setup** considera camadas úteis (metodologia → disciplina → contexto técnico → tokens → superfície), sem exigir instalar todas as ferramentas do ecossistema — referência opcional: mindset “agentic coding stack”.
- [ ] **Falhas bloqueantes vs avisos** (ex.: MCP obrigatório vs opcional) documentadas ou em ficheiro de configuração do setup.

---

## Fecho

- [ ] Todos os itens marcados `[x]` ou `N/A` com nota curta *(ex.: “N/A — não uso GSD-2 timing”)*.
- [ ] Data e responsável pela validação: _______________

---

**Rastreio ao PRD:** este checklist cobre as user stories **1–19** do ficheiro `prd-sdd-workflow-methodology.md` e os itens da secção Solution/Implementation Decisions.
