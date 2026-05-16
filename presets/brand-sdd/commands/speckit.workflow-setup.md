---
description: Verify the five-layer agentic stack for this repo — PASS / WARN / FAIL per AGENT.md.
---

## User Input

```text
$ARGUMENTS
```

## Outline

1. From the repository root, run **exactly**:

   ```bash
   bash scripts/workflow-setup.sh
   ```

2. Interpret the result:
   - **Exit 0**: no FAIL lines. WARN lines are acceptable — summarize them for the user.
   - **Exit 1**: at least one FAIL — list each FAIL and the remediation string printed by the script.

3. Optionally cross-check `.workflow-setup.yml` (`require_git_remote`, `required_mcp`, `optional_mcp`) and explain what is **not** machine-verifiable (MCP availability requires Cursor/UI).

4. Do not claim MCP servers are online without evidence.
