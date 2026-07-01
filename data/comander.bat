echo [%date% %time%] COMANDER START >> %~dp0_log.txt

set comander=%~dp0COMANDER\COMANDER.exe
set tg=%~dp0tg.bat

start "" /min %tg% COMANDER_START
start "" %comander%

echo ====================
echo COMANDER START...
timeout /t 10 >nul 2>&1