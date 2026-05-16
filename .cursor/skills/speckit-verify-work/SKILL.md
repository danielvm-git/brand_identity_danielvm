---
name: speckit-verify-work
description: "Conversational UAT gate after automated tests \u2014 refuses silent\
  \ closure on failures (GSD verify-work analogue)."
compatibility: Requires spec-kit project structure with .specify/ directory
metadata:
  author: github-spec-kit
  source: preset:brand-sdd
---

# Speckit Verify Work Skill

## User Input

```text
$ARGUMENTS
```

## Outline

1. Confirm automated tests / lint for the current milestone slice are green (run project commands from `AGENT.md` / `DOCS/TESTING.md`).

2. Walk acceptance criteria **with the user** story-by-story (or milestone checklist). Ask short verification questions — one topic at a time when ambiguity blocks sign-off.

3. On any failure: log as **UAT defect**, branch or ticket per project rules, route through `/speckit-bugfix-dev` (skill `speckit-bugfix-dev`) pattern — **do not** mark milestone epics Done.

4. On acceptance: summarize what was verified and record evidence pointers (paths, screenshots if applicable).

5. If `.gsd/` verify automation exists elsewhere in org, mention linking — this repo uses conversational gate unless wired.
