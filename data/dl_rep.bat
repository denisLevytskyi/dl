set /p stream=<%~dp0var_stream.txt
set svv=%~dp0SVV\SVV.exe
set aimp=%~dp0AIMP\AIMP.exe
set unmute=%~dp0unmute.bat

%svv% /Mute "%stream%"
%svv% /SetVolume "%stream%" 0

setlocal enabledelayedexpansion
for /l %%i in (1, 1, %4) do (
    rmdir /s /q %~dp0AIMP\Profile >nul 2>&1
    start "" "%aimp%" "%~dp0_records\%1"

    echo ====================
    echo START...
    timeout /t %2

    start %unmute% %svv% %aimp% %3

    echo ====================
    echo STEP %%i / %4...
    timeout /t %3

    taskkill /Im AIMP.exe /f /T >nul 2>&1
    rmdir /s /q %~dp0AIMP\Profile >nul 2>&1

    echo ====================
    echo PAUSE %%i / %4...
    timeout /t %5
)
endlocal

echo ====================
echo END...
timeout /t %6

%svv% /Unmute "%stream%"
%svv% /SetVolume "%stream%" 100