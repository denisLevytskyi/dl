rem %1 - имя файла
rem %2 - ожидание загрузки
rem %3 - длительность воспроизведения
rem %4 - тишина после воспроизведения

echo [%date% %time%] DL START %1 %2 %3 %4 >> %~dp0_log.txt

set aimp=%~dp0AIMP\AIMP.exe
set switch=%~dp0switch.bat
set switch_path=%~dp0var_switch.txt

rmdir /s /q %~dp0AIMP\Profile >nul 2>&1
start "" "%aimp%" "%~dp0_records\%1"
start "" %switch%

echo ====================
echo START...
timeout /t %2

echo ====================
echo GO...
timeout /t %3

taskkill /Im AIMP.exe /f /T >nul 2>&1
rmdir /s /q %~dp0AIMP\Profile >nul 2>&1

echo ====================
echo END...
timeout /t %4

echo 0 > %switch_path%
echo [%date% %time%] DL STOP >> %~dp0_log.txt