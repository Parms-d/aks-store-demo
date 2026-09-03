#!/usr/bin/env bash
# Install GitHub Spec Kit into this workspace and sync ICM-authored governance into it.
#
# Authored content lives outside .specify/ so that `specify init` and future
# upgrades can never clobber it. This script is the one-way sync into Spec Kit's
# managed directory, and it is safe to re-run after every upgrade.
#
# Usage: scripts/bootstrap-speckit.sh [integration]
#   integration defaults to "cursor". Others: copilot, claude, gemini, generic, ...

set -euo pipefail

INTEGRATION="${1:-cursor}"
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

log() { printf '\033[1;34m==>\033[0m %s\n' "$1"; }
warn() { printf '\033[1;33mwarn:\033[0m %s\n' "$1" >&2; }
die() { printf '\033[1;31merror:\033[0m %s\n' "$1" >&2; exit 1; }

if ! command -v specify >/dev/null 2>&1; then
  warn "specify CLI not found."
  cat <<'EOF'

Install it first:

  uv tool install specify-cli --from git+https://github.com/github/spec-kit.git@vX.Y.Z

Replace vX.Y.Z with the latest tag from https://github.com/github/spec-kit/releases
Then re-run this script.

EOF
  die "missing dependency: specify"
fi

if [ -d .specify ]; then
  log "Spec Kit already initialized; skipping init."
else
  log "Initializing Spec Kit (integration: $INTEGRATION)"
  specify init --here --force --non-interactive --integration "$INTEGRATION"
fi

log "Syncing constitution -> .specify/memory/constitution.md"
mkdir -p .specify/memory
cp icm/memory/constitution.md .specify/memory/constitution.md

log "Syncing template overrides -> .specify/templates/overrides/"
mkdir -p .specify/templates/overrides
cp icm/speckit/overrides/*.md .specify/templates/overrides/

log "Done."
cat <<EOF

Synced:
  .specify/memory/constitution.md        <- icm/memory/constitution.md
  .specify/templates/overrides/          <- icm/speckit/overrides/

Edit the sources, not the copies, then re-run this script.

Next:
  Lane A   /speckit.specify <what to build>
  Lane B   see icm/ops/CONTEXT.md
EOF
