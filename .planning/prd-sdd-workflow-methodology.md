# PRD: Workflow SDD (Spec-Kit + XP + slicing estilo GSD-2)

Escopo deste PRD: **apenas** o que foi discutido para montar o método de trabalho — prompts, presets, backlog estimado, comandos operacionais, Git/release e integração pontual com GSD/GSD-2. **Não** inclui requisitos de produto do site em si (UI, temas, páginas), salvo onde o método exige **inventário de features do site** como input do backlog.

## Problem Statement

O fluxo nativo do **GitHub Spec-Kit** cobre bem specify/plan/implement, mas é **insuficiente** para uma operação completa em SDD: falta complemento com práticas **XP** (TDD, feedback curto, integração por história), **slicing de épicos e histórias** com visão de escopo (**BCP**, **NFR**, **pontos de função**, **SNAP**) no estilo **GSD-2**, disciplina formal de **bugfix** e **change request**, **gestão de escopo** quando o cliente ou a realidade mudam o plano, **controlo de Git** coerente por história com **ship por épico**, **UAT humano** (semântica **verify-work** do GSD) após testes, e **atualização de documentação e estado do projeto** ao fim dos ciclos. Sem isso, equipas que usam agentes (Claude Code, Cursor, etc.) não têm um **único playbook** nem um **prompt mestre** alinhado às boas práticas de prompting.

## Solution

Definir e **operacionalizar** um método híbrido:

