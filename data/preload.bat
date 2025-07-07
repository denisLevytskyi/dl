@echo off
color 2

set aimp=%~dp0AIMP\AIMP.exe

rmdir /s /q %~dp0AIMP\Profile >nul 2>&1
start "" "%aimp%"

timeout /t 30

taskkill /Im AIMP.exe /f /T >nul 2>&1
rmdir /s /q %~dp0AIMP\Profile >nul 2>&1