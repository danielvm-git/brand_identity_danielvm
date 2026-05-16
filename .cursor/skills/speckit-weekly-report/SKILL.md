---
name: speckit-weekly-report
description: "Weekly stakeholder rollup \u2014 markdown under DOCS/reports/weekly/."
compatibility: Requires spec-kit project structure with .specify/ directory
metadata:
  author: github-spec-kit
  source: preset:brand-sdd
---

# Speckit Weekly Report Skill

## User Input

```text
$ARGUMENTS
```

## Outline

1. Determine ISO week or date range from `$ARGUMENTS` or ask one clarifying question.

2. Aggregate daily deltas if present; otherwise summarize commits/milestones/UAT outcomes from conversation + repo state.

3. Include velocity **only** if time logs exist (e.g. GSD-2 style); else qualitative pace only.

4. Write `DOCS/reports/weekly/YYYY-Www.md` or `YYYY-MM-DD--YYYY-MM-DD.md`.

5. Surface CR backlog age and risks explicitly.
