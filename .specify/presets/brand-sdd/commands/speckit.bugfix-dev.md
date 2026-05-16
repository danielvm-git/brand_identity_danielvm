---
description: Bugfix with mandatory post-mortem sections and a single conventional commit when tests pass.
---

## User Input

```text
$ARGUMENTS
```

## Outline

1. Reproduce or infer failure from `$ARGUMENTS` and codebase evidence.

2. Before fixing, draft (in chat or temp notes) these sections:

### Error Summary

### Root Cause

### Fix Applied

### Prevention

### Test Coverage

3. Implement the fix; add/update tests proving the fix.

4. When tests pass, produce **one commit** with Conventional Commits format, e.g. `fix(scope): short description`.

5. If CI/automation exists, ensure it would stay green — do not invent CI commands not present in the repo.
