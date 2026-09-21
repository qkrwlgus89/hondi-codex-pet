param([string]$SourceDir)
$ErrorActionPreference = 'Stop'
$petHome = if ($env:CODEX_HOME) { $env:CODEX_HOME } else { Join-Path $HOME '.codex' }
if (-not [IO.Path]::IsPathRooted($petHome)) { throw 'CODEX_HOME must be an absolute path.' }
$pets = Join-Path $petHome 'pets'
$target = Join-Path $pets 'hondi'
$stage = Join-Path $pets ('.hondi-install.' + [guid]::NewGuid().ToString('N'))
$lockPath = Join-Path $petHome '.hondi-install.lock'
$lock = $null
$backup = $null
New-Item -ItemType Directory -Force -Path $pets | Out-Null
try {
    $lock = [IO.File]::Open($lockPath, [IO.FileMode]::CreateNew, [IO.FileAccess]::Write, [IO.FileShare]::None)
    New-Item -ItemType Directory -Path $stage | Out-Null
    $sprite = Join-Path $stage 'spritesheet.png'
    if ($SourceDir) {
        Copy-Item -LiteralPath (Join-Path $SourceDir 'assets/hondi-spritesheet-v2.png') -Destination $sprite
    } else {
        [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
        Invoke-WebRequest -UseBasicParsing -TimeoutSec 180 -Uri 'https://raw.githubusercontent.com/qkrwlgus89/hondi-codex-pet/main/assets/hondi-spritesheet-v2.png' -OutFile $sprite
    }
    $expected = '8b2de2ac6ef0e65a03557fb95b2c25ba4c2b8b04747e55f8827241367cf62ace'
    if ((Get-FileHash -LiteralPath $sprite -Algorithm SHA256).Hash.ToLowerInvariant() -ne $expected) {
        throw 'Sprite checksum mismatch; existing pet was not changed.'
    }
    # ASCII source also works in Windows PowerShell 5.1; JSON escapes encode the Korean name.
    $manifest = @'
{
  "id": "hondi",
  "displayName": "\ud63c\ub514 (Hondi)",
  "description": "A Jeju dog that carries a tangerine and dozes off while sitting.",
  "spriteVersionNumber": 2,
  "spritesheetPath": "spritesheet.png"
}
'@
    [IO.File]::WriteAllText((Join-Path $stage 'pet.json'), $manifest, (New-Object Text.UTF8Encoding $false))
    if (Test-Path -LiteralPath $target) {
        if ((Get-Item -LiteralPath $target -Force).Attributes -band [IO.FileAttributes]::ReparsePoint) {
            throw "Refusing to replace symlink/junction: $target"
        }
        $oldManifest = Join-Path $target 'pet.json'
        $oldSprite = Join-Path $target 'spritesheet.png'
        if ((Test-Path -LiteralPath $oldManifest) -and (Test-Path -LiteralPath $oldSprite)) {
            $old = Get-Content -Raw -LiteralPath $oldManifest | ConvertFrom-Json
            $new = $manifest | ConvertFrom-Json
            if ($old.id -eq $new.id -and $old.displayName -eq $new.displayName -and $old.description -eq $new.description -and $old.spriteVersionNumber -eq 2 -and $old.spritesheetPath -eq 'spritesheet.png' -and (Get-FileHash -LiteralPath $oldSprite -Algorithm SHA256).Hash.ToLowerInvariant() -eq $expected) {
                Write-Output "Hondi is already installed: $target"
                return
            }
        }
        $backups = Join-Path $petHome 'pet-backups'
        New-Item -ItemType Directory -Force -Path $backups | Out-Null
        $backup = Join-Path $backups ('hondi.' + [guid]::NewGuid().ToString('N'))
        Move-Item -LiteralPath $target -Destination $backup
    }
    Move-Item -LiteralPath $stage -Destination $target
    Write-Output "Installed Hondi: $target"
    if ($backup) { Write-Output "Previous installation saved: $backup" }
    Write-Output 'Open Settings > Pets, refresh, and select Hondi. Restart the app if needed.'
} finally {
    if ($backup -and (Test-Path -LiteralPath $backup) -and -not (Test-Path -LiteralPath $target)) {
        Move-Item -LiteralPath $backup -Destination $target
    }
    if (Test-Path -LiteralPath $stage) { Remove-Item -LiteralPath $stage -Recurse -Force }
    if ($lock) { $lock.Dispose(); Remove-Item -LiteralPath $lockPath -Force }
}
