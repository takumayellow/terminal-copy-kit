param(
  [switch]$InstallExtensions = $true
)

Write-Host "Applying VS Code terminal copy workspace settings..." -ForegroundColor Cyan

$workspaceRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $workspaceRoot

if ($InstallExtensions) {
  Write-Host "Installing VS Code extension ArturoDent.repeat-commands" -ForegroundColor Cyan
  code --install-extension ArturoDent.repeat-commands | Out-Null
}

Write-Host "Done. Open VS Code in this folder (code .) and use Alt+C after running a command." -ForegroundColor Green
