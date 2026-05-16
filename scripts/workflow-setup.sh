#!/usr/bin/env bash
# Agentic stack verification — FAIL/WARN per AGENT.md ("Política de falhas").
# Exit 0 = no FAIL (WARN may still print); exit 1 = at least one FAIL.

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

FAIL=0
WARN=0

log_fail() { echo "[FAIL] $*" >&2; FAIL=1; }
log_warn() { echo "[WARN] $*" >&2; WARN=1; }
log_pass() { echo "[PASS] $*"; }

CONF="${ROOT}/.workflow-setup.yml"

require_git_remote=false
if [[ -f "$CONF" ]]; then
  rg="$(grep -E '^require_git_remote:' "$CONF" 2>/dev/null | awk '{print $2}' || true)"
  [[ "$rg" == "true" ]] && require_git_remote=true
fi

# Layer 1 — Methodology (Spec-Kit / constitution present)
if [[ ! -d "${ROOT}/.specify" ]]; then
  log_fail ".specify/ missing — run: uvx --from git+https://github.com/github/spec-kit.git specify init --here --integration cursor-agent --force"
else
  log_pass "Layer 1: .specify/ present"
fi

if [[ ! -f "${ROOT}/.specify/memory/constitution.md" ]]; then
  log_fail ".specify/memory/constitution.md missing — run skill /speckit-constitution"
else
  log_pass "Layer 1: constitution file exists"
fi

# Layer 2 — Discipline & entrypoint (AGENT.md mandatory)
if [[ ! -f "${ROOT}/AGENT.md" ]]; then
  log_fail "AGENT.md missing at repo root"
else
  log_pass "Layer 2: AGENT.md present"
fi

# Layer 3 — Technical context (project-specific)
if [[ ! -f "${ROOT}/package.json" ]] && [[ ! -f "${ROOT}/pnpm-lock.yaml" ]] && [[ ! -f "${ROOT}/yarn.lock" ]]; then
  log_warn "No package.json / lockfile at root — JS toolchain not detected (OK if intentional)."
else
  log_pass "Layer 3: Node manifest detected"
fi

if [[ -f "${ROOT}/nuxt.config.ts" ]] && [[ ! -f "${ROOT}/package.json" ]]; then
  log_warn "nuxt.config.ts without package.json — incomplete Node/Nuxt bootstrap?"
fi

# Git remote (optional policy)
if [[ "$require_git_remote" == true ]]; then
  if ! git -C "$ROOT" remote get-url origin &>/dev/null; then
    log_fail "Git remote origin required by .workflow-setup.yml but not configured"
  else
    log_pass "Git remote origin configured"
  fi
fi

# Presets expected by policy (after `specify preset add`)
if [[ -f "$CONF" ]] && grep -q '^require_presets:' "$CONF"; then
  RP=()
  while IFS= read -r line; do
    RP+=("$line")
  done < <(awk '/^require_presets:/{f=1;next} f&&/^-/{sub(/^-[[:space:]]*/,"");print;next} f&&/^[^[:space:]#-]/{exit}' "$CONF")
  for preset_id in "${RP[@]}"; do
    [[ -z "$preset_id" ]] && continue
    [[ "$preset_id" =~ ^# ]] && continue
    if [[ ! -d "${ROOT}/.specify/presets/${preset_id}" ]]; then
      log_fail "Preset '${preset_id}' not installed under .specify/presets/ — run: uvx specify preset add --dev ./presets/${preset_id}"
    else
      log_pass "Preset '${preset_id}' installed"
    fi
  done
fi

# MCP offline — best-effort (cannot ping MCP servers from shell reliably)
log_warn "MCP connectivity not validated here — verify optional MCP in Cursor settings if needed."

echo "---"
if [[ "$FAIL" -ne 0 ]]; then
  echo "Result: FAIL ($WARN WARN printed)"
  exit 1
fi
echo "Result: OK (${WARN} WARN)"
exit 0
