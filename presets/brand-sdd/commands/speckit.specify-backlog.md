---
description: Build versioned BACKLOG.md + RELEASE_PLAN.md from constitution and client assets (interactive).
---

## User Input

```text
$ARGUMENTS
```

## Preconditions

- Read `.specify/memory/constitution.md` and `AGENT.md`.
- If the user referenced external docs (SOW, PRD, brief), ask for paths or pasted excerpts **before** freezing scope.

## Outline

1. **Interactive clarification**: For each ambiguity that would change epic/story splits, ask **one question at a time** (dependency order). Prefer recommendations + alternatives (see project grill-me habit).

2. **Hierarchy** (project policy):
   - Milestone → may contain multiple epics.
   - Epic ↔ planned semantic version (`v0.1.0`, `v0.2.0`, …); epic order = version order.
   - Story: PF, BCP, SNAP, NFR live **on the story**. Epic aggregates sums.

3. **Estimation**: Do **not** invent PF/BCP numbers. If no counting method is chosen, use empty tables / placeholders and add one line to generated backlog: `Estimativa: método IFPUG/COSMIC/SNAP = A DEFINIR`.

4. **Write or update**:
   - `BACKLOG.md` — epics, stories, acceptance hints, PF/BCP/NFR placeholders.
   - `RELEASE_PLAN.md` — one row per epic: `Epic X (v0.Y.0) — Σ PF ___, N histórias, estimativa ~Z dias (ordem de grandeza).`

5. Ensure files are suitable to commit with **Conventional Commits** (e.g. `docs(backlog): …`).
