#!/usr/bin/env bash
# Ajoute la config rtk (hooks Claude Code) à un dépôt. Idempotent.
# Usage : bash setup-repo.sh /chemin/du/depot
set -euo pipefail
HERE=$(cd "$(dirname "$0")" && pwd)
REPO=${1:?usage: setup-repo.sh <dossier du depot>}
cd "$REPO"

mkdir -p .claude/hooks
install -m 755 "$HERE/template/.claude/hooks/rtk-setup.sh" .claude/hooks/rtk-setup.sh
install -m 755 "$HERE/template/.claude/hooks/rtk-hook.sh" .claude/hooks/rtk-hook.sh

SET=.claude/settings.json
[ -s "$SET" ] || echo '{}' > "$SET"
SETUP='bash "$CLAUDE_PROJECT_DIR"/.claude/hooks/rtk-setup.sh'
HOOK='bash "$CLAUDE_PROJECT_DIR"/.claude/hooks/rtk-hook.sh'
tmp=$(mktemp)
jq --indent 2 --arg s "$SETUP" --arg h "$HOOK" '
  def has_cmd($ev; $c): any((.hooks[$ev] // [])[]?.hooks[]?; .command == $c);
  .hooks //= {}
  | if has_cmd("SessionStart"; $s) then . else
      .hooks.SessionStart = ((.hooks.SessionStart // []) + [{hooks: [{type: "command", command: $s, timeout: 90}]}]) end
  | if has_cmd("PreToolUse"; $h) then . else
      .hooks.PreToolUse = ((.hooks.PreToolUse // []) + [{matcher: "Bash", hooks: [{type: "command", command: $h}]}]) end
' "$SET" > "$tmp" && mv "$tmp" "$SET"

LINE='- rtk actif (hook) : sortie Bash compressée auto. Sortie brute : `rtk bypass <cmd>`. Read/Grep/Glob non concernés.'
if [ -f CLAUDE.md ] && ! grep -q 'rtk actif' CLAUDE.md; then
  printf '\n%s\n' "$LINE" >> CLAUDE.md
fi
echo "rtk configuré dans $(pwd)"
