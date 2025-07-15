rem %1 - имя файла
rem %2 - ожидание загрузки
rem %3 - длительность воспроизведения
rem %4 - кол-во повторов
rem %5 - тишина между повторами
rem %6 - тишина после воспроизведения

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

    start "" %unmute% %svv% %stream% %aimp% %3

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