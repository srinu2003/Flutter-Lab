# PowerShell script to build APKs for selected Flutter experiments

$ErrorActionPreference = 'Stop'

$experiments = @(
    'exp_2_a',
    'exp_2_b',
    'exp_3_a',
    'exp_3_b',
    'exp_4_a',
    'exp_4_b',
    'exp_5_b',
    'exp_6_a',
    'exp_6_b',
    'exp_7_a',
    'exp_7_b',
    'exp_8_a',
    'exp_8_b',
    'exp_9_b'
)

$root = Split-Path -Parent $MyInvocation.MyCommand.Definition
$buildOutputDir = Join-Path $root 'build-output'
if (-not (Test-Path $buildOutputDir)) {
    New-Item -ItemType Directory -Path $buildOutputDir | Out-Null
}

foreach ($exp in $experiments) {
    $path = Join-Path $root $exp
    if (Test-Path (Join-Path $path 'pubspec.yaml')) {
        Write-Host "`nBuilding APK for $exp..." -ForegroundColor Cyan
        Push-Location $path
        try {
            flutter clean | Out-Null
            flutter pub get --no-example | Out-Null
            # flutter build apk --pub

            # # Copy APK to build-output/<project_name>.apk
            # $apkSource = Join-Path $path 'build\app\outputs\flutter-apk\app-release.apk'
            # $apkDest = Join-Path $buildOutputDir "$exp.apk"
            # if (Test-Path $apkSource) {
            #     Copy-Item $apkSource $apkDest -Force
            #     Write-Host "APK copied to $apkDest" -ForegroundColor Green
            # } else {
            #     Write-Host "APK not found for $exp" -ForegroundColor Yellow
            # }
            # flutter clean | Out-Null
            # flutter pub get --no-example | Out-Null


        } catch {
            Write-Host ("Failed to build {0}: {1}" -f $exp, $_) -ForegroundColor Red
        }
        Pop-Location
    } else {
        Write-Host "Skipping $exp (no pubspec.yaml found)" -ForegroundColor Yellow
    }
}

Write-Host "`nAll builds attempted. Check above for any errors." -ForegroundColor Green
