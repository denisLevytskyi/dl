@echo off
color 2

set /p stream=<%~dp0var_stream.txt
set svv=%~dp0SVV\SVV.exe
set aimp=%~dp0AIMP\AIMP.exe
set unmute=%~dp0unmute.bat

rmdir /s /q %~dp0AIMP\Profile >nul 2>&1
start "" "%aimp%" "%~dp0_records\%1"

%svv% /Mute "%stream%"
%svv% /SetVolume "%stream%" 0

timeout /t %2

start %unmute% %svv% %aimp% %3

timeout /t %3

taskkill /Im AIMP.exe /f /T >nul 2>&1
rmdir /s /q %~dp0AIMP\Profile >nul 2>&1

timeout /t %4

%svv% /Unmute "%stream%"
%svv% /SetVolume "%stream%" 100