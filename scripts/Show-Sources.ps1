param(
    [Parameter(Mandatory=$true)] [string] $repoRoot
)

# Show nuget.config sources.
Write-Host "This repo's nuget.config contains the following sources:"
$configFile = Join-Path $repoRoot "nuget.config"
[xml] $configXml = Get-Content $configFile
$sources = $configXml.SelectNodes("//configuration/packageSources/add")
$sources | ft @{Label="Name"; Expression={$_.key}}, @{Label="Source"; Expression={$_.value}}