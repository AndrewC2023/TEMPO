#!/usr/bin/evn bash
set -euo pipefail

# Folder where this script lives
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
# Repo root is one level up
REPO_ROOT="$(cd -- "$SCRIPT_DIR/.." && pwd)"

cd "$REPO_ROOT"
docker build -t tempo .
docker run --rm -it tempo