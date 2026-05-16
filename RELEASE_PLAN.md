# Release plan (semantic — epic ↔ minor)

Ordem dos épicos define a sequência **`v0.1.0`**, **`v0.2.0`**, … **Ship por épico** após histórias Done + UAT aceite ao nível acordado.

Formato-alvo por linha:

```text
Epic E1 — Nome curto (v0.1.0) — Σ PF ___ — N histórias — estimativa ~___ dias (ordem de grandeza)
Epic E2 — … (v0.2.0) — Σ PF ___ — …
```

## Linhas

| # | Epic | Versão | Σ PF | Histórias | Estimativa (~dias) | Estado |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | *(nome épico)* | v0.1.0 | | | | planeado |

---

**Commits:** Conventional Commits 1.0.0 — um por história/task/bugfix dentro do épico; tag **`v0.x.0`** no merge do épico para `main` quando política aplicável.

**Automação futura:** semantic-release-baby ou equivalente quando `package.json`/CI existirem.
