@echo off
echo === Disabling Cold Turkey ===

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

:: Going though the Cold Turkey directory
if exist "C:\Program Files\Cold Turkey" (
    echo Found ColdTurkey Folder...
    cd "C:\Program Files\Cold Turkey"
) else (
    echo No ColdTurkey folder found.
    pause
    exit /b
)

echo Stopping Cold Turkey processes...
taskkill /f /im ServiceHub.Power.exe >nul 2>&1
taskkill /f /im ServiceHub.Helper.exe >nul 2>&1
taskkill /f /im CTMsgHostChrome.exe >nul 2>&1
taskkill /f /im CTMsgHostEdge.exe >nul 2>&1
taskkill /f /im CTMsgHostFirefox.exe >nul 2>&1

echo Renaming Cold Turkey Process names to prevent them from restarting...
rename ServiceHub.Power.exe ServiceHub.Power1.exe
rename ServiceHub.Helper.exe ServiceHub.Helper1.exe
rename CTMsgHostChrome.exe CTMsgHostChrome1.exe
rename CTMsgHostEdge.exe CTMsgHostEdge1.exe
rename CTMsgHostFirefox.exe CTMsgHostFirefox1.exe

echo Removing Cold Turkey launch-at-startup registry keys...
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v ServiceHub /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v ColdTurkey /f >nul 2>&1
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v ColdTurkey /f >nul 2>&1

echo Cold Turkey is now disabled, press any key to close this tab!
pause