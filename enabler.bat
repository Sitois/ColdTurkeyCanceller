@echo off
echo === Enabling ColdTurkey ===

:: Going though the Cold Turkey directory
cd "C:\Program Files\Cold Turkey"

:: Restoring old process names, to let a normal uninstallation
rename ServiceHub.Power1.exe ServiceHub.Power.exe
rename ServiceHub.Helper1.exe ServiceHub.Helper.exe
rename CTMsgHostChrome1.exe CTMsgHostChrome.exe
rename CTMsgHostEdge1.exe CTMsgHostEdge.exe
rename CTMsgHostFirefox1.exe CTMsgHostFirefox.exe

echo Files successfully recovered, you can now uninstall Cold Turkey.