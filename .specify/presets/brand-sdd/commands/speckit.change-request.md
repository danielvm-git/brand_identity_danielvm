---
description: Formal client-only change request — accumulate without rewriting backlog until approved.
---

## User Input

```text
$ARGUMENTS
```

## Outline

1. Confirm this change was **requested by the client / product owner** (not internal scope creep). If not, refuse to log as CR — redirect to internal backlog discussion.

2. Append to `CHANGE_REQUESTS.md` with:
   - ID (increment), date, source, summary, requested-by, status (`registered` default).
   - Link or pointer to evidence (email ref, ticket ID).

3. State explicitly: backlog / RELEASE_PLAN **do not** change until `/speckit-scope-management` (or manual decision) incorporates this CR after approval.

4. List triggers when CR should feed scope analysis: end of milestone, manual review, or immediately after approval for **impact analysis only**.
