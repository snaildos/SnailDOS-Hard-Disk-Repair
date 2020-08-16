@echo off
title Updater
echo Success. Moving to temp.
cd %temp%
del Installer.exe
echo We need curl!
del Curl.exe

curl -LO https://raw.githubusercontent.com/snaildos/SnailDOS-Hard-Disk-Repair/master/Dependencies/SystemTrayNotification.bat
xcopy Installer.exe %Temp%
del Installer.exe
echo Processing executable....
echo Launching EXE
call SystemTrayNotification.bat   -tooltip warning -time 6000 -title "Updater" -text "Ready for update Select yes on the UAC prompt for the update to start." -icon question
start %temp%/Installer.exe
echo Ready!
echo It's up to you to install now, cya next time!
pause
cls
exit
