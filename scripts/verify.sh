#!/usr/bin/env bash
# Single entrypoint for local + agent "fast test" verification.
# Same marker defaults as `pyproject.toml` (`not (tool or slow or mujoco)`).
# Organization CI (`ci-complete`) adds coverage, mypy, and runs on self-hosted + ROS image — see `.github/workflows/ci.yml`.
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO_ROOT"

echo "================================================================"
echo " verify.sh @ $REPO_ROOT"
echo " host: $(uname -srm)"
echo "================================================================"

echo ">>> [1/2] uv sync --extra all"
uv sync --extra all
echo "<<< OK"

echo ">>> [2/2] uv run pytest dimos (fast tests per pyproject addopts)"
uv run pytest dimos
echo "<<< OK"

echo "verify.sh: all steps passed."
