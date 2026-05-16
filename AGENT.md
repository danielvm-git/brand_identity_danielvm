# AGENT.md — Single entrypoint for coding agents

Read this first. Detailed specs live elsewhere; here are **policies**, **paths**, and **how to run the method**.

## Polaris / north star

Product intent and success criteria: **`DOCS/POLARIS.md`**. Update when scope shifts.

## Guardrails & engineering baseline

| Topic | Location |
| --- | --- |
| Security expectations | `DOCS/SECURITY.md` |
| Architecture overview & decisions | `DOCS/ARCHITECTURE.md` |
| Testing baseline (what must exist before Done) | `DOCS/TESTING.md` |

Use dated snapshots under `DOCS/` when you adopt `_LATEST` + dated snapshot rotation — mirror paths referenced there.

## Spec-Kit core (upstream)

This repo uses **[GitHub Spec Kit](https://github.github.io/spec-kit/)**. Generated layout:

- **Memory**: `.specify/memory/constitution.md`
- **Templates**: `.specify/templates/` (override via `.specify/templates/overrides/` per [preset resolution](https://github.github.io/spec-kit/reference/presets.html))
- **Scripts**: `.specify/scripts/bash/` (feature branches, prerequisites checks)
- **Extensions**: `.specify/extensions/git/` — provides `speckit.git.*` skills
- **Installed preset**: `.specify/presets/brand-sdd/` (source: `presets/brand-sdd/` in git)

Resolve which file wins when debugging stack order:

```bash
specify preset resolve plan-template.md
```

## Custom SDD preset (this repo)

**Source preset (versioned):** `presets/brand-sdd/` — reinstall with:

```bash
uvx --from git+https://github.com/github/spec-kit.git specify preset add --dev ./presets/brand-sdd --priority 15
```

**Why some command names use hyphens:** Spec-Kit only auto-registers Cursor skills for commands named `speckit.<one-segment>` (e.g. `speckit.workflow-setup`). Names like `speckit.foo.bar` are reserved for extension overrides — see preset `commands/` files and `preset.yml` note.

### Slash / skill mapping (Cursor)

| Intent | Invoke (Cursor skill) |
| --- | --- |
| Environment & five-layer stack check | `/speckit-workflow-setup` |
| Interactive backlog + release plan | `/speckit-specify-backlog` |
| One story: TDD + implement + tests | `/speckit-story-execute` |
| Bugfix with post-mortem + one commit | `/speckit-bugfix-dev` |
| Client change request log | `/speckit-change-request` |
| Scope impact analysis (manual apply) | `/speckit-scope-management` |
| Daily stakeholder report | `/speckit-daily-report` |
| Weekly stakeholder report | `/speckit-weekly-report` |
| Conversational UAT gate | `/speckit-verify-work` |

**Bundled Spec-Kit workflow:** `/speckit-constitution`, `/speckit-specify`, `/speckit-plan`, `/speckit-tasks`, `/speckit-implement`, optional `/speckit-clarify`, `/speckit-analyze`, `/speckit-checklist`.

### Milestone loop (lean)

1. **Plan:** `/speckit-plan` (+ tasks) — user approves `PLAN.md`-style breakdown per policy.
2. **Execute:** `/speckit-story-execute` or `/speckit-implement`; **TDD per story** where applicable (`DOCS/TESTING.md`).
3. **Verify:** automated checks then **`/speckit-verify-work`** (conversational UAT). Failures → bugfix path, not silent Done.
4. **Epic ship:** CR sweep via **`/speckit-scope-management`** when needed → PR → merge → **semver tag per epic** (`RELEASE_PLAN.md`).

### XP complements

Pair programming / CI discipline / continuous integration by story — operationalized via tests-first + atomic commits + UAT gate above.

### GSD / GSD-2 usage

Use **`verify-work`** semantics via **`/speckit-verify-work`**. Full GSD CLI/workflows are optional — adopt `.gsd/` only if you wire tooling later.

### Semantic versioning & releases

**Épico ↔ planned `v0.x.0`.** Ship epic-by-epic (not necessarily every story to prod alone). Follow **[Conventional Commits 1.0.0](https://www.conventionalcommits.org/en/v1.0.0/#specification)** for all commits.

Automation reference (when Node tooling exists): **[semantic-release-baby](https://github.com/esfreitas/semantic-release-baby)** or equivalent — configure outside `AGENT.md`.

### Scope rules

- **Change Requests:** logged in **`CHANGE_REQUESTS.md`** — client-only formal control (`/speckit-change-request`).
- **Bugs:** hybrid automation + manual; **one conventional commit per merged bugfix** when tests pass.

### Estimation (PF / BCP / SNAP)

**Estimativa: método IFPUG/COSMIC/SNAP = A DEFINIR** until governance chooses counting rules. Stories carry PF/BCP/NFR rows in **`BACKLOG.md`** — no invented complexity numbers.

## Backlog & releases

| Artifact | Purpose |
| --- | --- |
| `BACKLOG.md` | Epics → stories → placeholders for PF/BCP/NFR |
| `RELEASE_PLAN.md` | Epic ↔ semver (`v0.1.0`, …), aggregates |
| `CHANGE_REQUESTS.md` | Formal CR queue |

Generated interactively via **`/speckit-specify-backlog`** from constitution + client inputs.

## Reports (stakeholder narration)

Auto/semi-auto markdown under **`DOCS/reports/`** (`daily/` and `weekly/`). Alternative: `.gsd/reports/` if GSD tracing is adopted — pick one team-wide.

## Five-layer agentic stack (`/speckit-workflow-setup`)

Aligned to methodology → discipline → tech context → token/context hygiene → product surface. Machine checks live in **`scripts/workflow-setup.sh`** + **`.workflow-setup.yml`**.

### Failure policy

| Severity | Meaning |
| --- | --- |
| **FAIL** | Fix before claiming Ready — Spec-Kit dirs missing, `AGENT.md` missing, constitution missing, policy presets missing per YAML, optional `require_git_remote` unmet |
| **WARN** | Allowed — optional MCP offline, layers 3–4 tooling absent locally, PF method undefined |

Run:

```bash
bash scripts/workflow-setup.sh
```

## Bundle agentico (adaptação CI&T slide)

| Layer | Este projeto |
| --- | --- |
| Ferramenta no IDE | Cursor + Agent |
| Método | Spec-Kit + preset `brand-sdd` + constitution-driven backlog |
| MCP | Opcional — see `.workflow-setup.yml`; projeto não obriga MCP para build |
| Delegação | Slash commands / skills em `.cursor/skills/`; delegar histórias completas via `/speckit-story-execute`; gates via `/speckit-verify-work` |

---

**Repos de referência (fora deste workspace):** BMAD-METHOD, CPSBok, get-shit-done (GSD), gsd-2, spec-kit — usar como inspiração; **políticas efetivas estão aqui e em `DOCS/`**.
