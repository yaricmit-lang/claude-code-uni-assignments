#!/usr/bin/env bash
# One-shot local setup: Python env, paper-search tools, humanizer skill, .mcp.json.
# Usage: ./setup.sh        (needs python3 >= 3.10 and git)
set -euo pipefail
cd "$(dirname "$0")"
ROOT="$(pwd)"

echo "==> Project Python env (venv/)"
python3 -m venv venv
venv/bin/python -m pip install --quiet --upgrade pip
venv/bin/python -m pip install --quiet -r requirements.txt

echo "==> Academic search tools (tools/mcp-venv/)"
mkdir -p tools
python3 -m venv tools/mcp-venv
tools/mcp-venv/bin/python -m pip install --quiet --upgrade pip
tools/mcp-venv/bin/python -m pip install --quiet paper-search-mcp arxiv-mcp-server

echo "==> Humanizer skill (blader/humanizer, MIT)"
if [ ! -d tools/humanizer ]; then
  git clone --quiet --depth 1 https://github.com/blader/humanizer.git tools/humanizer
fi
mkdir -p .claude/skills/humanizer
cp tools/humanizer/SKILL.md .claude/skills/humanizer/SKILL.md

echo "==> .mcp.json"
sed "s|<PROJECT_ROOT>|${ROOT}|g" .mcp.json.example > .mcp.json

echo
echo "Done. Start Claude Code from this folder:  cd \"${ROOT}\" && claude"
