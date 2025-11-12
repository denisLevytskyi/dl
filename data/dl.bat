rem %1 - имя файла
rem %2 - тишина до воспроизведения
rem %3 - тишина после воспроизведения

echo [%date% %time%] DL START %1 %2 %3 >> %~dp0_log.txt

set mpg123=%~dp0MPG123\MPG123.exe
set switch=%~dp0switch.bat
set switch_path=%~dp0var_switch.txt

:loop
set /p switch_text=<%switch_path%
if %switch_text%==1 (
    echo ====================
    echo LINE IS NOT FREE, WAIT...
    echo [%date% %time%] LINE IS NOT FREE, WAIT >> %~dp0_log.txt
    timeout /t 5 >nul 2>&1
    goto loop
) else (
    echo ====================
    echo LINE IS FREE...
    echo [%date% %time%] LINE IS FREE >> %~dp0_log.txt
)
echo 1 > %switch_path%

echo ====================
echo START...
start "" /min %switch%
timeout /t %2 >nul 2>&1

echo ====================
echo GO...
%mpg123% "%~dp0_records\%1" >nul 2>&1

echo ====================
echo END...
timeout /t %3 >nul 2>&1

echo 0 > %switch_path%
echo [%date% %time%] DL STOP >> %~dp0_log.txt