param(
    [Parameter(Mandatory=$true)] [string] $repoRoot
)

. "$PSScriptRoot\Show-Sources.ps1" -RepoRoot $repoRoot