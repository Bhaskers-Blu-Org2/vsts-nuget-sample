Param(
    [Parameter(Mandatory=$true)] [string] $repoRoot
)

$ErrorActionPreference = "Stop"

# Create the .tools directory
New-Item -ItemType Directory -Force -Path "$repoRoot\.tools" | Out-Null
$toolsDir = Join-Path -Resolve $repoRoot ".tools"

# Ensure nuget.exe is up-to-date
$nugetDownloadName = "nuget.exe"
$nugetDest = . "$PSScriptRoot\Initialize-DownloadLatest.ps1" -OutDir $toolsDir -DownloadUrl "https://dist.nuget.org/win-x86-commandline/latest/nuget.exe" -DownloadName $nugetDownloadName -Unzip $false

# Add the tools dir to the path
if (!($env:Path -like "*$toolsDir;*"))
{
    $env:Path = "$toolsDir;" + $env:Path
}

# Ensure VSS.NuGet.AuthHelper is up-to-date
$authHelperDownloadFeed = "https://nuget.org/api/v2/"
$authHelperPackageName = "Microsoft.VisualStudio.Services.NuGet.AuthHelper"
$authHelperExeName = "VSS.NuGet.AuthHelper.exe"

$authHelperDest = . "$PSScriptRoot\Initialize-InstallFromNuget.ps1" -OutDir $toolsDir -DownloadFeed $authHelperDownloadFeed -PackageName $authHelperPackageName -targetFileName $authHelperExeName

# Add VSS.NuGet.AuthHelper to the path
if (!($env:Path -like "*$authHelperDest;*"))
{
    $env:Path = "$authHelperDest;" + $env:Path
}