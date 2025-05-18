@echo off
echo === Disabling Cold Turkey ===

:: Going though the Cold Turkey directory
cd "C:\Program Files\Cold Turkey"

:: Killing Cold Turkey process
taskkill /f /im ServiceHub.Power.exe >nul 2>&1
taskkill /f /im ServiceHub.Helper.exe >nul 2>&1
taskkill /f /im CTMsgHostChrome.exe >nul 2>&1
taskkill /f /im CTMsgHostEdge.exe >nul 2>&1
taskkill /f /im CTMsgHostFirefox.exe >nul 2>&1

:: Renaming Cold Turkey Process names, preventing them to launch again
rename ServiceHub.Power.exe ServiceHub.Power1.exe
rename ServiceHub.Helper.exe ServiceHub.Helper1.exe
rename CTMsgHostChrome.exe CTMsgHostChrome1.exe
rename CTMsgHostEdge.exe CTMsgHostEdge1.exe
rename CTMsgHostFirefox.exe CTMsgHostFirefox1.exe

:: Remove Cold Turkey's start-at-startup key from regedit, preventing cold turkey to start at startup.
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v ServiceHub /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v ColdTurkey /f >nul 2>&1
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v ColdTurkey /f >nul 2>&1

echo Cold Turkey is now disabled !
pause