#!/usr/bin/env bash
set -euo pipefail

# Folder where this script lives
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
# Repo root is one level up
REPO_ROOT="$(cd -- "$SCRIPT_DIR/.." && pwd)"

cd "$REPO_ROOT"
docker build -t tempo .

# Bind-mount the repository into the container so edits are visible immediately
docker run --rm -it --mount type=bind,source="$(pwd)",target=/workspace/TEMPO -w /workspace/TEMPO tempo