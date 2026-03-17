# Run PowerShell as Administrator

$ErrorActionPreference = "Stop"

function Test-Administrator {
    $currentUser = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = New-Object Security.Principal.WindowsPrincipal($currentUser)
    return $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

if (-not (Test-Administrator)) {
    Write-Error "Run this script in PowerShell as Administrator."
    exit 1
}

Write-Host "Checking Chocolatey..."

$chocoInstalled = $null -ne (Get-Command choco -ErrorAction SilentlyContinue)

if (-not $chocoInstalled) {
    Write-Host "Chocolatey not found. Installing..."

    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = `
        [System.Net.ServicePointManager]::SecurityProtocol -bor 3072

    Invoke-Expression (
        (New-Object System.Net.WebClient).DownloadString(
            'https://community.chocolatey.org/install.ps1'
        )
    )
}
else {
    Write-Host "Chocolatey is already installed."
}

$chocoBin = "C:\ProgramData\chocolatey\bin"
if (Test-Path $chocoBin) {
    $env:Path += ";$chocoBin"
}

Write-Host "Installing packages..."
$packages = @(
    "git",
    "winfetch"
)

foreach ($package in $packages) {
    Write-Host "Installing $package ..."
    choco install $package -y --no-progress
}

Write-Host "Refreshing PATH for current session..."
$machinePath = [Environment]::GetEnvironmentVariable("Path", "Machine")
$userPath    = [Environment]::GetEnvironmentVariable("Path", "User")
$env:Path = "$machinePath;$userPath"

Write-Host ""
Write-Host "Done."
Write-Host "Check versions:"
Write-Host "  choco -v"
Write-Host "  git --version"
Write-Host "  winfetch"
