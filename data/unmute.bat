@echo off
color 2

rem %1 - управляющая программа
rem %2 - поток
rem %3 - плеер
rem %4 - длительность воспроизведения

echo [%date% %time%] UNMUTE %1 %2 %3 %4 >> %~dp0_log.txt

set /p cursor_block=<%~dp0var_cursor_block.txt
set nircmd=%~dp0NIRCMD\NIRCMD.exe

if %cursor_block%==1 (
    echo ====================
    echo YOUR CURSOR IS BLOCKED...
)
%1 /Mute "%2"
%1 /SetVolume "%2" 0

setlocal enabledelayedexpansion
for /l %%i in (1, 1, %4) do (
    if %cursor_block%==1 (
        start "" %nircmd% setcursor %%i %%i
    )
    timeout /t 1 >nul 2>&1
    %1 /Unmute "%3"
    %1 /SetVolume "%3" 100
    echo %%i / %4
)
endlocal
exit