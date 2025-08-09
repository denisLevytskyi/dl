rem %1 - имя файла
rem %2 - ожидание загрузки
rem %3 - длительность воспроизведения
rem %4 - кол-во повторов
rem %5 - тишина между повторами
rem %6 - тишина после воспроизведения

echo [%date% %time%] DL-REP START %1 %2 %3 %4 %5 %6 >> %~dp0_log.txt

set aimp=%~dp0AIMP\AIMP.exe
set switch=%~dp0switch.bat
set switch_path=%~dp0var_switch.txt

start "" %switch%

setlocal enabledelayedexpansion
for /l %%i in (1, 1, %4) do (
    rmdir /s /q %~dp0AIMP\Profile >nul 2>&1
    start "" "%aimp%" "%~dp0_records\%1"

    echo ====================
    echo START...
    timeout /t %2

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

echo 0 > %switch_path%
echo [%date% %time%] DL-REP STOP >> %~dp0_log.txt