1. **Spec-Kit** como camada principal de SDD (`specify`, constitution, templates, **[presets empilhados](https://github.github.io/spec-kit/reference/presets.html)** para fechar lacunas sem fork do core).
2. **XP como complemento conceitual** ( BPMN de referência em `https://github.com/danielvm-ciandt/bpmn-models` — workflows/xp ), expresso em políticas e comandos (TDD por história, commits pequenos), não cópia literal do XML.
3. **Backlog inicial**: épicos alinhados a versões planeadas (**v0.1.0**, **v0.2.0**, …); **histórias** são onde vivem contagens (**PF**, **BCP**, **SNAP**, **NFR**); **épico** agrega somas das histórias; milestones podem agrupar um ou mais épicos.
4. **Comandos dedicados** (preset ou equivalente): bugfix com template obrigatório; change request **só cliente**; gestão de escopo com **análise de impacto** e **aplicação manual** da alteração ao roadmap/backlog; relatórios **diários/semanais** para narrativa ao cliente; setup de ambiente antes do primeiro ciclo.
5. **Git**: **Conventional Commits**; construção **por história** (commits atómicos); **release plan semântico** por épico completado alinhado a referências tipo **semantic-release-baby**; ship por épico (PR → merge → tag), não obrigatoriamente uma release por cada história isolada em produção.
6. **Verificação**: após testes automatizados onde existirem, **passagem por UAT conversacional** alinhada ao **verify-work** do GSD.
7. **Ciclos**: ao fim de cada milestone/ciclo acordado, **actualizar artefactos** (status do projeto, documentos viventes referenciados pelo agente, ex.: entrada única tipo **AGENT.md** + docs satélite).
8. **Opcional**: explorar **tempos por tarefa** ao estilo GSD-2 para calibrar estimativas — decisão explícita se entra ou não no método (ver Implementation Decisions).

**Deliverable meta:** um **prompt mestre** (reutilizável) que instrua Claude/agentes a implementar ou rever este método com clareza, exemplos e restrições, seguindo boas práticas de prompting (objetivo explícito, papel, formato de saída, verificação).

Referências de ecossistema para consulta cruzada (não obrigatoriamente todas instaladas no mesmo repo): **BMAD-METHOD**, **CPS/Bok**, **GSD**, **GSD-2**, **spec-kit** (`/Users/me/Sites/` paths conforme clones locais).

## User Stories

### Método e agentes

1. Como responsável pelo método, quero Spec-Kit como base com presets por cima, para não reinventar specify/plan/implement.
2. Como responsável pelo método, quero lacunas cobertas por preset (comandos, templates), para padronizar o que o Spec-Kit não traz sozinho.
3. Como utilizador de agentes, quero um único documento de entrada para agentes (ex.: AGENT.md) e o resto referenciado noutros sítios, para não duplicar texto eternamente.
4. Como utilizador de agentes, quero um comando de **setup de ambiente** antes do primeiro ciclo, para falhar cedo em invariantes e avisar em dependências opcionais.

### Backlog e escopo

5. Como PO/técnico, quero um backlog em épicos com **todas as features do produto** (ex.: site) **sliced** como no GSD-2, para ver trabalho em fatias verticais.
6. Como PO/técnico, quero **BCP** e **NFR** no backlog inicial onde fizer sentido.
7. Como PO/técnico, quero **pontos de função** e **SNAP** ao nível da **história**, com **épico** como soma, para ter uma **visão do tamanho do escopo** antes de executar (sem inventar números até método de contagem estar escolhido).
8. Como PO/técnico, quero **release plan** semântico (**v0.1.0**, **v0.2.0**, …) alinhado à ordem dos épicos.

### Fluxo de trabalho

9. Como desenvolvedor, quero **TDD** forte à volta da execução (antes/durante **implement**), para XP estar real no código.
10. Como desenvolvedor, quero fluxo **lean** agrupável por presets quando fizer sentido, para não sufocar em cerimónia.

### Bugfix, CR, escopo

11. Como desenvolvedor, quero um comando de **bugfix** que produza defeito estruturado com secções **### Error Summary**, **### Root Cause**, **### Fix Applied**, **### Prevention**, **### Test Coverage**, para rastreabilidade.
12. Como desenvolvedor, quero que **se os testes passarem** se feche o bug e se faça **commit** do resultado (**### Commit** / mensagem conventional), para uma unidade de trabalho auditável por defeito.
13. Como gestor de projeto, quero comando de **change request** para pedidos formais do **cliente**.
14. Como gestor de projeto, quero **gestão de escopo** quando o escopo muda (ex.: fim de etapa/milestone, disparo manual, ou após CR registada), que **calcule impacto** mas **não aplique** mudanças ao plano sem decisão humana explícita.

### Git e releases

15. Como equipa, quero **controlo inteligente de Git** na construção de cada **história** (branches/commits coerentes com política).
16. Como equipa, quero **ship por épico** (integração/release minor planeada por épico), não confundir com commits diários por história.

### Verificação e documentação

17. Como equipa, quero usar **human UAT** ao estilo **verify-work** do GSD **no fim do teste** da fatia/milestone acordada.
18. Como equipa, quero que **documentos e estado do projeto** sejam actualizados **ao fim dos ciclos**, para agentes e humanos partilharem o mesmo modelo mental.

### Métricas

19. Como melhoria contínua, quero avaliar integração da funcionalidade do **GSD-2** que regista **tempos por tarefa**, para rever estimativas — **opcional** e explicitamente decidido se faz parte do método ou só do tooling.

## Implementation Decisions

- **Spec-Kit + presets**: presets empilhados para comandos que não existem no core; usar documentação oficial de presets para prioridade e resolução de ficheiros.
- **XP**: incorporado como disciplina de execução e testes, inspirado em material BPMN público (repositório de modelos agile), sem obrigar ferramenta BPMN no dia-a-dia.
- **GSD/GSD-2**: adoptar **verify-work** e padrões de slice/reporting onde útil; restante CLI/workflows opcionais por projeto.
- **BMAD / CPS**: referências de domínio e governança; adopção integral do BMAD não é requisito deste PRD.
- **Estimativa PF/BCP/SNAP**: definir método de contagem antes de preencher números reais; placeholders aceitáveis até lá.
- **Git e semver**: Conventional Commits; política de branch por história vs épico documentada no método; tags **v0.x.0** por épico quando aplicável; automação tipo semantic-release-baby quando o repo tiver tooling compatível.
- **Escopo CR**: apenas cliente inicia CR formal; agentes não substituem esse canal para mudanças contratuais.
- **Scope management**: gatilhos múltiplos permitidos; modo **manual** para aplicar mudanças ao backlog/release plan após análise.

## Testing Decisions

- **Testes do método**: validar que cada comando produz artefactos esperados (templates preenchidos, ficheiros versionados, políticas no AGENT.md).
- **Testes de produto** do site ficam **fora** deste PRD salvo onde uma história de backlog explicitamente os exija.

## Out of Scope

- Implementação detalhada de páginas, temas ou conteúdo do site (exceto como linhas genéricas no backlog quando “features do site” forem inventariadas).
- Escolha obrigatória de IDE específico além de **pelo menos um** ambiente agent-ready.
- Auditoria CPS ou certificação PMI.

## Further Notes

- O **melhor prompt possível** para Claude executar esta tarefa é **deliverable separado** mas derivado deste PRD: papel, contexto, lista de comandos, políticas Git/UAT/CR, formato de backlog e verificação — não deve misturar requisitos de UI do produto final.
- Referência externa útil para mindset da pilha agentica (camadas tooling): artigos tipo “agentic coding stack”; opcional para o comando de setup.
- Repo **bpmn-models**: fonte de inspiração para XP; URL canónica do projeto de modelos: `https://github.com/danielvm-ciandt/bpmn-models`.

---

## Annex: comandos Spec-Kit, presets e artefactos por fase

Referência consolidada para implementação do método e dos presets. **Comandos de agente** usam o prefixo **`/speckit.*`** conforme integração instalada pelo `specify init` (Claude, Copilot, Gemini, …); nomes exactos podem variar ligeiramente com o adaptador — os ficheiros fonte vivem em `.specify/templates/commands/` (núcleo) ou nos presets instalados.

### A. CLI `specify` (não são slash commands; invariantes do projeto)

| Comando | Função |
|--------|--------|
| `specify init` | Cria estrutura `.specify/`, templates, scripts e integração com agente ([core docs](https://github.github.io/spec-kit/reference/core.html)). |
| `specify check` | Verifica ferramentas (ex.: git, agentes CLI). |
| `specify version` | Versão do CLI. |
| `specify preset search \| add \| remove \| list \| info \| resolve \| enable \| disable \| set-priority` | Catálogo e pilha de presets ([presets](https://github.github.io/spec-kit/reference/presets.html)). |
| `specify extension search \| add \| …` | Extensões (comandos extra, templates extra). |
| `specify workflow run \| resume \| status \| list \| add \| remove \| search \| info \| catalog …` | Workflows YAML encadeados ([workflows](https://github.github.io/spec-kit/reference/workflows.html)). |

### B. Comandos slash **originais** do Spec-Kit (templates em `spec-kit/templates/commands/`)

Estes são o conjunto típico documentado no [Quick Start](https://github.github.io/spec-kit/quickstart.html) e nos templates do repositório oficial.

| Slash | Descrição resumida |
|-------|---------------------|
| `/speckit.constitution` | Cria/atualiza princípios do projeto em `.specify/memory/constitution.md`. |
| `/speckit.specify` | Gera/atualiza especificação da feature; cria pasta sob `specs/<feature-dir>/`, `spec.md`, ramo/feature conforme política. |
| `/speckit.clarify` | Refina ambiguidades no `spec.md`. |
| `/speckit.checklist` | Gera checklists de qualidade de requisitos (tipicamente em `specs/<feature-dir>/checklists/` quando aplicável). |
| `/speckit.plan` | Gera plano técnico a partir do spec + constitution (`setup-plan` script); artefactos listados na secção D. |
| `/speckit.tasks` | Deriva `tasks.md` a partir do plano e artefactos de design. |
| `/speckit.analyze` | **Análise só de leitura** entre `spec.md`, `plan.md`, `tasks.md` — saída principalmente **relatório na conversação** (não substitui ficheiros por defeito). |
| `/speckit.implement` | Executa implementação guiada por `tasks.md` (+ scripts de pré-requisitos). |
| `/speckit.taskstoissues` | Converte tasks em issues GitHub (template `taskstoissues.md`; requer MCP/contexto GitHub). |

### C. Comandos núcleo **potencialmente sobrepostos** por preset

**Templates** (spec, plan, constitution, checklist, tasks, …): resolução **em tempo de execução**, pilha: overrides locais → presets (prioridade mais baixa ganha) → extensões → núcleo `.specify/templates/` ([presets — File Resolution](https://github.github.io/spec-kit/reference/presets.html)). Verificar qual ficheiro ganha: `specify preset resolve <nome-do-template>`.

**Comandos** (Markdown das instruções do agente): copiados/registados **à instalação** do preset; vários presets podem coexistir — quem prevalece na prática depende da ordem de instalação e da integração (documentação: «Unlike templates, command overrides are applied **at install time**» em `spec-kit/presets/README.md`).

**Exemplo oficial — preset `lean`** (repo Spec-Kit): fornece **substitutos completos** dos comandos (mesmos nomes slash), não merge incremental:

| Ficheiro no preset `lean` | Slash sobreposto |
|---------------------------|------------------|
| `presets/lean/commands/speckit.constitution.md` | `/speckit.constitution` |
| `presets/lean/commands/speckit.specify.md` | `/speckit.specify` |
| `presets/lean/commands/speckit.plan.md` | `/speckit.plan` |
| `presets/lean/commands/speckit.tasks.md` | `/speckit.tasks` |
| `presets/lean/commands/speckit.implement.md` | `/speckit.implement` |

Ou seja: **`clarify`**, **`checklist`**, **`analyze`**, **`taskstoissues`** continuam normalmente **do núcleo**, salvo outro preset/extensão que também os forneça.

### D. Artefactos gerados **por fase** (pipeline SDD Spec-Kit típico)

Caminhos genéricos usam `<feature-dir>` (= pasta da feature sob `specs/`, alinhada ao branch ou `.specify/feature.json`). Alguns passos dependem de scripts (`setup-plan.sh`, `check-prerequisites`, …).

| Fase | Comando principal | Artefactos / saídas esperadas |
|------|---------------------|-------------------------------|
| **Projeto** | `specify init` | Árvore `.specify/` (templates, scripts, comandos registados no agente), integração escolhida. |
| **Constituição** | `/speckit.constitution` | `.specify/memory/constitution.md`; pode exigir sincronização de templates dependentes (ver outline do comando). |
| **Especificação** | `/speckit.specify` | `specs/<feature-dir>/spec.md`; ramificação Git ou entrada em `.specify/feature.json`; estrutura de diretório da feature. |
| **Clarificação** | `/speckit.clarify` | Actualização iterativa de `spec.md`. |
| **Checklists de requisitos** | `/speckit.checklist` | Ficheiros de checklist sob o diretório da feature (ex.: `specs/<feature-dir>/checklists/*.md`). |
| **Plano técnico** | `/speckit.plan` | `specs/<feature-dir>/plan.md`; frequentemente **`research.md`**, **`data-model.md`**, pasta **`contracts/`**, **`quickstart.md`** (Phases 0–1 no outline do comando plan). |
| **Tarefas** | `/speckit.tasks` | `specs/<feature-dir>/tasks.md` (lista executável). |
| **Análise** | `/speckit.analyze` | Relatório estruturado (consistência entre os três artefactos); **sem escrita** obrigatória em disco. |
| **Implementação** | `/speckit.implement` | Alterações no código-fonte conforme `tasks.md`; validação de checklists incompletos conforme política do comando. |
| **Tasks → Issues** | `/speckit.taskstoissues` | Issues criadas no GitHub (externo ao repo local). |

### E. Extensões opcionais do ecossistema Spec-Kit (não são núcleo SDD)

Exemplo no repo oficial: extensão **git** (`spec-kit/extensions/git/commands/`) — comandos como **`speckit.git.initialize`**, **`speckit.git.feature`**, **`speckit.git.commit`**, **`speckit.git.remote`**, **`speckit.git.validate`** (prefixo depende do registo na integração). Só aplicável se `specify extension add git` (ou equivalente) estiver instalado.

### F. Comandos **novos** planeados pelo método deste PRD (preset/custom — **não** fazem parte do Spec-Kit núcleo)

Estes endereçam lacunas explicitadas nas User Stories (setup, backlog macro, XP/UAT, CR, escopo, relatórios). Nomes podem seguir convenção do preset (ex.: prefixo `/workflow.*` ou `/sdd.*`); abaixo os nomes de trabalho deste PRD:

| Comando planeado | Função |
|------------------|--------|
| `/workflow.setup` (ou equivalente) | Checklist por camadas + política FAIL/WARN + opcional `.workflow-setup.yml`. |
| `/specify.backlog` (ou equivalente) | Backlog interativo + `BACKLOG.md` / YAML + `RELEASE_PLAN.md`. |
| `/story.execute` (ou equivalente) | Encapsula TDD + implementação no contexto da história / Spec-Kit. |
| `/bugfix.dev` | Template do defeito + commit único ao fechar. |
| `/change-request` | CR apenas cliente → encaminhamento scope management. |
| `/scope-management` | Impacto (PF/BCP/timeline) + proposta; aplicação **manual**. |
| `/daily-report` / `/weekly-report` | Markdown versionado para stakeholder. |

**GSD `verify-work`**: não é comando Spec-Kit; referência como **passo humano UAT** após testes (workflow BPMN e política no `AGENT.md` quando existir tooling GSD).
