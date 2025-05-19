@echo off
echo === Enabling ColdTurkey ===

:: Check for admin rights
net session >nul 2>&1
if %errorLevel% NEQ 0 (
    echo ============================================
    echo This script requires administrator privileges.
    echo Please right-click and select "Run as administrator".
    echo ============================================
    pause
    exit /b
)

if exist "C:\Program Files\Cold Turkey" (
    echo Found ColdTurkey Folder...
    cd "C:\Program Files\Cold Turkey"
) else (
    echo No ColdTurkey folder found.
    pause
    exit /b
)

echo Restoring old process names, to let a normal uninstallation...
rename ServiceHub.Power1.exe ServiceHub.Power.exe
rename ServiceHub.Helper1.exe ServiceHub.Helper.exe
rename CTMsgHostChrome1.exe CTMsgHostChrome.exe
rename CTMsgHostEdge1.exe CTMsgHostEdge.exe
rename CTMsgHostFirefox1.exe CTMsgHostFirefox.exe

echo Files successfully recovered, you can now uninstall Cold Turkey safely!
pause