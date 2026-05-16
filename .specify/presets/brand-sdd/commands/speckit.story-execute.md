---
description: Execute one story with TDD emphasis — tests first where applicable; stays inside Spec-Kit workflow boundaries.
---

## User Input

```text
$ARGUMENTS
```

## Outline

1. **Identify story scope** from `$ARGUMENTS`, `BACKLOG.md`, or active `specs/<feature>/` directory. If unclear, ask one clarifying question.

2. **Align with Spec-Kit pipeline** when feature specs exist:
   - Prefer existing `spec.md` / `plan.md` / `tasks.md` under the feature dir.
   - If missing, invoke the equivalent of `/speckit-specify` → `/speckit-plan` → `/speckit-tasks` **only as far as needed** for this story slice (do not regenerate unrelated artifacts without cause).

3. **TDD loop** (mandatory where tests apply):
   - Add/adjust failing tests → implement → tests green → refactor.
   - Skip automated tests only when the story is genuinely non-automatable — state why in the reply.

4. **Implementation**: smallest change that satisfies the story; **Conventional Commits** scoped per story/task (atomic commits).

5. **Exit criteria**: relevant tests passing; story acceptance criteria addressed; note follow-ups if deferred.
