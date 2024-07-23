@echo off
color 2

setlocal enabledelayedexpansion
for /l %%i in (1, 1, %3) do (
    timeout /t 1 >nul 2>&1
    %1 /Unmute "%2"
    %1 /SetVolume "%2" 100
    echo %%i
)
endlocal
exit