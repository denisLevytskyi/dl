@echo off
color 2

rem %1 - управляющая программа
rem %2 - поток
rem %3 - плеер
rem %4 - длительность воспроизведения

set nircmd=%~dp0NIRCMD\NIRCMD.exe

echo ====================
echo YOUR CURSOR IS BLOCKED...
%1 /Mute "%2"
%1 /SetVolume "%2" 0

setlocal enabledelayedexpansion
for /l %%i in (1, 1, %4) do (
    timeout /t 1 >nul 2>&1
    %nircmd% setcursor %%i %%i
    %1 /Unmute "%3"
    %1 /SetVolume "%3" 100
    echo %%i / %4
)
endlocal
exit