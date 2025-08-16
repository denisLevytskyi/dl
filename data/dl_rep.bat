rem %1 - имя файла
rem %2 - тишина до воспроизведения
rem %3 - кол-во повторов
rem %4 - тишина между повторами
rem %5 - тишина после воспроизведения

echo [%date% %time%] DL-REP START %1 %2 %3 %4 %5 >> %~dp0_log.txt

set mpg123=%~dp0MPG123\MPG123.exe
set switch=%~dp0switch.bat
set switch_path=%~dp0var_switch.txt

echo ====================
echo START...
start "" /min %switch%
timeout /t %2 >nul 2>&1

setlocal enabledelayedexpansion
for /l %%i in (1, 1, %3) do (
    echo ====================
    echo STEP %%i / %3...
    %mpg123% "%~dp0_records\%1" >nul 2>&1

    echo ====================
    echo PAUSE %%i / %3...
    timeout /t %4 >nul 2>&1
)
endlocal

echo ====================
echo END...
timeout /t %5 >nul 2>&1

echo 0 > %switch_path%
echo [%date% %time%] DL-REP STOP >> %~dp0_log.txt