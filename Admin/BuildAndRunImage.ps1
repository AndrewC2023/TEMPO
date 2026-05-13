$repoRoot = Resolve-Path (Join-Path $PSScriptRoot '..')
Push-Location $repoRoot

docker build -t tempo .
if ($LASTEXITCODE -ne 0) { Pop-Location; exit $LASTEXITCODE }

# Bind-mount the repository into the container so edits are visible immediately
$source = (Get-Location).Path
docker run --rm -it --mount type=bind,source="$source",target=/workspace/TEMPO -w /workspace/TEMPO tempo

Pop-Location