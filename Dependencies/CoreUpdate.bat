@echo off
title Update

if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)

cd %temp%
$url = "https://github.com/snaildos/SnailDOS-Hard-Disk-Repair/raw/master/Dependencies/Curl/curl.exe"
$output = "$PSScriptRoot\Curl.exe"
$start_time = Get-Date

Invoke-WebRequest -Uri $url -OutFile $output
Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"
Echo Curl downloaded.

$url = "https://raw.githubusercontent.com/snaildos/SnailDOS-Hard-Disk-Repair/master/Dependencies/Curl/curl-ca-bundle.crt"
$output = "$PSScriptRoot\curl-ca-bundle.crt"
$start_time = Get-Date

Invoke-WebRequest -Uri $url -OutFile $output
Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"

Echo Dowloaded cert.

$url = "https://raw.githubusercontent.com/snaildos/SnailDOS-Hard-Disk-Repair/master/Dependencies/Curl/libcurl.def"
$output = "$PSScriptRoot\libcurl.def"
$start_time = Get-Date

Invoke-WebRequest -Uri $url -OutFile $output
Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"

Echo downloaded def file

$url = "https://github.com/snaildos/SnailDOS-Hard-Disk-Repair/raw/master/Dependencies/Curl/libcurl.dll"
$output = "$PSScriptRoot\libcurl.dll"
$start_time = Get-Date

Invoke-WebRequest -Uri $url -OutFile $output
Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"

Echo Done. Downloading core exec.

echo Please wait we are downloading the executable...
curl -LO https://github.com/snaildos/SnailDOS-Hard-Disk-Repair/raw/master/Installer.exe
call SystemTrayNotification.bat   -tooltip warning -time 6000 -title "Updater" -text "This software wants to update, Please select yes on the UAC prompt for the older version of the software to uninstall." -icon question
start Installer.exe
echo Done.
exit


