#
# This script is used by GitLab-CI with powershell "shell" executor to build and test Uranium in a
# Windows cura-build-environment docker image.
#
# This is needed at the moment because the "docker-windows" executor doesn't seem to work.
# See https://gitlab.com/gitlab-org/gitlab-runner/issues/4385
#

# Stop once an error is encountered
$ErrorActionPreference = "Stop"

$dockerImage = "registry.gitlab.com/ultimaker/cura/cura-build-environment:windows-core-1809"

$repoRoot = Join-Path $PSScriptRoot -ChildPath ".." -Resolve

& docker run `
  --volume ${repoRoot}:C:\git-repo `
  --env GIT_REPO_DIR=C:\git-repo `
  $dockerImage cmd /c C:\git-repo\docker\build_in_docker.cmd
