---
name: speckit-daily-report
description: "Daily stakeholder narrative \u2014 markdown under DOCS/reports/ or .gsd/reports/."
compatibility: Requires spec-kit project structure with .specify/ directory
metadata:
  author: github-spec-kit
  source: preset:brand-sdd
---

# Speckit Daily Report Skill

## User Input

```text
$ARGUMENTS
```

## Outline

1. Resolve reporting window from `$ARGUMENTS` or default to **today** (timezone from user if stated).

2. Collect since last report: merged commits (Conventional Commits summaries), open/closed bugs if tracked, CR states from `CHANGE_REQUESTS.md`, blockers.

3. Metrics: PF/BCP cumulative only if recorded — otherwise **omit invented numbers**.

4. Write `DOCS/reports/daily/YYYY-MM-DD.md` (create dirs). If project uses `.gsd/reports/` instead, follow `AGENT.md` pointer.

5. Keep tone stakeholder-facing — not raw git dump.
