$repoRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
Push-Location $repoRoot
docker build -t tempo .
if ($LASTEXITCODE -ne 0) { Pop-Location; exit $LASTEXITCODE }
docker run --rm -it tempo
Pop-Location