---
description: Manual gate — compute impact on PF/BCP/timeline/milestones and propose adjustments; user decides what applies.
---

## User Input

```text
$ARGUMENTS
```

## Triggers (multi)

- End of milestone
- Manual invocation
- After CR registered/approved (analysis timing — **does not auto-apply** changes)

## Outline

1. Gather open CRs (`CHANGE_REQUESTS.md`), current `BACKLOG.md`, `RELEASE_PLAN.md`, and milestone status.

2. Produce an **impact section**:
   - PF/BCP deltas (placeholders if method undefined)
   - Milestones/epics affected
   - Timeline risk (ordinal magnitude only unless real velocity data exists)

3. Produce **proposed adjustments** as numbered options — **do not rewrite tracked files until the user picks**.

4. After user confirmation, apply edits to backlog/release docs and note decisions in chat.
